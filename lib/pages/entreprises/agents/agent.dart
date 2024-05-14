import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'agent_controller.dart';
import 'agent_details.dart';
import 'nouveau_agent.dart';

class Agent extends GetView<AgentController> {
  //
  Map e;
  //
  Agent(this.e) {
    controller.allAgent("${e['id']}");
    //
    //vue = Rx(FormulaireAgent(e));
  }
  //
  Rx<Widget>? vue;
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: controller.obx(
        (state) {
          List l = state! as List;
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 50,
                alignment: Alignment.center,
                child: Text("${l.length} Agent(s)"),
              ),
              Expanded(
                flex: 1,
                child: ListView(
                  children: List.generate(l.length, (index) {
                    Map e = l[index];
                    return ListTile(
                        onTap: () {
                          //
                          Get.to(AgentDetails(e));
                          //vue.value = Container();
                        },
                        leading: const Icon(Icons.person),
                        title: Text(
                          "${e['nom']} ${e['postnom']} ${e['prenom']}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: RichText(
                          text: TextSpan(
                            text: "${e['numero']}   /   ",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: "${e['roletitre']}",
                                style: TextStyle(
                                  color: Colors.green.shade700,
                                ),
                              )
                            ],
                          ),
                        )
                        //Text("${e['numero']}  /  ${e['roletitre']}"),
                        );
                  }),
                ),
              ),
              Container(
                height: 50,
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () async {
                    //
                    Get.to(NouveauAgent(e));
                  },
                  child: const Text("Nouveau admin"),
                ),
              ),
            ],
          );
        },
        onEmpty: Container(),
        onError: (e) {
          return Container();
        },
        onLoading: const Center(
          child: SizedBox(
            height: 40,
            width: 40,
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
