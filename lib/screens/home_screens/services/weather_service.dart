import 'dart:developer';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class WeatherService {
  static Future<String?> getWeatherData({required String lat, required String long}) async {
    var url = Uri.parse(
        "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$long&current=temperature_2m,wind_speed_10m");

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['totalItems'];
      log(jsonResponse['current']['temperature_2m'].toString());
      print('Number of books about http: $itemCount.');
      return jsonResponse['current']['temperature_2m'].toString();
    } else {
      log('Request failed with status: ${response.statusCode}.');
      return null;
    }
  }
}



// {"latitude":52.52,"longitude":13.419998,"generationtime_ms":0.029921531677246094,"utc_offset_seconds":0,"timezone":"GMT","timezone_abbreviation":"GMT","elevation":38.0,"current_units":{"time":"iso8601","interval":"seconds","temperature_2m":"°C","wind_speed_10m":"km/h"},"current":{"time":"2024-10-16T12:30","interval":900,"temperature_2m":13.4,"wind_speed_10m":17.1}}% ```

