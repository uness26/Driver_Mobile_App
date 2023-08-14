import 'package:flutter/material.dart';
import 'package:gestion_de_flotte_mobile_app/screens/Reclamation_screens/reclamation_details_screen.dart';

import '../../models/reclamation.dart';
import '../../services/reclamation_service.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_buttomBar.dart';
import '../../widgets/loader.dart';
import '../../widgets/reclamation_card_widget.dart';
import 'add_reclamation_screen.dart';

class ReclamationsPage extends StatefulWidget {
  const ReclamationsPage({Key? key}) : super(key: key);

  @override
  State<ReclamationsPage> createState() => _ReclamationsPageState();
}

class _ReclamationsPageState extends State<ReclamationsPage> {
  List<Reclamation>? reclamations;
  final ReclamationService reclamationService = ReclamationService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllReclamations();
  }

  getAllReclamations() async {
    reclamations = (await reclamationService.getAllReclamations(context)).cast<Reclamation>();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var hauteur = MediaQuery.of(context).size.height;
    return reclamations == null
        ? const Loader()
        : SafeArea(
          child: Scaffold(
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(hauteur / 5.5),
                  child: const CustomAppBar()),
              body: Padding(
                padding: const EdgeInsets.all(5),
                child: ListView.builder(
                    itemCount: reclamations!.length,
                    itemBuilder: (context, index) {
                      final data = reclamations![index];
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ReclamationDetails(reclamation: reclamations![index])));
                          },
                          child: ReclamationCard(
                              id: data.id!,
                              date: data.date!,
                              type: data.type,
                              etat: data.etat!,));
                    }),
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
                            builder: (context) => const AddReclamation()));
                  },
                  tooltip: 'Réclamer',
                  child: const Icon(
                    Icons.add_rounded,
                    size: 40,
                  ),
                ),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
              bottomNavigationBar: const NavBar(),
            ),
        );
  }
}
