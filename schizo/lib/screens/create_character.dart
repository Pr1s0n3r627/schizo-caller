import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/caller_character.dart';

class CreateCharacterScreen extends StatefulWidget {
  @override
  _CreateCharacterScreenState createState() => _CreateCharacterScreenState();
}

class _CreateCharacterScreenState extends State<CreateCharacterScreen> {
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  String selectedImage = '';
  String selectedRingtone = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create New Character')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Character Name'),
            ),
            TextField(
              controller: phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            // Image selection and ringtone selection goes here
            ElevatedButton(
              child: Text('Create Character'),
              onPressed: () {
                final newCharacter = CallerCharacter(
                  name: nameController.text,
                  phoneNumber: phoneNumberController.text,
                  image: selectedImage,
                  ringtone: selectedRingtone,
                );
                Hive.box('characters').add(newCharacter);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
