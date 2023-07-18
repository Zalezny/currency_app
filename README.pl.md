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

Aplikacja została podzielona na dwa ekrany: pierwszy pokazujący obecny kurs waluty EUR, USD. Zostały tutaj zaimplementowane zależnie od zwracanego stanu z architektury Bloc (Loading, Success, Failed) pojawia się odpowiednio : Shimmersy (bez przycisku "Refresh"), UI zgodne z danymi pobranymi z API, Shimmersy z przyciskiem "Refresh"

 <img src="https://user-images.githubusercontent.com/65240240/234219014-47dc5097-c84d-454b-b555-95ce640b466f.png" alt="main_page" style="width: 300px;"><img src="https://user-images.githubusercontent.com/65240240/234219022-35aa7168-f4a6-4990-9a2c-5f940443e942.png" alt="main_page_without_internet" style="width: 300px;"><img src="https://user-images.githubusercontent.com/65240240/234219000-45b50d5e-e547-4d16-bb8d-165f004a601b.png" alt="network_dialog" style="width: 300px;">
 
 Po wybraniu waluty przechodzi się na stronę z wykresem oraz tabelą z ostatnich 30 dni. Tutaj także zostały zastosowane shimmery do ładowania treści oraz dialog pokazujący się po odłączeniu od internetu. Pierwszy screen pokazuje stronę, a drugi gdy nie ma internetu (oczywiście shimmery są animowane). Po kliknięciu na dany punkt na wykresie pojawia się kreska wskazująca datę oraz pokazuje się informacja o wartości danego punktu
 
 <img src="https://user-images.githubusercontent.com/65240240/234222134-5c673c62-554c-4122-998a-70904d72791f.png" alt="currency_page" style="width: 300px;"><img src="https://user-images.githubusercontent.com/65240240/234224721-2f12ec56-3e89-4099-be38-23002868d3f2.png" alt="currency_page__wtih_dot" style="width: 300px;"><img src="https://user-images.githubusercontent.com/65240240/234222154-590b4c2b-8de1-40b6-a9b5-bbc73563b261.png" alt="currency_page_without_internet" style="width: 300px;">

Chart został zrobiony za pomocą dependency fl_chart. Została stworzona osobna klasa "CalculatorY" do obliczania zakresu osi Y oraz możliwości ustawienia defaultowych wartości (w przypadku braku internetu), które różnią się co do waluty. 

Zostały także zaimplementowane ikonki aplikacji dla Androida

## Kompatybilność

Aplikacja została sprawdzona na wersji API32 i API33. Aplikacja została także przetestowana na emulatorze IPhone 13 Pro na iOS 15.2

## Libraries

- bloc - management states of network
- get_it with injectable - dependency injection of service and connection classes
- http - request 'GET' to api 
- flutter_bloc - widgets to implement bloc in Flutter
- flutter_svg - show svg picture
- animated_text_kit - animated text on the start page
- fl_chart - create chart for flutter
- intl - convert date
- connectivity_plus - check connectivity network
- shimmer - load animate when wait on data api
- meta - for @immutable annonation in bloc
