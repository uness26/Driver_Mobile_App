import 'package:flutter/material.dart';
import '../../models/mission.dart';
import '../../services/mission_service.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_buttomBar.dart';
import '../../widgets/loader.dart';
import '../../widgets/mission_card_widget.dart';
import 'mission_screen.dart';

class PlanningPage extends StatefulWidget {
  const PlanningPage({Key? key}) : super(key: key);

  @override
  State<PlanningPage> createState() => _PlanningPageState();
}

class _PlanningPageState extends State<PlanningPage> {
  List<Mission>? missions;
  final MissionService missionService = MissionService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllMissions();
  }

  getAllMissions() async {
    missions = (await missionService.getAllMissions(context)).cast<Mission>();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //var largeur = MediaQuery.of(context).size.width;
    var hauteur = MediaQuery.of(context).size.height;
    return missions == null
        ? const Loader()
        : SafeArea(
          child: Scaffold(
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(hauteur / 5.5),
                  child: const CustomAppBar()),
              body: Padding(
                  padding: const EdgeInsets.all(8),
                  child: GridView.builder(
                      itemCount: missions!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        final data = missions![index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MissionPage(mission: missions![index])));
                          },
                          child: MissionCard(
                              id: data.id!,
                              heureDep: data.heureDep,
                              date: data.date,
                              depart: data.lieuDep,
                              destination: data.lieuArr),
                        );
                      })),
              bottomNavigationBar: const NavBar(),
            ),
        );
  }
}
