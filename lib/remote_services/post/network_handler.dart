import 'package:http/http.dart';

class NetworkHandler {
  static final client = Client();
  // static final storage = FlutterSecureStorage();
  static void post(var body, String endpoint) async {
    var response = await client.post(buildUrl(endpoint), body: body);
  }

  static Uri buildUrl(String endpoint) {
    String host = "172.20.20.69/pick_kids/login_account/";
    final apiPath = host + endpoint;
    return Uri.parse(apiPath);
  }

  //storage use for secure path analysis
  // static void storeToken(String token) async {
  //   await storage.write(key: "token", value: token);
  // }

  //static Future<String?> getToken(String token) async{
  //return await storage.read(key: "token");
  // }

}
