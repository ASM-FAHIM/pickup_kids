import 'package:get/get.dart';

class ChildPicController extends GetxController {
  var isProfilePicPathSet = false.obs;
  var profilePicPath = "".obs;

  void initState() {
    super.onInit();
    setChildProfileImagePath(profilePicPath.value);
  }

  void setChildProfileImagePath(String path) {
    try {
      profilePicPath.value = path;
      //we can write it isProfilePicSet(true).
      isProfilePicPathSet.value = true;
      Get.back();
    } finally {}
  }
}
