import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_store/pages/cart.dart';
import 'package:pet_store/pages/home.dart';
import 'package:pet_store/pages/profile.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  int selected_index = 0;

  final List<Widget> pages = [
    const HomePage(),
    const CatalogPage(),
    const CartPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Center(
              child: Text(
                'Store',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF141415),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFFF2F3F2),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.search,
                      color: Color(0XFF181B19),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        border: InputBorder.none,
                        isDense: true,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // Expanded(
            //   child: pages[selected_index],
            // ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selected_index,
        onTap: (index) {
          setState(() {
            selected_index = index;
          });
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
              color:
                  selected_index == 0 ? const Color(0xFFE8BE13) : Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Catalog',
            icon: Icon(
              Icons.menu_book_outlined,
              color:
                  selected_index == 1 ? const Color(0xFFE8BE13) : Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Cart',
            icon: Icon(
              Icons.shopping_cart,
              color:
                  selected_index == 2 ? const Color(0xFFE8BE13) : Colors.grey,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(
              Icons.person_rounded,
              color:
                  selected_index == 3 ? const Color(0xFFE8BE13) : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}