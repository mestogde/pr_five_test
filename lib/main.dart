import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: const Text('Platform Notification'),
        ),
        body: const Center(
          child: PlatformNotification(),
        ),
      ),
    );
  }
}

class PlatformNotification extends StatelessWidget {
  const PlatformNotification({super.key});

  @override
  Widget build(BuildContext context) {
    String platformName = 'Unknown Platform';

    if (kIsWeb) {
      platformName = 'Web';
    } else if (Platform.isAndroid) {
      platformName = 'Android';
    } else if (Platform.isIOS) {
      platformName = 'iOS';
    } else if (Platform.isWindows) {
      platformName = 'Windows';
    }

    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Platform Notification'),
              content: Text('This app is running on $platformName.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close'),
                ),
              ],
            );
          },
        );
      },
      child: const Text('Show Platform'),
    );
  }
}
