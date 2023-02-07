import 'package:flutter/material.dart';
import 'package:get/get.dart';

class navigationBar extends GetView {
  navigationBar({Key? key}) : super(key: key);
  late int _currentIndex = 3;

  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      selectedIconTheme: IconThemeData(color: Colors.red),
      unselectedIconTheme: IconThemeData(color: Colors.black),
      onTap: (index) => () {
        _currentIndex = index;
      },
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.person_pin), label: 'profile'),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket), label: 'account'),
        BottomNavigationBarItem(icon: Icon(Icons.category), label: 'category'),
        BottomNavigationBarItem(icon: Icon(Icons.subject), label: 'sub')
      ],
    );
  }
}
