# HA Ponk mobile app

An other [Home Assistant](https://www.home-assistant.io/) mobile dashboard application in Flutter.

## Dependencies
Here is a list of the main packages used in this application and a short reason for usaging them.

### Provider
The management of data flows to the UI is based on the [providers](https://pub.dev/packages/provider). To keep the simplest and most robust solution, I mainly use [notifiers](https://pub.dev/documentation/provider/latest/provider/ChangeNotifierProvider-class.html).
### GetIt
I use the [get_it](https://pub.dev/packages/get_it) package for instantiating the data source objects. This solution is particularly useful for the injection of mocks in our automated tests. Except the data sources, I generate all object instances by provider to stay as close as possible to the natural functioning of the widget tree. 

### Web socket

The app is connected to Home Assitant by websocket and I use the [web_socket_channel](https://pub.dev/packages/web_socket_channel) package for the implementation.
### Moor
The user datas are persisted in a locale database powered by [moor](https://pub.dev/packages/moor).
### Freezed
[Freezed](https://pub.dev/packages/freezed) is a "Nice to have" package witch provide features for object processing like "copyWith" method.

### HTTP request
- [Dio](https://pub.dev/packages/dio) the most used Http requester,
- [Retrofit](https://pub.dev/packages/retrofit) an api wrapper for simplify the request management.

## Technical architecture
We were inspired by the concepts of [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) to build a robust and scalable application. However, we have found a compromise to keep the architecture simple and readable.

### Main layers
The application is made up of three layers:
- **core**: provides the global objects necessary for the operation of the application
- **data**: is responsible for providing data from the different sources to the ui
- **ui**: contains all the visual part of the application

### Core layer
The core layer contain the global object of the application and the utilities classes as to manage the localization or the theme.

### Data layer
The data flows are grouped by domain or feature and here is the four folders structuring them from the sources to the UI.
- **datasources**
- **entities**
- **providers**
- **repositories**
### UI layer
The UI is organized by screen, which seems the most natural to me.
I designed the widget architecture inspired by the following concepts:
- **[SOLID](https://fr.wikipedia.org/wiki/SOLID_(informatique))**
- **Atomic design**