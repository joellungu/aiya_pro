import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'agent_controller.dart';

class StatAgent extends StatelessWidget {
  Map e;
  StatAgent(this.e);
  //
  List types = ["Entreprise", "Utilisateur"];
  RxString type = "Entreprise".obs;
  //
  AgentController agentController = Get.find();
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${e['nom']} ${e['postnom']} ${e['prenom']}"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: Obx(
                () => DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: type.value,
                    onChanged: (s) {
                      type.value = s as String;
                    },
                    items: List.generate(
                      types.length,
                      (index) {
                        return DropdownMenuItem<String>(
                          value: types[index]!,
                          child: Text("${types[index]}"),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
              // child: Obx(() {
              //   if (type.value == "Entreprise") {
              //     return FutureBuilder(
              //       future: agentController.getEntreprise(e["code"]),
              //       builder: (c, t) {
              //         if (t.hasData) {
              //           List l = t.data as List;
              //           return Column(
              //             children: [
              //               Align(
              //                 alignment: Alignment.topCenter,
              //                 child: Padding(
              //                   padding: const EdgeInsets.all(10),
              //                   child: Text("${l.length} au total"),
              //                 ),
              //               ),
              //               Expanded(
              //                 flex: 1,
              //                 child: ListView(
              //                   children: List.generate(l.length, (index) {
              //                     return ListTile(
              //                       title: Text("${l[index]['denomination']}"),
              //                       subtitle: Text(
              //                           "${l[index]['adresseEtablissement']}"),
              //                     );
              //                   }),
              //                 ),
              //               ),
              //             ],
              //           );
              //         } else if (t.hasError) {
              //           return Container();
              //         }
              //         return const Center(
              //           child: SizedBox(
              //             height: 40,
              //             width: 40,
              //             child: CircularProgressIndicator(),
              //           ),
              //         );
              //       },
              //     );
              //   } else {
              //     return Container();
              //   }
              // }),
            )
          ],
        ),
      ),
    );
  }
}
