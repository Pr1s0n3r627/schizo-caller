import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/caller_character.dart';
import '../screens/create_character.dart';
import '../services/call_scheduler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Box<CallerCharacter>? characterBox;
  bool isSilentMode = false;

  @override
  void initState() {
    super.initState();
    characterBox = Hive.box('characters');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schizo Caller'),
        actions: [
          IconButton(
            icon: Icon(isSilentMode ? Icons.volume_off : Icons.volume_up),
            onPressed: () {
              setState(() {
                isSilentMode = !isSilentMode;
                // Store the silent mode state
              });
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: characterBox?.length ?? 0,
        itemBuilder: (context, index) {
          final character = characterBox?.getAt(index) as CallerCharacter;
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(character.photo),
            ),
            title: Text(character.name),
            subtitle: Text(character.phoneNumber),
            onTap: () {
              // Trigger fake call from this character
              CallScheduler.scheduleRandomCall(character);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateCharacterScreen()),
          );
        },
      ),
    );
  }
}
