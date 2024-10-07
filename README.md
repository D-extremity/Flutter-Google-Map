# Flutter Google Maps App

This is a Flutter application that integrates Google Maps using **flutter_maps**, **BLoC**, and various plugins such as **Geolocator** and **Geocoder**. The app automatically detects the user's location or allows users to manually search for a location by entering an address. The location is displayed on the map with a marker.

## Features
- **Map Type can be Changed**: Bloc has been used to do state management while changing MapType.
- **Automatic Location Detection**: Uses `Geolocator` to detect and show the user's current location on the map.
- **Manual Location Search**: Allows users to enter an address manually and redirects the map to that location.
- **Marker Pinning**: Adds a marker (pin) to the location that is detected or searched.
- **BLoC for State Management**: Manages the app’s state using BLoC (Business Logic Component) for clean, maintainable code.
- **Request Handler**: Handles requests for fetching the location using address input.

## Key Dependencies
- **google_maps_flutter**: Integrates Google Maps in the Flutter app.
- **geolocator**: Used for getting the user’s current location.
- **geocoder**: Used to convert addresses into coordinates.
- **flutter_bloc**: For state management using the BLoC pattern.

## How It Works
- **Automatic Location Detection**: The app uses Geolocator to fetch the user’s current location, which is then displayed on the map with a marker.

- **Manual Address Search**: Users can manually enter an address in the search bar. The app uses Geocoder to fetch the corresponding coordinates and then updates the map to the searched location.

- **Marker Pinning**: After the location is detected (either automatically or through the search), a marker is added to that location to highlight it on the map.

## Getting Started

### Prerequisites
To run this project, ensure you have Flutter installed on your system. You can follow the [official Flutter installation guide](https://flutter.dev/docs/get-started/install) if needed.

1. **Flutter**: Version >= 3.0.0
2. **Google Maps API Key**: You'll need to enable Google Maps API in your Google Cloud Console and get an API key.

### Setup

1. Clone the repository:

```bash
   git clone https://github.com/D-extremity/Flutter-Google-Map.git
   cd Flutter-Google-Map
```

2. Install the necessary dependencies:

```bash
   flutter pub get
```

3. Setup API key:

```xml
<manifest ...>
  <application ...>
    <meta-data
        android:name="com.google.android.geo.API_KEY"
        android:value="YOUR_GOOGLE_MAPS_API_KEY"/>
  </application>
</manifest>
```

4. Run the App: After setting up the API keys and dependencies, run the app using:
```bash
    flutter run
```

## Glimpse of Application : 

<video controls src="video1.mp4" title="Glimpse 1"></video>
<video controls src="video2.mp4" title="Glimpse 2"></video>