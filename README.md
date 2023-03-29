# pretty_good_cooking

A new Flutter project.

## Getting Started

Background notifications:
To do some logic or to change the screen when tapping on a notification use:
  - FirebaseMessaging.instance.getInitialMessage() <- when the app is terminated
  - FirebaseMessaging.onMessageOpenedApp.listen() <- when the app is in the background but not terminated

To display notifications when the app is in the foreground use 
