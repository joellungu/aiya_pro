import 'package:aiya_pro/pages/login/login.dart';
import 'package:aiya_pro/utils/requetes.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  //
  Requete requete = Requete();
  //
  putData(Map pro) async {
    //
    Response response = await requete.putE("proprietaire", pro);
    //
    if (response.isOk) {
      //
      Get.snackbar("Succès", "Mise à jour éffectué !");
      Get.offAll(Login());
    } else {
      Get.snackbar("Oups", "Un problème est survenu lors de la mise à jour");
    }
  }
}
