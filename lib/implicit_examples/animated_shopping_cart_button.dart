import 'package:flutter/material.dart';

class ShoppingCartButton extends StatefulWidget {
  const ShoppingCartButton({super.key});

  @override
  State<ShoppingCartButton> createState() => _ShoppingCartButtonState();
}

class _ShoppingCartButtonState extends State<ShoppingCartButton> {
  bool isShoppingCart = false;
  changeState() {
    setState(() {
      isShoppingCart = !isShoppingCart;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          width: isShoppingCart ? 80.0 : 300,
          height: 60.0,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: changeState,
                  icon: Icon(
                    isShoppingCart ? Icons.shopping_cart : Icons.check_box,
                    color: Colors.white,
                  )),
              if (!isShoppingCart)
                AnimatedOpacity(
                    duration: const Duration(seconds: 2),
                    opacity: isShoppingCart ? 0 : 1,
                    child: const Text("Added to cart"))
            ],
          ),
        ),
      ),
    );
  }
}
