import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/caller_character.dart';
import 'screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure everything is initialized

  // Initialize Hive only once, and check if the box is already open
  await Hive.initFlutter();
  Hive.registerAdapter(CallerCharacterAdapter()); // Register your Hive adapter

  if (!Hive.isBoxOpen('characters')) {
    await Hive.openBox<CallerCharacter>('characters'); // Open the 'characters' box if it's not already open
  }

  runApp(SchizoApp());
}

class SchizoApp extends StatelessWidget {
  const SchizoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Schizo Caller',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
