# PL Dokumentacja 

## 1. Charakterystyka oprogramowania:
- Nazwa skrócona: `TweetThoughts`
- Nazwa pełna: `Aplikacja do analizy sentymentu tweetów`
- Krótki opis z wskazaniem celów: 
   Aplikacja `TweetThoughts` ma na celu przeprowadzić analizę sentymentu ostatnich 100 tweetów zawierających słowo wpisane przez użytkownika. Backend aplikacji napisany jest w języku Python, używa bibliotek takich jak `snscrape.modules.twitter`, `pandas`, `transformers - AutoTokenizer`, `AutoModelForSequenceClassification`, `scipy.special - softmax`, `flask - request`, `flask`, `flask_cors - CORS`. Do frontendu użyto technologii Flutter umożliwiającej działanie webowe jak i aplikacje mobilne.

## 2. Prawa autorskie:
- Autorzy: Aplikacja została stworzona przez zespół programistów z firmy XYZ.
- Warunki licencyjne do oprogramowania wytworzonego przez grupę: MIT

## 3. Specyfikacja wymagań:
### Funkcjonalne:
| Identyfikator | Nazwa | Opis | Priorytet | Kategoria |
| --- | --- | --- | --- | --- |
| `FR-001` | Wyszukiwanie tweetów | Użytkownik może wprowadzić wyrażenie, na podstawie którego chce znaleźć ostatnie 100 tweetów. | `1` | Funkcjonalne |
| `FR-002` | Analiza sentymentu | Aplikacja powinna wykrywać sentyment tweetów (pozytywny, neutralny, negatywny). | `1` | Funkcjonalne |
| `FR-003` | Wyświetlanie wyników | Aplikacja powinna wyświetlać wyniki analizy sentymentu w formie procentowej oraz w postaci wykresu. | `1` | Funkcjonalne |

### Poza funkcjonalne:
| Identyfikator | Nazwa | Opis | Priorytet | Kategoria |
| --- | --- | --- | --- | --- |
| `NFR-001` | Bezpieczeństwo danych | Aplikacja musi chronić dane użytkowników przed nieautoryzowanym dostępem. | `1` | Poza funkcjonalne |
| `NFR-002` | Czas odpowiedzi | Aplikacja powinna działać szybko i bezproblemowo. | `2` | Poza funkcjonalne |
| `NFR-003` | Dostępność | Aplikacja powinna być dostępna dla użytkowników korzystających z różnych urządzeń i przeglądarek internetowych. | `2` | Poza funkcjonalne |


# EN Documentation

## 1. Software Characteristics:
- Abbreviated name: `TweetThoughts`
- Full name: `Application for analyzing sentiment of tweets`
- Brief description with indication of goals: 
   The `TweetThoughts` application aims to analyze the sentiment of the latest 100 tweets containing a word entered by the user. The backend of the application is written in Python and uses libraries such as `snscrape.modules.twitter`, `pandas`, `transformers - AutoTokenizer`, `AutoModelForSequenceClassification`, `scipy.special - softmax`, `flask - request`, `flask`, `flask_cors - CORS`. The frontend is built using Flutter technology, allowing for both web-based and mobile applications.

## 2. Copyright:
- Authors: The application was developed by a team of programmers from XYZ company.
- Licensing terms for software developed by the group: MIT

## 3. Requirements Specification:
### Functional:
| Identifier | Name | Description | Priority | Category |
| --- | --- | --- | --- | --- |
| `FR-001` | Tweet search | The user can enter a word to search for the latest 100 tweets containing that word. | `1` | Functional |
| `FR-002` | Sentiment analysis | The application should detect the sentiment of tweets (positive, neutral, negative). | `1` | Functional |
| `FR-003` | Display of results | The application should display the results of sentiment analysis in percentage form and in the form of a chart. | `1` | Functional |

### Non-Functional:
| Identifier | Name | Description | Priority | Category |
| --- | --- | --- | --- | --- |
| `NFR-001` | Data security | The application should protect user data from unauthorized access. | `1` | Non-Functional |
| `NFR-002` | Response time | The application should work quickly and without problems. | `2` | Non-Functional |
| `NFR-003` | Accessibility | The application should be accessible to users from different devices and internet browsers. | `2` | Non-Functional |
