import 'package:flutter/material.dart';
import '../../models/mission.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_buttomBar.dart';
import '../../utils/socket_manager.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;



class MissionPage extends StatefulWidget {
  final Mission mission;

  const MissionPage({required this.mission, Key? key}) : super(key: key);

  @override
  State<MissionPage> createState() => _MissionPageState();
}

class _MissionPageState extends State<MissionPage> {
  @override
  Widget build(BuildContext context) {
    var largeur = MediaQuery.of(context).size.width;
    var hauteur = MediaQuery.of(context).size.height;
    IO.Socket? socket = SocketManager.socket;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(hauteur / 5.5),
            child: const CustomAppBar()),
        body: Center(
          child: SizedBox(
            height: hauteur / 1.35,
            width: largeur,
            child: Card(
              margin: const EdgeInsets.fromLTRB(30, 50, 30, 80),
              elevation: 1,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Colors.black12,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Stack(children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: const Text(
                    'Informations : ',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo),
                  ),
                ),
                Positioned(
                  top: hauteur / 6.5,
                  left: largeur / 20,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Date : ',
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Heure : ',
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Départ : ',
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Destination : ',
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Véhicule : ',
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: hauteur / 6.5,
                  left: largeur / 2.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.mission.date,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.mission.heureDep,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.mission.lieuDep,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.mission.lieuArr,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '${widget.mission.vehicule!.type} ${widget.mission.vehicule!.marque}',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: hauteur / 2.2,
                  left: largeur / 4,
                  child: Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        socket!.emit('missionBegin', widget.mission.id);
                        print(widget.mission.id);
                      },
                      child: const Text(
                        "Départ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Poppins-Medium',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
        bottomNavigationBar: const NavBar(),
      ),
    );
  }
}
