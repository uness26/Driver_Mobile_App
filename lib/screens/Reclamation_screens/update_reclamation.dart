import 'package:flutter/material.dart';

import '../../models/reclamation.dart';
import '../../services/reclamation_service.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_buttomBar.dart';

class UpdateReclamation extends StatefulWidget {
  final Reclamation reclamation;

  const UpdateReclamation({required this.reclamation, Key? key})
      : super(key: key);

  @override
  State<UpdateReclamation> createState() => _UpdateReclamationState();
}

class _UpdateReclamationState extends State<UpdateReclamation> {
  final ReclamationService reclamationService = ReclamationService();
  late String? selectedType = widget.reclamation.type;
  late TextEditingController textController =
      TextEditingController(text: widget.reclamation.description);


  @override
  Widget build(BuildContext context) {
    final String id = widget.reclamation.id!;
    var hauteur = MediaQuery.of(context).size.height;
    var largeur = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(hauteur / 5.5),
            child: const CustomAppBar()),
        body: ListView(
          children: [
            Center(
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
                  child: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: const Text(
                          'Réclamation : ',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo),
                        ),
                      ),
                      const Positioned(
                        top: 80,
                        left: 30,
                        child: Text(
                          'Type :',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Positioned(
                        top: 110,
                        left: 30,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Radio(
                                  activeColor: Colors.indigo,
                                  value: 'Retard',
                                  groupValue: selectedType,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedType = value as String?;
                                    });
                                  },
                                ),
                                const Text(
                                  'Retard',
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                  activeColor: Colors.indigo,
                                  value: 'Abcense',
                                  groupValue: selectedType,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedType = value as String?;
                                    });
                                  },
                                ),
                                const Text(
                                  'Abcense',
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        top: 110,
                        left: 170,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Radio(
                                activeColor: Colors.indigo,
                                value: 'Incident',
                                groupValue: selectedType,
                                onChanged: (value) {
                                  setState(() {
                                    selectedType = value as String?;
                                  });
                                },
                              ),
                              const Text(
                                'Incident',
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w600),
                              ),
                            ]),
                            Row(
                              children: [
                                Radio(
                                  activeColor: Colors.indigo,
                                  value: 'Autres',
                                  groupValue: selectedType,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedType = value as String?;
                                    });
                                  },
                                ),
                                const Text(
                                  'Autres',
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        top: 220,
                        left: 25,
                        width: 300,
                        child: Material(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          shadowColor: Colors.grey,
                          child: TextFormField(
                            controller: textController,
                            maxLines: 6,
                            decoration: const InputDecoration(
                              label: Text(
                                'Description',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: hauteur / 2,
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
                              reclamationService.updateReclamation(
                                  context: context,
                                  id: id,
                                  type: selectedType!,
                                  description: textController.text);
                            },
                            child: const Text(
                              "Enregistrer",
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
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: const NavBar(),
      ),
    );
  }
}
