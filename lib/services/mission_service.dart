// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/mission.dart';
import '../utils/config.dart';
import '../utils/utils.dart';

class MissionService {
  Future<List<Mission>> getAllMissions(BuildContext context) async {
    List<Mission> missionList = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var myToken = prefs.getString('token');
    try {
      if (myToken != null) {
        http.Response res = await http.get(Uri.parse(allMissions), headers: {
          "Content-Type": "application/json",
          HttpHeaders.authorizationHeader: myToken,
        });

        httpErrorHandle(
            response: res,
            context: context,
            onSuccess: () async {
              for (int i = 0; i < jsonDecode(res.body).length; i++) {
                missionList.add(
                  Mission.fromJson(
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
    return missionList;
  }
}
