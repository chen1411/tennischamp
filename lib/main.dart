import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import 'package:camera/camera.dart';
import 'screens/model_screen.dart';
import 'screens/tutorial_screen.dart';


List<CameraDescription> cameras;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error: $e.code\nError Message: $e.message');
  }
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tennis Champ',
      routes: {
        '/': (context) => HomeScreen(),
        '/tutorial': (context) => TutorialScreen(),
        '/practice': (context) => ModelScreen(cameras),
      }
    );
  }
}