// ignore_for_file: use_build_context_synchronously, library_prefixes, avoid_print

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../models/reclamation.dart';
import '../providers/user_provider.dart';
import '../screens/Reclamation_screens/reclamations_list_screen.dart';
import '../utils/config.dart';
import '../utils/socket_manager.dart';
import '../utils/utils.dart';

class ReclamationService {
  Future<List<Reclamation>> getAllReclamations(BuildContext context) async {
    List<Reclamation> reclamationList = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var myToken = prefs.getString('token');
    try {
      if (myToken != null) {
        http.Response res = await http.get(Uri.parse(allReclamation), headers: {
          "Content-Type": "application/json",
          HttpHeaders.authorizationHeader: myToken,
        });

        httpErrorHandle(
            response: res,
            context: context,
            onSuccess: () async {
              for (int i = 0; i < jsonDecode(res.body).length; i++) {
                reclamationList.add(
                  Reclamation.fromJson(
                    jsonEncode(
                      jsonDecode(res.body)[i],
                    ),
                  ),
                );
              }
            });
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return reclamationList;
  }

  void addReclamation({
    required BuildContext context,
    required String type,
    required String description,
  }) async {
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    IO.Socket? socket = SocketManager.socket;
    final navigator = Navigator.of(context);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var myToken = prefs.getString('token');
    try {
      var reclamation = {"type": type, "description": description};
      if (myToken != null) {
        http.Response res = await http.post(
          Uri.parse(allReclamation),
          body: jsonEncode(reclamation),
          headers: {
            "Content-Type": "application/json",
            HttpHeaders.authorizationHeader: myToken,
          },
        );
        httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            showSnackBar(context, 'Réclamation Ajouter');
            navigator.pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const ReclamationsPage(),
              ),
              (route) => false,
            );
            socket!.emit("addReclamation", userProvider.user.matricule);
          },
        );
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
  void updateReclamation({
    required BuildContext context,
    required String id,
    required String type,
    required String description,
  }) async {
    final navigator = Navigator.of(context);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var myToken = prefs.getString('token');
    try {
      var reclamation = {"type": type, "description": description};
      if (myToken != null) {
        http.Response res = await http.patch(
          Uri.parse(editReclamation.replaceAll(':id', id)),
          body: jsonEncode(reclamation),
          headers: {
            "Content-Type": "application/json",
            HttpHeaders.authorizationHeader: myToken,
          },
        );
        httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            showSnackBar(context, 'Modifications Effectuer');
            navigator.pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const ReclamationsPage(),
              ),
                  (route) => false,
            );
          },
        );
      }
    } catch (e) {
      showSnackBar(context, e.toString());
      print(e.toString());
    }
  }
}
