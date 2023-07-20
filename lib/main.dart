import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'views/home.dart';

void main() async {
  runApp(const MyApp());

  // Request camera permission
  PermissionStatus perm = await Permission.camera.request();
  if (perm.isPermanentlyDenied) {
    openAppSettings();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Class App',
      theme: ThemeData.dark(useMaterial3: true),
      home: const HomeView(),
    );
  }
}
