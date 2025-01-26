import 'package:flutter/material.dart';

class MenuBottom extends StatelessWidget {
  const MenuBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.green,
      onTap: (int index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/');
            break;
          case 1:
            Navigator.pushNamed(context, '/bmi');
            break;
        }
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.white,), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.monitor_weight, color: Colors.white,), label: 'BMI'),
      ],
      unselectedItemColor: Colors.white, unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
    );
  }
}
