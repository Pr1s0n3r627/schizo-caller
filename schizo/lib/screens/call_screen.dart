import 'package:flutter/material.dart';
import '../models/caller_character.dart';
import '../utils/audio_handler.dart';

class CallScreen extends StatelessWidget {
  final CallerCharacter character;

  CallScreen({required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(character.image),
              radius: 50,
            ),
            SizedBox(height: 20),
            Text(character.name, style: TextStyle(fontSize: 24)),
            Text(character.phoneNumber, style: TextStyle(fontSize: 18)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  child: Text('Answer'),
                  onPressed: () {
                    AudioHandler.playAudio(character.ringtone);
                    // Navigate to call answered UI
                  },
                ),
                ElevatedButton(
                  child: Text('Decline'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
