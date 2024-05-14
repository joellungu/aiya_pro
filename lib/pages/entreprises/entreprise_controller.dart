import 'package:aiya_pro/utils/requetes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class EntrepriseController extends GetxController with StateMixin<List> {
  //
  Requete requete = Requete();
  //
  var box = GetStorage();
  //proprietaire
  allcompanie() async {
    change([], status: RxStatus.loading());
    //
    Response rep = await requete.getE("companie/all");
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      print(rep.body);
      //
      change(rep.body, status: RxStatus.success());
    } else {
      print(rep.body);
      //
      change([], status: RxStatus.error());
    }
  }

  //
  Future<Map> oneCompanie(int id) async {
    Map u = box.read("proprietaire");
    //
    Response rep = await requete.getE("companie/${u['idPartenaire']}");
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      print(rep.body);
      //
      return rep.body;
    } else {
      print(rep.body);
      //
      return {};
    }
  }

  //
  Future<bool> putData(Map e) async {
    change([], status: RxStatus.loading());
    //
    Response rep = await requete.putE("companie", e);
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      print(rep.body);
      //
      allcompanie();
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
  Future<bool> saveData(Map e) async {
    change([], status: RxStatus.loading());
    //
    Response rep = await requete.postE("companie", e);
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      print(rep.statusCode);
      print(rep.body);

      //
      allcompanie();
      //
      Get.back();
      //
      return true;
    } else {
      print(rep.statusCode);
      print(rep.body);

      //
      Get.back();
      return false;
    }
  }
  //
}
