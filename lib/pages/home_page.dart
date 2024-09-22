import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/item_note.dart';
import 'package:flutter_application_1/pages/note_page.dart';

final List<String> notes = <String>['АМНЯМ 1', 'АМНЯМ 2', 'АМНЯМ 3', 'АМНЯМ 4'];
final List<String> urls = <String>['../yrod.webp', '../amnyam.webp', '../2.webp', '../4.webp'];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('АМНЯМЫ', style: TextStyle(fontSize: 24, color: Colors.white),),), backgroundColor: Colors.black,
      ),
      body: Padding(padding: const EdgeInsets.all(8),
        child: ListView.builder(
        padding: const EdgeInsets.all(8),
          itemCount: notes.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => NotePage(titleNote: notes[index], textNote: urls[index],)),
              ),
              child: ItemNote(titleNote: notes[index], textNote: urls[index],),);
          },
        ),
      ), backgroundColor: const Color.fromARGB(255, 91, 173, 43),
    );
  }
}