// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fancy_containers/fancy_containers.dart';
import 'package:gestion_de_flotte_mobile_app/screens/profile_screen.dart';
import 'dart:developer';
import '../services/auth_service.dart';
import '../utils/socket_manager.dart';
import 'Reclamation_screens/reclamations_list_screen.dart';
import 'mission_screens/planning_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

void Logout(BuildContext context) {
  AuthService().signOut(context: context);
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeApp();
  }

  Future<void> initializeApp() async {
    await authService.getUserData(context);
    await SocketManager.initSocket(context);
  }

  @override
  Widget build(BuildContext context) {
    var largeur = MediaQuery.of(context).size.width;
    var hauteur = MediaQuery.of(context).size.height;
    log('largeur: $largeur');
    log('hauteur: $hauteur');

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: hauteur / 4,
            left: largeur / 20,
            child: FancyContainer(
              title: ' Missions',
              textColor: Colors.white,
              color1: Colors.indigo,
              color2: Colors.indigo,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PlanningPage()));
              },
            ),
          ),
          Positioned(
            top: hauteur / 2.3,
            left: largeur / 20,
            child: FancyContainer(
              title: 'Réclamations',
              textColor: Colors.white,
              color1: Colors.indigo,
              color2: Colors.indigo,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ReclamationsPage()));
              },
            ),
          ),
          Positioned(
            top: hauteur / 1.62,
            left: largeur / 20,
            child: FancyContainer(
              title: 'Profile',
              textColor: Colors.white,
              color1: Colors.indigo,
              color2: Colors.indigo,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()));
              },
            ),
          ),
          Positioned(
            top: hauteur / 1.2,
            right: largeur / 15,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Logout(context);
                    },
                    icon: const Icon(
                      Icons.logout_rounded,
                      size: 40,
                      color: Colors.indigo,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
