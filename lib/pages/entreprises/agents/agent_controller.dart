import 'package:aiya_pro/utils/requetes.dart';
import 'package:get/get.dart';

class AgentController extends GetxController with StateMixin<List> {
  //
  Requete requete = Requete();
  //
  allAgent(String idPartenaire) async {
    change([], status: RxStatus.loading());
    //
    Response rep = await requete.getE("agent/all/$idPartenaire");
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      print(rep.statusCode);
      print(rep.body);
      //
      change(rep.body, status: RxStatus.success());
    } else {
      print(rep.statusCode);
      print(rep.body);
      //
      change([], status: RxStatus.error());
    }
  }

  //
  Future<bool> enregistrer(Map e) async {
    change([], status: RxStatus.loading());
    //
    Response rep = await requete.postE("agent", e);
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      print(rep.body);
      print(rep.statusCode);
      //
      allAgent("${e['idPartenaire']}");
      //
      return true;
    } else {
      print(rep.statusCode);
      print(rep.body);
      //
      return false;
    }
  }

  //
  Future<List> getEntreprise(String codePromo) async {
    Response rep = await requete.getE("boutique/all/$codePromo");
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      //
      //allAgent('${e['idPartenaire']}');
      //
      return rep.body;
    } else {
      print(rep.body);
      //
      return [];
    }
  }

  //
  Future<bool> putData(Map e) async {
    change([], status: RxStatus.loading());
    //
    Response rep = await requete.putE("agent", e);
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      print(rep.body);
      //
      allAgent('${e['idPartenaire']}');
      //
      Get.back();
      //
      return true;
    } else {
      print(rep.body);
      //
      Get.back();
      return false;
    }
  }
  //
}
