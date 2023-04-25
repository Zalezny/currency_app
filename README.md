# currency_app

Przygotuj aplikację we Flutterze składającą się z:

Panelu wyboru waluty:

a. Waluty do wyboru: EUR, USD.

b. Po wyborze waluty otwiera się okno szczegółów danej waluty.

 Integracji z publicznym API NBP (http://api.nbp.pl/):

a. Pobieranie kursów średnich wybranej waluty wraz z datą obowiązywania kursu.

b. Listy kursów wybranej waluty z ostatnich 30 dni.

Widok szczegółów

- Okno prezentujące
 
   a. Bieżący kurs średni wybranej waluty do PLN
 
   b. Informację o dacie obowiązywania kursu
 
 - Możliwość wyświetlenia tabeli kursów z ostatnich 30 dni

Dodatkowo na + możliwość przedstawienia danych na wykresie

Aplikacja powinna się budować pod przynajmniej jedno środowisko Android lub iOS. 

Na co zwrócimy uwagę przy ocenie?

UX/UI
Stabilność działania

Czystość i czytelność kodu

Na + wykorzystanie repozytorium  

## Przedstawienie aplikacji

Aplikacja została podzielona na dwa ekrany: pierwszy pokazujący obecny kurs waluty EUR, USD. Zostały tutaj zaimplementowane shimmery oraz możliwość ponownego połączenia po odłączeniu od internetu oraz dialog o braku połączenia.

 <img src="https://user-images.githubusercontent.com/65240240/234219014-47dc5097-c84d-454b-b555-95ce640b466f.png" alt="main_page" style="width: 300px;"><img src="https://user-images.githubusercontent.com/65240240/234219022-35aa7168-f4a6-4990-9a2c-5f940443e942.png" alt="main_page_without_internet" style="width: 300px;"><img src="https://user-images.githubusercontent.com/65240240/234219000-45b50d5e-e547-4d16-bb8d-165f004a601b.png" alt="network_dialog" style="width: 300px;">


## Libraries

- bloc - management states of network
- get_it - dependency injection of service and connection classes
- http - reuqest 'GET' to api 
- flutter_bloc - widgets to implement bloc in Flutter
- flutter_svg - show svg picture
- animated_text_kit - animated text on the start page
- fl_chart - create chart for flutter
- intl - convert date
- connectivity_plus - check connectivity network
- shimmer - load animate when wait on data api
- meta - for @immutable annonation in bloc
