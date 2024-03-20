import 'dart:convert';
import 'package:adv_testsurpriser/model/api_model.dart';
import 'package:http/http.dart' as http;

class APIHelper {
  APIHelper._();

  static final APIHelper apiHelper = APIHelper._();

  List<ApiModel> apidata = [];

  Future<List<ApiModel>?> fetchedApiData() async {
    String api = "https://api.quotable.io/quotes?page=1";

    http.Response response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      String data = response.body;

      Map decodedData = jsonDecode(data);
      List apiFetched = decodedData['results'];

      print(apiFetched);
      apidata = apiFetched
          .map((e) => ApiModel(
              Auther: e['author'],
              Content: e['content'],
             ))
          .toList();
      return apidata;
    }
    return null;
  }
}
