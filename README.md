# Wymagana dokumentacja 

## 1. Charakterystyka oprogramowania:
- Nazwa skrócona: `SentimentAnalyzer`
- Nazwa pełna: `Aplikacja do analizy sentymentu tweetów`
- Krótki opis z wskazaniem celów: 
   Aplikacja `SentimentAnalyzer` ma na celu przeprowadzić analizę sentymentu 100 ostatnich tweetów zawierających słowo podane przez użytkownika. Backend aplikacji napisany jest w języku Python, korzysta z takich bibliotek jak: `snscrape.modules.twitter`, `pandas`, `transformers - AutoTokenizer`, `AutoModelForSequenceClassification`, `scipy.special - softmax`, `flask - request`, `flask`, `flask_cors - CORS`. Do frontendu użyto technologii Flutter umożliwiającej działanie webowe jak i aplikacje mobilne.

## 2. Prawa autorskie:
- Autorzy: Aplikacja została stworzona przez zespół programistów z firmy XYZ.
- Warunki licencyjne do oprogramowania wytworzonego przez grupę: Oprogramowanie jest własnością firmy XYZ i nie może być kopiowane lub dystrybuowane bez zgody firmy.

## 3. Specyfikacja wymagań:
### Funkcjonalne:
| Identyfikator | Nazwa | Opis | Priorytet | Kategoria |
| --- | --- | --- | --- | --- |
| `FR-001` | Wyszukiwanie tweetów | Użytkownik może wpisać słowo, po którym chce przeszukać ostatnie 100 tweetów. | `1` | Funkcjonalne |
| `FR-002` | Analiza sentymentu | Aplikacja powinna wykrywać sentyment tweetów (pozytywny, neutralny, negatywny). | `1` | Funkcjonalne |
| `FR-003` | Wyświetlanie wyników | Aplikacja powinna wyświetlać wyniki analizy sentymentu w formie procentowej oraz w postaci wykresu. | `1` | Funkcjonalne |

### Poza funkcjonalne:
| Identyfikator | Nazwa | Opis | Priorytet | Kategoria |
| --- | --- | --- | --- | --- |
| `NFR-001` | Bezpieczeństwo danych | Aplikacja powinna chronić dane użytkowników przed nieautoryzowanym dostępem. | `1` | Poza funkcjonalne |
| `NFR-002` | Czas odpowiedzi | Aplikacja powinna działać szybko i bez problemów. | `2` | Poza funkcjonalne |
| `NFR-003` | Dostępność | Aplikacja powinna być dostępna dla użytkowników z różnych urządzeń i przeglądarek internetowych. | `2` | Poza funkcjonalne |

