import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hive/hive.dart';
import '../models/caller_character.dart';

class CreateCharacterPage extends StatefulWidget {
  const CreateCharacterPage({super.key});

  @override
  _CreateCharacterPageState createState() => _CreateCharacterPageState();
}

class _CreateCharacterPageState extends State<CreateCharacterPage> {
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  String? _selectedImageBase64; // Store image as base64

  // Image picker instance
  final ImagePicker _picker = ImagePicker();

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      // Convert the image to base64
      List<int> imageBytes = await imageFile.readAsBytes();
      String base64Image = base64Encode(imageBytes);

      setState(() {
        _selectedImageBase64 = base64Image;
      });
    }
  }

  // Function to create and save the character
  void _createCharacter() {
    final name = _nameController.text;
    final phoneNumber = _phoneNumberController.text;
    
    if (name.isNotEmpty && phoneNumber.isNotEmpty && _selectedImageBase64 != null) {
      final newCharacter = CallerCharacter(
        name: name,
        phoneNumber: phoneNumber,
        photo: _selectedImageBase64!, ringtone: '', // Save photo as base64
      );
      Hive.box<CallerCharacter>('characters').add(newCharacter);
      Navigator.pop(context); // Go back after saving
    } else {
      // Show error if any field is missing
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please complete all fields and add a photo!'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Character'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: _pickImage,
              child: _selectedImageBase64 == null
                  ? Container(
                      height: 150,
                      width: 150,
                      color: Colors.grey[300],
                      child: Icon(Icons.add_a_photo, size: 50),
                    )
                  : Image.memory(
                      base64Decode(_selectedImageBase64!),
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _createCharacter,
              child: Text('Create Character'),
            ),
          ],
        ),
      ),
    );
  }
}
