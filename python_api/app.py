import snscrape.modules.twitter as sntwitter
import pandas as pd
from transformers import AutoTokenizer, AutoModelForSequenceClassification
from scipy.special import softmax
from flask import Flask, request
from flask_cors import CORS


app = Flask(__name__)
cors = CORS(app)

@app.route("/test")
def test():
    query = request.args.get("query", default="bitcoin")
    tweets=[]
    limits=20
    tweet_word=[]
    wynik=0
    roberta = "cardiffnlp/twitter-roberta-base-sentiment"
    model = AutoModelForSequenceClassification.from_pretrained(roberta)
    tokenizer = AutoTokenizer.from_pretrained(roberta)
    labels=['Negative', 'Neutral', 'Positive']

    for tweet in sntwitter.TwitterSearchScraper(query + " lang:en").get_items():
        # print(vars(tweet))
        # break
        if len(tweets) == limits:
            break
        else:
            tweets.append([tweet.rawContent])

    # df = pd.DataFrame(tweets, columns=['Tweet'])
    # print(df)

    for i in range(len(tweets)):
        tweet = str(tweets[i])
        for word in tweet.split(' '):
            if word.startswith('@') and len(word) > 1:
                word = '@user'
            elif word.startswith('http'):
                word='http'
            tweet_word.append(word)
        tweet_proc = " ".join(tweet_word)
        # print(tweet_proc)
        

        
        encoded_tweet = tokenizer(tweet_proc, return_tensors='pt', max_length=512, truncation=True,) 
        output = model(**encoded_tweet)
        scores = output[0][0].detach().numpy()
        scores = softmax(scores)
        wynik += scores
        # for i in range(len(scores)):
        #     l = labels[i]
        #     s = scores[i]
        #     print(l,s)

    sentiment=wynik/limits
        
    return {
        "Fraza": query,
        labels[0]: str(sentiment[0]),
        labels[1]: str(sentiment[1]),
        labels[2]: str(sentiment[2])
    }