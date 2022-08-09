import 'package:cricket_app/pages/first_page.dart';
import 'package:flutter/material.dart';

import '../pages/second_page.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const DrawerHeader(child: Text('Menu'),),
          ),
          InkWell(
            child: const ListTile(
              title: Text('Page 1'),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FirstPage()),
              );
            },
          ),
          InkWell(
            child: const ListTile(
              title: Text('Page 2'),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
