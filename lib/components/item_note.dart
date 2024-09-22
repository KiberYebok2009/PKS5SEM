import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/note_page.dart';

class ItemNote extends StatelessWidget {
  const ItemNote({super.key, required this.titleNote, required this.textNote});

  final String titleNote;
  final String textNote;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.25,
        decoration: BoxDecoration(color: Colors.purple, borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(titleNote, style: TextStyle(fontSize: 24, color: Colors.white),),
            Image.asset(textNote, height: 115, width: 115,),
            TextButton(onPressed: (){
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => NotePage(titleNote: titleNote, textNote: textNote,)),
              );
            },
            child: const Text('Читай, нигер, читай', style: TextStyle(fontSize: 18, color: Colors.white),),),
          ],
        ),
      ),
    );
  }
}