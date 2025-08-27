# user_directory

This is an extremmely siple app demonstrating the use of the Flutter framework to create a cross-platform mobile app (IOS+ Android).

This app also aims at showcasing the following:

- The power of Flutter to generate NATIVE apps for both platforms from a single source code
- The skills of the software engineer who created the code, showcasing a code that is clean, organized, esay to mantain and that follows the best pratices applied by the developper's community around the world.
- The code keeps separation between the different layers of the app to make easy to be mantained ( UI / business logic / state)

# Project Set Up

This is a standard flutter codebase. Therefore in order to interact with the code using an IDE and for running/debugging the app on a phone simulator you'll need to prepare your machine. You will need:

- Dart and the Flutter framework installed on your machine
- Android Studio installed on your machine
- XCode and the IOS Simulator (For testing the IOS App)
- An Android Emulator targetting the Android API 33 or higher (For testing the Android APP)

# How to run the app in the emulator:

Firstly you need to start the emulator that you intend to use,

Then, enter the directory where the code is ( user_directory ) and run the following command:

```shell
flutter run
```

This will cause flutter to run the app in the simluator. If you have more then one emulator or a phone connected to the computer Flutter will prompt you to choose one of them before it proceedes with the execution.

# APP RELEASE

For Android and IOS app distribution is made throught the ofcials app stores, Apple Store and Play Store.

We need to pack and sign the app, upload it to Apple, fill up a bunch of formularies inside the developpers account portal and wait for the approval. Usually some changes are requested and resubmission is required.

In order to generate an app release (the installable that can be distributed to the users), we to make a few adjustments on the "android" folder and in the "ios" folder. Mainly, to set up our signing key, logo and a few other details.

After that we can run the following commands:

### For Android

```shell
flutter build apk
```

### For IOS

```shell
flutter build ios
```

After a succesful completion of the app generation flutter will show a message on the console saying what in what folder the created app was saved.
