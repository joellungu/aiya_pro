import 'package:aiya_pro/utils/requetes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';

import 'entreprise_controller.dart';
import 'entreprise_details.dart';

class Entreprise extends GetView<EntrepriseController> {
  //
  int id;
  //
  Entreprise(this.id) {
    //controller.allcompanie();
  }
  //
  Rx<Widget> vue = Rx(Container());
  //
  //EntrepriseController entrepriseController = Get.find();
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: controller.oneCompanie(id),
        builder: (context, t) {
          if (t.hasData) {
            Map e = t.data as Map;
            //
            var box = GetStorage();
            box.write("companie", e);
            //
            return EntrepriseDetails(e);
          } else if (t.hasError) {
            return Container();
          }
          return Center(
            child: Container(
              height: 40,
              width: 40,
              child: const CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
