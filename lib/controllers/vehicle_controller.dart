import 'package:get/get.dart';

class VehicleController extends GetxController {
  var isProfilePicPathSet = false.obs;
  var profilePicPath = "".obs;

  void initState() {
    super.onInit();
    setProfileImagePath(profilePicPath.value);
  }

  void setProfileImagePath(String path) {
    try {
      profilePicPath.value = path;
      //we can write it isProfilePicSet(true).
      isProfilePicPathSet.value = true;
      Get.back();
    } finally {}
  }
}
