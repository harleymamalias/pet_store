import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';
import '../models/catalog.dart';

class CatDetails extends StatefulWidget {
  final CatalogModel cat;
  CatDetails({required this.cat});

  @override
  State<CatDetails> createState() => _CatDetailsState();
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

class _CatDetailsState extends State<CatDetails> {
  int selected_index = 1;
  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cat Information',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF141415),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: sizeHeight.height * 0.5,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                    colors: [Colors.white, Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.85, 0.2],
                  ),
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 1.05,
                  viewportFraction: 1.0,
                  autoPlay: true,
                  enableInfiniteScroll: false,
                ),
                items: widget.cat.catImagesCarousel.map((catImage) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(catImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }).toList(),
              ),
              Positioned(
                bottom: 15,
                left: 20,
                right: 20,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.16),
                        blurRadius: 4,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.cat.catName,
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF141415),
                                ),
                              ),
                              Text(
                                '${widget.cat.catOrigin} · ${widget.cat.dateAndTimePosted}',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: const Color(0xFF5F5F63),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            final cart =
                                Provider.of<CartModel>(context, listen: false);
                            final item = widget.cat;

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
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFE8BE13),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 0,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.shopping_cart_checkout,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.pets,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'About ${widget.cat.catName}',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF141415),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildInfoContainer(
                        'Weight', '${widget.cat.catWeight.toString()} kg'),
                    buildInfoContainer(
                        'Height', '${widget.cat.catHeight.toString()} cm'),
                    buildInfoContainer('Color', widget.cat.catColor.toString()),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  widget.cat.catDescription,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xFFA1A1A1),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: Hero(
        tag: 'Bottom Navigation Bar',
        child: BottomNavigationBar(
          currentIndex: selected_index,
          onTap: (index) {
            setState(() {
              selected_index = index;
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
                    selected_index == 0 ? const Color(0xFFE8BE13) : Colors.grey,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Catalog',
              icon: Icon(
                Icons.view_list,
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
      ),
    );
  }
}

Widget buildInfoContainer(String title, String value) {
  return Container(
    height: 65,
    width: 100,
    padding: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      color: const Color(0xFF98FF98).withOpacity(0.3),
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: const Color(0xFF141415),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFE8BE13),
          ),
          maxLines: 2,
        ),
      ],
    ),
  );
}
