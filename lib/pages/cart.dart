import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';
import '../models/catalog.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Items'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cart.catItems.length,
                itemBuilder: (context, index) {
                  final item = cart.catItems[index];
                  return _buildCartItem(item);
                },
              ),
            ),
            const Divider(),
            _CartTotal(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
          if (index == 1) {
            GoRouter.of(context).go('/catalog');
          }
        },
        selectedLabelStyle: const TextStyle(color: Color(0xFFE8BE13)),
        selectedItemColor: const Color(0xFFE8BE13),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home,
              color: selectedIndex == 0 ? Color(0xFFE8BE13) : Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Catalog',
            icon: Icon(
              Icons.view_list,
              color: selectedIndex == 1 ? Color(0xFFE8BE13) : Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Cart',
            icon: Icon(
              Icons.shopping_cart,
              color: selectedIndex == 2 ? Color(0xFFE8BE13) : Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(
              Icons.person_rounded,
              color: selectedIndex == 3 ? Color(0xFFE8BE13) : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem(CatalogModel item) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 90,
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.16),
              blurRadius: 4,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Consumer<CartModel>(
          builder: (context, cart, child) {
            return ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.asset(
                  item.catImage,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(item.catName),
              subtitle: Text('Price: \$${item.catPrice}'),
              trailing: IconButton(
                icon: const Icon(
                  Icons.remove,
                  color: Colors.red,
                ),
                onPressed: () {
                  cart.remove(item);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var hugeStyle =
        Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 30);

    return SizedBox(
      height: 50,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CartModel>(
              builder: (context, cart, child) {
                return Text(
                  '\$${cart.totalPrice}',
                  style: hugeStyle,
                );
              },
            ),
            const SizedBox(width: 15),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Buying not supported yet.'),
                  ),
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.amber,
              ),
              child: const Text('BUY'),
            ),
          ],
        ),
      ),
    );
  }
}
