import 'package:get/get.dart';

class RegisterController extends GetxController {
  var isProfilePicPathSet = false.obs;
  var profilePicPath = "".obs;
  var isProfilePicPathSet1 = false.obs;
  var profilePicPath1 = "".obs;

  void initState() {
    super.onInit();
    setProfileImagePath(profilePicPath.value);
    setProfileImagePath1(profilePicPath1.value);
  }

  void setProfileImagePath(String path) {
    try {
      profilePicPath.value = path;
      //we can write it isProfilePicSet(true).
      isProfilePicPathSet.value = true;
      Get.back();
    } finally {}
  }

  void setProfileImagePath1(String path) {
    try {
      profilePicPath1.value = path;
      //we can write it isProfilePicSet(true).
      isProfilePicPathSet1.value = true;
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
