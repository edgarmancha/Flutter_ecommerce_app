import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopmk/screens/cart.dart';
import 'package:shopmk/utils/utils.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final Widget? centerImage;
  final Color? backgroundColor;
  final double? elevation;

  const MyAppBar({
    super.key,
    required this.title,
    this.leading,
    this.actions,
    this.centerImage,
    this.backgroundColor,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: 10,
              width: 10,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  // borderRadius: BorderRadius.circular(500),
                  image:
                      DecorationImage(image: AssetImage('assets/kaweng.png'))),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title!,
                style: SafeGoogleFont(
                  'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
              tooltip: 'search',
              onPressed: () {
                // handle the press
              },
            ),
            Stack(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.shopping_bag,
                    color: Colors.black,
                  ),
                  tooltip: 'cart',
                  onPressed: () {
                    Navigator.pushNamed(context, '/cart');
                  },
                ),
                Consumer<CartModel>(
                  builder: (context, cartModel, child) {
                    return Positioned(
                      right: 0,
                      top: 5,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.indigo,
                        ),
                        child: Text(
                          '${cartModel.cartItemCount}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
