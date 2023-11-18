// ignore_for_file: avoid_print, library_private_types_in_public_api

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:gestion_de_flotte_mobile_app/screens/home_screen.dart';
import 'package:gestion_de_flotte_mobile_app/screens/login_screen.dart';
import 'package:gestion_de_flotte_mobile_app/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'providers/notification_provider.dart';
import 'providers/user_provider.dart';


@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Handling a background message: $message");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // Retrieve and print the FCM token
  FirebaseMessaging.instance
      .getToken()
      .then((value) => print('Firebase Token : $value'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => NotificationProvider()),
      ],
      child: MaterialApp(
        title: 'Login Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Poppins',
        ),
        home: const AuthWrapper(),
      ),
    );
  }
}

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  _AuthWrapperState createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  final AuthService authService = AuthService();
  bool initialized = false;

  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {
    await authService.getUserData(context);
    setState(() {
      initialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    FirebaseMessaging.instance.requestPermission();

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('notification : ${message.notification!.body}');
      Provider.of<NotificationProvider>(context, listen: false)
          .incrementNotificationCount();
    });

    var userProvider = Provider.of<UserProvider>(context, listen: false);
    return userProvider.user.token.isNotEmpty
        ? const HomeScreen()
        : const LoginPage();
  }
}
