import 'dart:convert';
import 'package:adv_testsurpriser/model/api_model.dart';
import 'package:http/http.dart' as http;

class APIHelper {
  APIHelper._();

  static final APIHelper apiHelper = APIHelper._();

  List<ApiModel> apidata = [];

  Future<List<ApiModel>?> fetchedApiData() async {
    String api = "https://api.publicapis.org/entries";

    http.Response response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      String data = response.body;

      Map decodedData = jsonDecode(data);
      List apiFetched = decodedData['entries'];

      print(apiFetched);
      apidata = apiFetched
          .map((e) => ApiModel(
              Name: e['API'],
              Description: e['Description'],
              HTTPS: e['HTTPS'],
              Link: e['Link'],
              Categories: e['Category']))
          .toList();
      return apidata;
    }
    return null;
  }
}
