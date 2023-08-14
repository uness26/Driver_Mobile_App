import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';
import '../services/auth_service.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}
void Logout(BuildContext context) {
  AuthService().signOut(context: context);
}

class _NavBarState extends State<NavBar> {
  var current_index = 0;
  final List<Widget> _pages = [
    const HomeScreen(),
    const ProfilePage(),
  ];
  void OnTapped(int index) async{
    setState(() {
      current_index = index;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => _pages[index]),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.indigo,
        onTap: OnTapped,
        index: 0,
        items:  <Widget>[
          const Icon(Icons.home_outlined, color: Colors.white, size: 30,),
          const Icon(Icons.account_circle_outlined, size: 30, color: Colors.white,),
          GestureDetector(
            onTap: (){
              Logout(context);
            },
              child: const Icon(Icons.logout_rounded, size: 30, color: Colors.white,))
        ]
    );
  }
}
