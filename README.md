# currency_app

[![en](https://img.shields.io/badge/lang-en-yellow.svg)](https://github.com/Zalezny/currency_app/edit/readmes/README.md)
[![pl](https://img.shields.io/badge/lang-pl-red.svg)](https://github.com/Zalezny/currency_app/blob/readmes/README.pl.md)

Prepare a Flutter application consisting of:

Currency selection panel:

a. Currency options: EUR, USD.

b. Upon selecting a currency, a window with details of that currency opens.

Integration with the public NBP API (http://api.nbp.pl/):

a. Retrieving the average exchange rates of the selected currency along with the date of validity.

b. Lists of exchange rates of the selected currency from the last 30 days.

Details view:

Window presenting:

a. Current average exchange rate of the selected currency to PLN.

b. Information about the date of validity of the exchange rate.

Ability to display a table of exchange rates from the last 30 days.

Additionally, as a plus, the ability to present data on a chart.

The application should be built for at least one Android or iOS environment.

What will be considered during evaluation?

UX/UI
Stability of operation

Cleanliness and readability of code

As a plus, utilization of a repository.

## Presentationn

The application has been divided into two screens: the first one displaying the current exchange rates for EUR and USD currencies. Depending on the state returned from the Bloc architecture (Loading, Success, Failed), the following elements appear accordingly: Shimmers (without the "Refresh" button), UI consistent with the data fetched from the API, Shimmers with the "Refresh" button.

 <img src="https://user-images.githubusercontent.com/65240240/234219014-47dc5097-c84d-454b-b555-95ce640b466f.png" alt="main_page" style="width: 300px;"><img src="https://user-images.githubusercontent.com/65240240/234219022-35aa7168-f4a6-4990-9a2c-5f940443e942.png" alt="main_page_without_internet" style="width: 300px;"><img src="https://user-images.githubusercontent.com/65240240/234219000-45b50d5e-e547-4d16-bb8d-165f004a601b.png" alt="network_dialog" style="width: 300px;">
 
After selecting a currency, you are redirected to a page displaying a chart and a table of the currency's performance over the past 30 days. Here, shimmers are also used to load the content, and a dialog appears when the internet connection is lost. The first screen shows the page, while the second screen appears when there is no internet connection (of course, the shimmers are animated). When you click on a specific point on the chart, a line indicating the date appears, along with information about the value of that particular point.
 
 <img src="https://user-images.githubusercontent.com/65240240/234222134-5c673c62-554c-4122-998a-70904d72791f.png" alt="currency_page" style="width: 300px;"><img src="https://user-images.githubusercontent.com/65240240/234224721-2f12ec56-3e89-4099-be38-23002868d3f2.png" alt="currency_page__wtih_dot" style="width: 300px;"><img src="https://user-images.githubusercontent.com/65240240/234222154-590b4c2b-8de1-40b6-a9b5-bbc73563b261.png" alt="currency_page_without_internet" style="width: 300px;">

The chart was created using the fl_chart dependency. A separate class called "CalculatorY" was implemented to calculate the range of the Y-axis and allow setting default values (in case of no internet connection) that vary depending on the currency.

The application icons have also been implemented for Android

## Compatibility

The application has been tested on API32 and API33 versions. Additionally, the application has been tested on the iPhone 13 Pro emulator running iOS 15.2.

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

