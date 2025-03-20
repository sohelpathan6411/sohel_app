# sohel_app

Flutter Version: 3.27.3

## Description

Implement the Get Started screen, My Subscriptions screen, and the Bottom Sheet.

## Installation
Follow these steps to get your development environment set up:

1. Clone this repository:
   ```bash
   git clone https://github.com/sohelpathan6411/sohel_app.git
   ```
2. Navigate into the project directory:
   ```bash
   cd sohel_app
   ```
3. Make sure you have Flutter installed. If not, you can install it by following the instructions on the [Flutter website](https://flutter.dev/docs/get-started/install).
4. Install the necessary dependencies:
   ```bash
   flutter pub get
   ```
5. Run the app:
   ```bash
   flutter run
   ```

**Note:** If you're using an Android device or an iOS simulator, make sure you have the correct emulators set up.

## Usage
Once the app is running, you can use the following features:
- Get Started Screen with basic animation
- Subscription List with dimissible card to delete item.
- Add item with Bottom sheet

For more details on how to navigate the app.

## Features
- Hive - for local storage of items

## Folder Structure
```bash
assets
├── Figma.png
├── HBO_Max.png
└── Spotify.png
lib
├── consts
│   ├── app_consts.dart
│   └── routes.dart
├── main.dart
├── models
│   ├── subscription_model.dart
│   └── subscription_model.g.dart
├── providers
│   └── subscription_provider.dart
├── screens
│   ├── add_subscription_bottom_sheet.dart
│   ├── get_started_screen.dart
│   └── my_subscriptions_screen.dart
└── widgets
    ├── custom_button_widget.dart
    ├── list_item_widget.dart
    └── logo_widget.dart
```