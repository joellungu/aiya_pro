import 'package:aiya_pro/utils/requetes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StatesController extends GetxController with StateMixin<List> {
  //
  //
  RxDouble totalX = RxDouble(0);
  RxDouble lundiX = RxDouble(0);
  RxDouble mardiX = RxDouble(0);
  RxDouble mercrediX = RxDouble(0);
  RxDouble jeudiX = RxDouble(0);
  RxDouble vendrediX = RxDouble(0);
  RxDouble samediX = RxDouble(0);
  RxDouble dimancheX = RxDouble(0);
  //
  Requete requete = Requete();
  //
  Future<List> getAllCouresHistorique(int moi, int annee) async {
    //
    change([], status: RxStatus.loading());
    String mois = moi < 9 ? "0$moi" : "$moi";
    //
    var box = GetStorage();
    Map a = box.read("companie") ?? {};
    print("tickets/course/${a['id']}/$moi-$annee");
    //
    Response rep = await requete.getE("tickets/course/${a['id']}/$moi-$annee");
    if (rep.isOk) {
      print(rep.body);
      //
      return rep.body;
      //change(rep.body, status: RxStatus.success());
    } else {
      //
      return [];
      //change([], status: RxStatus.empty());
    }
    //
  }

  Future<List> getAllCouresHistorique2(String data) async {
    //
    //change([], status: RxStatus.loading());
    //20-6-2023
    var box = GetStorage();
    Map a = box.read("user") ?? {};
    DateTime dt = DateTime.now();
    String d = "${dt.day}-${dt.month}-${dt.year}";
    //d
    //${a['idPartenaire']}
    Response rep =
        await requete.getE("tickets/course/${a['idPartenaire']}/$data");
    print(rep.statusCode);
    print(rep.body);
    if (rep.isOk) {
      //
      //change(rep.body, status: RxStatus.success());
      return rep.body;
    } else {
      //
      //change([], status: RxStatus.empty());
      return [];
    }
    //
  }
}
