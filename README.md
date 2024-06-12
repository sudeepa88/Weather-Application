# Weather App

## Overview
The Weather App is an iOS application that provides weather updates for a specified city or the user's current location. It leverages the OpenWeatherMap public API for fetching weather data and utilizes CLLocation for geographical location services. The user interface is designed using UIKit and programmatically built screens.

## User Interface
- **Main Screen**
  - **Text Input:** Enter the city name to fetch the weather data.
  - **Fetch Weather Button:** Retrieves weather data for the specified city.
  - **Current Location Button:** Fetches weather data based on the user's current geographical location.

## Functionality
- **UIKit:** The screens and user interface elements are created programmatically using UIKit.
- **OpenWeatherMap API:** This public API is used to fetch weather data.
- **Error Handling:** Displays a warning message if the entered city name is invalid.
- **CLLocation:** Used for retrieving the user's current geographical location.
- **URLSession:** Employed for making network requests to fetch weather data.

## How to Run the App
1. **Unzip the File:** Extract the contents of the downloaded zip file.
2. **Open the Project:** Locate `DemoWeather.xcodeproj` in the unzipped folder and open it with Xcode.
3. **Choose the Simulator:** Select a desired simulator from Xcode's device options.
4. **Run the App:** Hit the 'Run' button in Xcode to build and launch the application on the selected simulator.

