import 'package:get/get.dart';

class RegisterController extends GetxController {
  var isProfilePicPathSet = false.obs;
  var profilePicPath = "".obs;
  void initState() {
    super.onInit();
    setProfileImagePath(profilePicPath.value);
  }

  void dispose() {
    super.dispose();
    // saveValue();
  }

  void setProfileImagePath(String path) {
    try {
      profilePicPath.value = path;
      //we can write it isProfilePicSet(true).
      isProfilePicPathSet.value = true;
      Get.back();
    } finally {}
  }

  //for vehicle count value save
  var isSavedValue = false.obs;
  var saveNumber = 1.obs;
  void saveValue(dynamic num) {
    try {
      isSavedValue(true);
      saveNumber.value = num;
    } finally {}
  }
}
