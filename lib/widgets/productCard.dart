import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.5),
      child: Container(
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
              child: Stack(children: []),
            ),
            Padding(
              padding: EdgeInsets.all(2.5),
              child: ListTile(
                title: Text(
                  'Fundamentals of Physics',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(fontSize: 14),
                ),
                subtitle: Text(
                  'Halliday, Resnick and Krane',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Chip(
                  label: Text('Physics'),
                  backgroundColor: Color(0xfff4d75e),
                ),
                Chip(
                  label: Text('Dhaka'),
                  backgroundColor: Color(0xfff4d75e),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
