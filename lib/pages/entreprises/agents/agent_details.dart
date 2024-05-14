import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'agent_controller.dart';
import 'stats.dart';

class AgentDetails extends StatelessWidget {
  Map e;
  AgentDetails(this.e);
  //
  AgentController agentController = Get.find();
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: ListView(
              children: [
                ListTile(
                  title: const Text("Nom"),
                  subtitle: Text("${e['nom']}"),
                  trailing: IconButton(
                    onPressed: () {
                      //
                      var nom = TextEditingController();
                      modifierInfo(e, context, nom, "nom");
                    },
                    icon: const Icon(Icons.edit),
                  ),
                ),
                ListTile(
                  title: const Text("Postnom"),
                  subtitle: Text("${e['postnom']}"),
                  trailing: IconButton(
                    onPressed: () {
                      //
                      var postnom = TextEditingController();
                      modifierInfo(e, context, postnom, "postnom");
                    },
                    icon: const Icon(Icons.edit),
                  ),
                ),
                ListTile(
                  title: const Text("Prenom"),
                  subtitle: Text("${e['prenom']}"),
                  trailing: IconButton(
                    onPressed: () {
                      //
                      var prenom = TextEditingController();
                      modifierInfo(e, context, prenom, "prenom");
                    },
                    icon: const Icon(Icons.edit),
                  ),
                ),
                ListTile(
                  title: const Text("Email"),
                  subtitle: Text("${e['email']}"),
                  trailing: IconButton(
                    onPressed: () {
                      //
                      var email = TextEditingController();
                      modifierInfo(e, context, email, "email");
                    },
                    icon: const Icon(Icons.edit),
                  ),
                ),
                ListTile(
                  title: const Text("Telephone"),
                  subtitle: Text("${e['numero']}"),
                  trailing: IconButton(
                    onPressed: () {
                      //
                      var telephone = TextEditingController();
                      modifierInfo(e, context, telephone, "numero");
                    },
                    icon: const Icon(Icons.edit),
                  ),
                ),
                ListTile(
                  title: const Text("Adresse"),
                  subtitle: Text("${e['adresse']}"),
                  trailing: IconButton(
                    onPressed: () {
                      //
                      var adresse = TextEditingController();
                      modifierInfo(e, context, adresse, "adresse");
                    },
                    icon: const Icon(Icons.edit),
                  ),
                ),
                // ListTile(
                //   title: const Text("Date naissance"),
                //   subtitle: Text("${e['dateNaissance']}"),
                //   trailing: IconButton(
                //     onPressed: () {
                //       //
                //       var dateNaissance = TextEditingController();
                //       modifierInfo(e, context, dateNaissance, "dateNaissance");
                //     },
                //     icon: const Icon(Icons.edit),
                //   ),
                // ),
                // ListTile(
                //   title: const Text("code"),
                //   subtitle: Text("${e['code']}"),
                //   trailing: IconButton(
                //     onPressed: () {
                //       //
                //     },
                //     icon: const Icon(Icons.edit),
                //   ),
                // ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 4,
                  child: ElevatedButton(
                    onPressed: () {
                      //
                      Get.to(StatAgent(e));
                      //
                    },
                    child: const Text("Stats"),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 4,
                  child: ElevatedButton(
                    onPressed: () {
                      //
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.red.shade900),
                    ),
                    child: const Text(
                      "Supprimer",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  modifierInfo(
    Map e,
    BuildContext context,
    TextEditingController text,
    String nom,
  ) async {
    text.text = e[nom];
    final formKey = GlobalKey<FormState>();
    showDialog(
      context: context,
      builder: (c) {
        return AlertDialog(
          title: Text("${nom.capitalize}"),
          contentPadding: const EdgeInsets.all(5),
          content: Container(
            height: 200,
            width: 250,
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextFormField(
                      controller: text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        //prefixIcon: const Icon(Icons.person),
                        hintText: 'nom'.tr,
                        labelText: 'nom'.tr,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'nom_message'.tr;
                        }

                        return null;
                      },
                      onChanged: (value) {
                        //print("Password value $value");
                      },
                    ),
                    InkWell(
                      onTap: () {
                        e[nom] = text.text;
                        Get.dialog(
                          const Center(
                            child: SizedBox(
                              height: 40,
                              width: 40,
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        );
                        agentController.putData(e);
                        //Mise ) jour ici...
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: 2,
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: 2,
                          ),
                          child: Text(
                            "Enregistrer".tr,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.indigo.shade900,
                            borderRadius: BorderRadius.circular(10),
                            // gradient: LinearGradient(
                            //   begin: Alignment.centerLeft,
                            //   end: Alignment.centerRight,
                            //   colors: <Color>[Colors.yellow.shade700, Colors.black],
                            // ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
