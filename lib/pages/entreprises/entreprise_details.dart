import 'package:aiya_pro/utils/requetes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'agents/agent.dart';
import 'entreprise_controller.dart';
import 'profile/profile.dart';
import 'states.dart/states.dart';

class EntrepriseDetails extends StatelessWidget {
  Map e;
  EntrepriseDetails(this.e, {super.key});
  //
  EntrepriseController entrepriseController = Get.find();
  //
  @override
  Widget build(BuildContext context) {
    //
    /**
     * {
     * id: 2, 
     * nom: Jojo, 
     * postnom: Jaja, 
     * prenom: Jiji, 
     * sexe: Homme, 
     * etatCivil: Célibataire, 
     * email: jojo@gmail.com, 
     * telephone: 123456789, 
     * adresse: Kinshasa, 12 selembao, av 37 Gombe, 
     * denomination: BarJo, 
     * adresseEtablissement: Kinshasa, selembao, 11eme rue cité-vert, 
     * provinceSiege: Kinshasa, 
     * typeEtablissement: Restaurant, 
     * categorie: Catégorie A, 
     * nombreEtablissement: 2, 
     * photo: null, 
     * codePromo: 11358141, 
     * motDePasse: pay0000, 
     * status: 0, 
     * rccm: null}
     */
    print(":: ${e['code']}");
    //
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("${e['denomination']}"),
          actions: [
            InkWell(
              onTap: () {
                //
                Get.dialog(
                  Center(
                    child: Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              "${Requete.url}/companie/profil.png?id=${e['id']}"),
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                child: Image.network(
                  "${Requete.url}/companie/profil.png?id=${e['id']}",
                  loadingBuilder: (context, child, loadingProgress) =>
                      (loadingProgress == null)
                          ? child
                          : const CircularProgressIndicator(),
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error),
                ),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            const TabBar(
              isScrollable: false,
              labelColor: Colors.black,
              tabs: [
                Tab(
                  child: Text("Entreprise"),
                ),
                Tab(
                  child: Text("Profile"),
                ),
                Tab(
                  child: Text("Admins"),
                ),
                Tab(
                  child: Text("States"),
                ),
              ],
            ),
            Expanded(
              flex: 1,
              child: TabBarView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: ListView(
                          children: [
                            ListTile(
                              title: const Text("Adresse"),
                              subtitle: Text("${e['adresseEtablissement']}"),
                              // trailing: IconButton(
                              //   onPressed: () {
                              //     //
                              //     var adresse = TextEditingController();
                              //     modifierInfo(e, context, adresse,
                              //         "adresseEtablissement");
                              //   },
                              //   icon: const Icon(Icons.edit),
                              // ),
                            ),
                            ListTile(
                              title: const Text("Entreprise"),
                              subtitle: Text("${e['denomination']}"),
                              // trailing: IconButton(
                              //   onPressed: () {
                              //     //
                              //     var dateNaissance = TextEditingController();
                              //     modifierInfo(e, context, dateNaissance,
                              //         "denomination");
                              //   },
                              //   icon: const Icon(Icons.edit),
                              // ),
                            ),
                            ListTile(
                              title: const Text("Adresse etablissement"),
                              subtitle: Text("${e['adresseEtablissement']}"),
                              // trailing: IconButton(
                              //   onPressed: () {
                              //     //
                              //     var dateNaissance = TextEditingController();
                              //     modifierInfo(e, context, dateNaissance,
                              //         "adresseEtablissement");
                              //   },
                              //   icon: const Icon(Icons.edit),
                              // ),
                            ),
                            ListTile(
                              title: const Text("Province"),
                              subtitle: Text("${e['provinceSiege']}"),
                              // trailing: IconButton(
                              //   onPressed: () {
                              //     //
                              //     var dateNaissance = TextEditingController();
                              //     modifierInfo(e, context, dateNaissance,
                              //         "provinceSiege");
                              //   },
                              //   icon: const Icon(Icons.edit),
                              // ),
                            ),
                            ListTile(
                              title: Text("rccm".toUpperCase()),
                              subtitle: Text("${e['rccm'] ?? ''}"),
                              // trailing: IconButton(
                              //   onPressed: () {
                              //     //
                              //     //var dateNaissance = TextEditingController();
                              //     //modifierInfo(e, context, dateNaissance, "dateNaissance");
                              //   },
                              //   icon: const Icon(Icons.edit),
                              // ),
                            ),
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   height: 50,
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Expanded(
                      //         flex: 4,
                      //         child: ElevatedButton(
                      //           onPressed: () {
                      //             //
                      //             //Get.to(StatAgent(e));
                      //             //
                      //           },
                      //           child: const Text("Stats"),
                      //         ),
                      //       ),
                      //       const SizedBox(
                      //         width: 5,
                      //       ),
                      //       Expanded(
                      //         flex: 4,
                      //         child: ElevatedButton(
                      //           onPressed: () {
                      //             //
                      //           },
                      //           style: ButtonStyle(
                      //             backgroundColor: MaterialStateProperty.all(
                      //                 Colors.red.shade900),
                      //           ),
                      //           child: const Text("Supprimer"),
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // )
                    ],
                  ),
                  Profile(),
                  Agent(e),
                  States()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  modifierInfo(
    Map e,
    BuildContext context,
    TextEditingController text,
    String nom,
  ) async {
    text.text = e[nom] ?? "";
    final formKey = GlobalKey<FormState>();
    // showDialog(
    //   context: context,
    //   builder: (c) {
    //     return AlertDialog(
    //       title: Text("${nom.capitalize}"),
    //       contentPadding: const EdgeInsets.all(5),
    //       content: Container(
    //         height: 200,
    //         width: 250,
    //         child: Form(
    //           key: formKey,
    //           child: Padding(
    //             padding: const EdgeInsets.all(20),
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.spaceAround,
    //               children: [
    //                 TextFormField(
    //                   controller: text,
    //                   decoration: InputDecoration(
    //                     border: OutlineInputBorder(
    //                       borderRadius: BorderRadius.circular(5),
    //                     ),
    //                     //prefixIcon: const Icon(Icons.person),
    //                     hintText: 'nom'.tr,
    //                     labelText: 'nom'.tr,
    //                   ),
    //                   validator: (value) {
    //                     if (value!.isEmpty) {
    //                       return 'nom_message'.tr;
    //                     }

    //                     return null;
    //                   },
    //                   onChanged: (value) {
    //                     //print("Password value $value");
    //                   },
    //                 ),
    //                 InkWell(
    //                   onTap: () {
    //                     e[nom] = text.text;
    //                     Get.dialog(
    //                       const Center(
    //                         child: SizedBox(
    //                           height: 40,
    //                           width: 40,
    //                           child: CircularProgressIndicator(),
    //                         ),
    //                       ),
    //                     );
    //                     entrepriseController.putData(e);
    //                     //Mise ) jour ici...
    //                   },
    //                   child: Padding(
    //                     padding: const EdgeInsets.only(
    //                       left: 20,
    //                       right: 20,
    //                       bottom: 2,
    //                     ),
    //                     child: Container(
    //                       alignment: Alignment.center,
    //                       height: 50,
    //                       padding: const EdgeInsets.only(
    //                         left: 20,
    //                         right: 20,
    //                         bottom: 2,
    //                       ),
    //                       decoration: BoxDecoration(
    //                         color: Colors.indigo.shade900,
    //                         borderRadius: BorderRadius.circular(10),
    //                         // gradient: LinearGradient(
    //                         //   begin: Alignment.centerLeft,
    //                         //   end: Alignment.centerRight,
    //                         //   colors: <Color>[Colors.yellow.shade700, Colors.black],
    //                         // ),
    //                       ),
    //                       child: Text(
    //                         "Enregistrer".tr,
    //                         style: const TextStyle(
    //                           color: Colors.white,
    //                           fontWeight: FontWeight.normal,
    //                           fontSize: 15,
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 )
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //     );
    //   },
    // );
  }
}

Future<List> getAllAdminOf(String id) async {
  Requete requete = Requete();
  Response response = await requete.getE("agents/all/$id");
  if (response.isOk) {
    return response.body;
  } else {
    return [];
  }
}
