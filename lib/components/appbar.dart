import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function onPressed;

  CustomAppBar({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: GoogleFonts.lemon(
          fontSize: 24,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 13, 67, 246),
      leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(
            Icons.shopping_cart_sharp,
            color: Color.fromARGB(255, 255, 255, 255),
            size: 24,
          ),
          onPressed: () => onPressed(),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
