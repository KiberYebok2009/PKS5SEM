import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/cart_item.dart';
// import 'package:flutter_application_1/pages/note_page.dart';
import 'package:flutter_application_1/models/note.dart';

final List<Tovar> cart = <Tovar>[
  Tovar(url:'../amnyam.webp', price:'999₽', discription:'АМНЯМ 1'), 
  Tovar(url:'../4.webp', price:'9999₽', discription:'АМНЯМ 2')
];

// final List<int> count = <int> [0, 0];

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  void _add(Tovar tovar) {
    setState(() {
      cart.add(tovar);
    });
  }

  void _deleate(Tovar tovar) {
    setState(() {
      cart.remove(tovar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Корзина', style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      backgroundColor: Colors.black,
      ),
      backgroundColor:  const Color.fromARGB(255, 139, 147, 255),
      body: Padding(padding: const EdgeInsets.all(8),
        child: ListView.builder(
        padding: const EdgeInsets.all(8),
          itemCount: cart.length,
          itemBuilder: (BuildContext context, int index) {
            return CartItem(
              tovar: cart[index], 
              onAdd: () => _add(cart[index]),
              onDeleate: () => _deleate(cart[index]),
            );
          },
        ),
      ),
    );
  }
}