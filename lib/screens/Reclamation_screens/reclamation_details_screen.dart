import 'package:flutter/material.dart';
import 'package:gestion_de_flotte_mobile_app/screens/Reclamation_screens/update_reclamation.dart';

import '../../models/reclamation.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_buttomBar.dart';

class ReclamationDetails extends StatefulWidget {
  final Reclamation reclamation;

  const ReclamationDetails({required this.reclamation, Key? key})
      : super(key: key);

  @override
  State<ReclamationDetails> createState() => _ReclamationDetailsState();
}

class _ReclamationDetailsState extends State<ReclamationDetails> {
  @override
  Widget build(BuildContext context) {
    TextEditingController textController =
        TextEditingController(text: widget.reclamation.description);
    var hauteur = MediaQuery.of(context).size.height;
    var largeur = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(hauteur / 5.5),
            child: const CustomAppBar()),
        body: Center(
          child: SizedBox(
            height: hauteur / 1.2,
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
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: const Text(
                      'Détails : ',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo),
                    ),
                  ),
                  Positioned(
                      top: 80,
                      left: 30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Etat :',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Type :',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Date :',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Description :',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                  Positioned(
                      top: 81,
                      left: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.reclamation.etat!,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          Text(
                            widget.reclamation.type,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black45,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          Text(
                            widget.reclamation.date!,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black45,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                  Positioned(
                    top: 240,
                    left: 25,
                    width: 300,
                    child: Material(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadowColor: Colors.grey,
                      child: Container(
                        constraints: const BoxConstraints(maxHeight: 200),
                        child: SingleChildScrollView(
                          child: TextFormField(
                            keyboardType: TextInputType.multiline,
                            enabled: false,
                            controller: textController,
                            maxLines: 6,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: SizedBox(
          width: 80,
          height: 70,
          child: FloatingActionButton(
            backgroundColor: Colors.black45,
            elevation: 20,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UpdateReclamation(
                            reclamation: widget.reclamation,
                          )));
            },
            tooltip: 'Modifier',
            child: const Icon(
              Icons.mode_edit_outline_rounded,
              size: 30,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        bottomNavigationBar: const NavBar(),
      ),
    );
  }
}
