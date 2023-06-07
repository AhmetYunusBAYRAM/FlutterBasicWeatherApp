import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Objects/ResponseObject.dart';

class Send {
  weatherSend(city) async {
    ResponseObject responseObject = ResponseObject(
        cityName: "", temperature: "", status: "", icon: "", wind_kph: "");
        
    var apiKey = '2e01fab8188c4ce1857175510230606';
    var location = city;
    var url =
        'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$location&aqi=no';

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      
      responseObject.temperature =  data['current']['temp_c'].toString();
      responseObject.cityName = city;
      responseObject.icon = data['current']['condition']['icon'];
      responseObject.wind_kph = data['current']['wind_kph'].toString();
      responseObject.status = data['current']['condition']['text'];
    } else {
      print('Failed to fetch weather data.');
    }
    return await responseObject;
  }
}
