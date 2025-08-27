import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  final VoidCallback onLeftPressed;
  final VoidCallback onCenterPressed;
  final VoidCallback onRightPressed;

  const CustomBottomBar({
    super.key,
    required this.onLeftPressed,
    required this.onCenterPressed,
    required this.onRightPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Bottom bar background
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  offset: const Offset(0, -1),
                  blurRadius: 8,
                ),
              ],
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.home),
                  onPressed: onLeftPressed,
                ),
                const SizedBox(width: 60), // space for center button
                IconButton(
                  icon: const Icon(Icons.person),
                  onPressed: onRightPressed,
                ),
              ],
            ),
          ),
          // Center button
          Positioned(
            top: -20,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: onCenterPressed,
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(0, 6),
                        blurRadius: 10,
                      ),
                      BoxShadow(
                        color: Colors.blueAccent.withOpacity(0.5),
                        offset: const Offset(0, 0),
                        blurRadius: 8,
                        spreadRadius: 1,
                      ),
                    ],
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.blueAccent, Colors.blue],
                    ),
                  ),
                  child: const Icon(
                    Icons.qr_code,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
