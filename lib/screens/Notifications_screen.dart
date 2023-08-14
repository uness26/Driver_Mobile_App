import 'package:flutter/material.dart';
import 'package:gestion_de_flotte_mobile_app/screens/mission_screens/planning_screen.dart';
import 'package:gestion_de_flotte_mobile_app/widgets/notification_card_widget.dart';
import 'package:provider/provider.dart';
import '../providers/notification_provider.dart';
import '../widgets/custom_appbar.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {

  @override
  Widget build(BuildContext context) {
    var hauteur = MediaQuery
        .of(context)
        .size
        .height;
    var notificationProvider = Provider.of<NotificationProvider>(context);

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(hauteur / 5.5),
          child: const CustomAppBar()),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: ListView.builder(
            itemCount: notificationProvider.total,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PlanningPage()));
                  },
                  child: const NotificationCard(message: "test"));
            }),
      ),
    );
  }
}
