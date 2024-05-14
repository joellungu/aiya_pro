import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:aiya_pro/pages/entreprises/entreprise_controller.dart';
import 'package:aiya_pro/pages/entreprises/states.dart/states_controller.dart';
import 'package:aiya_pro/pages/login/login.dart';
import 'package:aiya_pro/utils/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/entreprises/agents/agent_controller.dart';
import 'pages/entreprises/profile/profile_controller.dart';

bool get enablePeripheral => !Platform.isLinux && !Platform.isWindows;

void main() async {
  //
  StatesController statesController = Get.put(StatesController());
  //
  AppController appController = Get.put(AppController());
  //
  AgentController agentController = Get.put(AgentController());
  //
  EntrepriseController entrepriseController = Get.put(EntrepriseController());
  //
  ProfileController profileController = Get.put(ProfileController());
  //
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData.light(
        useMaterial3: true,
      ).copyWith(
        materialTapTargetSize: MaterialTapTargetSize.padded,
      ),
      home: Login(),
    );
  }
}
