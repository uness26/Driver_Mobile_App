// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

/* ----- Colors ------ */

const Color transparent = Color(0x00000000);
const Color layerOneBg = Color(0x80FFFFFF);
const Color layerTwoBg = Color(0xFFE9FFF6);
const Color forgotPasswordText = Color(0xFF024335);
const Color signInButton = Color(0xFF024335);
const Color checkbox = Color(0xFF024335);
const Color signInBox = Color(0xFF024335);
const Color hintText = Color(0xFFB4B4B4);
const Color inputBorder = Color(0xFF707070);

/* API URLS */

const url = "http://1.0.2.2:5000/";
const login = '${url}users/login';
const logout = '${url}users/logout';
const userData = '${url}users/me';
const allMissions = '${url}missions';
const allReclamation = '${url}reclamations';
const editReclamation = '${url}reclamations/:id';
