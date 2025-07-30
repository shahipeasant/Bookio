import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(0xfff4d75e),
      ),
      child: Column(
        children: [
          Container(
            height: 200,
            padding: EdgeInsets.all(16),
            color: Colors.white,
            child: Stack(
              children: [

              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child:
            Column(
              children: [
                Text(
                  'Fundamentals of Physics',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
