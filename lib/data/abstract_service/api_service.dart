import 'package:http/http.dart';
import 'package:weather_app/data/abstract_service/remote_service.dart';

import '../../remote_urls.dart';

class ApiService extends RemoteService{
  @override
  Future<Response> getWeatherData(String location) async{
    Map<String,String>queryParameters = {
      'q':location,
      'key': "dbb81d2b216e4b1782674123241505",
      'units':'metric'
    };

    final response = await get(
        Uri.https(RemoteUrls.baseUrl,RemoteUrls.endPoint,queryParameters));

    return response;
  }
}