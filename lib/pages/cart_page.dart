import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/cart_item.dart';
// import 'package:flutter_application_1/pages/note_page.dart';
import 'package:flutter_application_1/models/cart_model.dart';

final List<CartModel> cart = <CartModel>[
  CartModel(url:'../amnyam.webp', price:'999', count: 1), 
  CartModel(url:'../4.webp', price:'9999', count: 1)
];

// final List<int> count = <int> [0, 0];

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  void _add(index) {
    setState(() {
        CartModel temp = CartModel(
          url: cart[index].url, 
          price: cart[index].price,
          count: cart[index].count + 1
        );

        cart[index] = temp;
    });
  }

  void _deleate(index) {
    setState(() {
      if (cart[index].count == 1) {
        cart.removeAt(index);
      }

      else {
        CartModel temp = CartModel(
          url: cart[index].url, 
          price: cart[index].price,
          count: cart[index].count - 1
        );

        cart[index] = temp;
      }
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
              cart: cart[index], 
              onAdd: () => _add(index),
              onDeleate: () => _deleate(index),
            );
          },
        ),
      ),
    );
  }
}