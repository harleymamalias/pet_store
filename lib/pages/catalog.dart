import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_store/models/cart.dart';
import 'package:pet_store/pages/cat_details.dart';
import 'package:provider/provider.dart';

import '../models/catalog.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  int selectedIndex = 1;
  late TextEditingController _searchController;
  late List<CatalogModel> _filteredItems;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _filteredItems = CatalogModel.catCatalogItems;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterItems(String query) {
    setState(() {
      _filteredItems = CatalogModel.catCatalogItems
          .where((item) =>
              item.catName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _showSnackBar(
      BuildContext context, String message, Color color, IconData iconData) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        content: Row(
          children: [
            Icon(
              iconData,
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                message,
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 13),
              ),
            ),
          ],
        ),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFFF2F3F2),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.search,
                      color: Color(0XFF181B19),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      onChanged: _filterItems,
                      decoration: InputDecoration(
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xFF141415),
                        ),
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
            Expanded(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: _buildGridView(),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Hero(
        tag: 'Bottom Navigation Bar',
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
            if (index == 2) {
              GoRouter.of(context).go('/cart');
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
                color:
                    selectedIndex == 0 ? const Color(0xFFE8BE13) : Colors.grey,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Catalog',
              icon: Icon(
                Icons.view_list,
                color:
                    selectedIndex == 1 ? const Color(0xFFE8BE13) : Colors.grey,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Cart',
              icon: Icon(
                Icons.shopping_cart,
                color:
                    selectedIndex == 2 ? const Color(0xFFE8BE13) : Colors.grey,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(
                Icons.person_rounded,
                color:
                    selectedIndex == 3 ? const Color(0xFFE8BE13) : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridView() {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 20.0,
      mainAxisSpacing: 30.0,
      children: List.generate(_filteredItems.length, (index) {
        return Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.16),
                blurRadius: 4,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CatDetails(cat: _filteredItems[index]),
                    ),
                  );
                },
                child: Container(
                  height: 90,
                  width: 144,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage(_filteredItems[index].catImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                _filteredItems[index].catName,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF141415),
                ),
              ),
              GestureDetector(
                onTap: () {
                  final cart = Provider.of<CartModel>(context, listen: false);
                  final item = _filteredItems[index];

                  if (!cart.catItems.contains(item)) {
                    cart.add(item);
                    _showSnackBar(
                      context,
                      'Item added',
                      Colors.green,
                      Icons.check_circle,
                    );
                  } else {
                    _showSnackBar(
                      context,
                      'Item is already in the cart',
                      Colors.orange,
                      Icons.error_outline_rounded,
                    );
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${_filteredItems[index].catPrice.toString()}',
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFE8BE13),
                      ),
                    ),
                    const Icon(
                      Icons.add_shopping_cart_sharp,
                      size: 15,
                      color: Color(0xFFE8BE13),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
