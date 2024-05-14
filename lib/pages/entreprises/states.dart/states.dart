import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'afficher.dart';
import 'states_controller.dart';

class States extends GetView<StatesController> {
  //
  RxInt mois = 0.obs;
  RxInt annee = 2024.obs;
  //
  List moiss = [
    "",
    "Janvier",
    "Février",
    "Mars",
    "Avril",
    "Mai",
    "Juin",
    "Juillet",
    "Aout",
    "Septembre",
    "Octobre",
    "Novembre",
    "Decembre"
  ];
  //
  States() {
    // TODO: implement initState
    DateTime d = DateTime.now();
    annee.value = d.year;
    mois.value = d.month;
    //
    //controller.getAllCouresHistorique(6, 2023);
    //controller.getAllCouresHistorique(mois.value, d.year);
  }

  @override
  Widget build(BuildContext context) {
    //
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        const SizedBox(
          height: 10,
        ),
        // SwitchListTile(
        //   value: false,
        //   onChanged: (e) {},
        //   title: const Text("Mois"),
        //   subtitle: const Text("Oui"),
        // ),
        //
        const SizedBox(
          height: 10,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Mois",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey),
          ),
          child: Obx(
            () => DropdownButtonHideUnderline(
              child: DropdownButton(
                isExpanded: true,
                value: mois.value,
                items: List.generate(
                  moiss.length,
                  (index) {
                    return DropdownMenuItem(
                      value: index,
                      child: Text("${moiss[index]}"),
                    );
                  },
                ),
                onChanged: (e) {
                  //
                  mois.value = e as int;
                  //
                },
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Année",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey),
          ),
          child: Obx(
            () => DropdownButtonHideUnderline(
              child: DropdownButton(
                isExpanded: true,
                value: annee.value,
                items: List.generate(
                  100,
                  (index) {
                    return DropdownMenuItem(
                      value: index + 2024,
                      child: Text("${index + 2024}"),
                    );
                  },
                ),
                onChanged: (e) {
                  //
                  annee.value = e as int;
                  //
                },
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        // CalendarDatePicker(
        //   initialDate: DateTime.now(),
        //   firstDate: DateTime(2024),
        //   lastDate: DateTime(2090),
        //   onDateChanged: (d) {
        //     //
        //   },
        // ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () async {
            //
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              constraints: BoxConstraints(),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.green.shade700),
              ),
              builder: (c) {
                return Afficher(mois.value, annee.value);
              },
            );

            //

            //controller.getAllCouresHistorique(mois.value, d.year);
            //
          },
          child: const Text("Afficher"),
        ),
      ],
    );
  }
}
