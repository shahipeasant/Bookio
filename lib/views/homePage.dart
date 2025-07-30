import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4ebc3),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5.0,
        ),
        itemCount: 20,
        itemBuilder: (context, index) {
          return
            Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Color(0xfff4d75e),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ListTile(
                title: Text('Main Title'),
                subtitle: Text('Here are some more text'),
              ),
            );
        },
      ),
    );
  }
}
