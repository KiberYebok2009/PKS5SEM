import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/item_note.dart';
import 'package:flutter_application_1/pages/add_page.dart';
import 'package:flutter_application_1/pages/note_page.dart';
import 'package:flutter_application_1/models/note.dart';

// final List<String> notes = <String>['999₽', '999₽', '999₽', '999₽'];
// final List<String> urls = <String>['../yrod.webp', '../amnyam.webp', '../2.webp', '../4.webp'];
// final List<String> names = <String>['АМНЯМ 1', 'АМНЯМ 2', 'АМНЯМ 3', 'АМНЯМ 4'];
final List<Tovar> list = <Tovar>[Tovar(url:'../yrod.webp', price:'999₽', discription:'АМНЯМ 1')];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void _removeTovar(int index) {
    setState(() {
      list.removeAt(index);
    });
  }

  void _addTovar(Tovar tovar) {
    setState(() {
      list.add(tovar);
    });
  }

  // void _navigateToAddNoteScreen(BuildContext context) async {
  //   final result = await Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => AddPage(onAdd: _addTovar,tovar: list[index])),
  //   );
    
  //   if (result != null && result.isNotEmpty) {
  //     setState(() {
  //       list.add(result);
  //     });
  //   }
  // }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('АМНЯМЫ', style: TextStyle(fontSize: 24, color: Colors.white),),), backgroundColor: Colors.black,
      ),
      body: Padding(padding: const EdgeInsets.all(8),
        child: ListView.builder(
        padding: const EdgeInsets.all(8),
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => NotePage(tovar: list[index]),),
              ),
              child: ItemNote(
                tovar: list[index],
                onRemove: () => _removeTovar(index),),
              );
          },
        ),

        // TextButton(onPressed: (){
        //       Navigator.push(
        //         context, 
        //         MaterialPageRoute(builder: (context) => AddPage()),
        //       );
        //     },
        //   child: const Text('Добавить товар', style: TextStyle(fontSize: 18, color: Colors.white,),),),
      ), backgroundColor:  const Color.fromARGB(255, 139, 147, 255),

      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddPage(onAdd: _addTovar, tovar: list[0])),
          
      ),
      ),
    );
  }
}