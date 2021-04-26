import 'package:clima_flutter_latest/services/location.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocation();
    getData();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {

    //Uri url = Uri.parse('https://samples.openweathermap.org/agro/1.0/weather?lat=35&lon=139&appid=b1b15e88fa797225412429c1c50c122a1');
    Uri url = Uri.parse('https://samples.openweathermap.org/data/2.5/weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1');

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      //print(data);

     // var longitude = jsonDecode(data)['coord']['lon'];
     // print(longitude);
     //
     // var weatherDescription = jsonDecode(data)['weather'][0]['description'];
     // print(weatherDescription);
      var decodeData = jsonDecode(data);

      double temperature = decodeData['main']['temp'];
      int condition = decodeData['weather'][0]['id'];
      String cityName = decodeData['name'];

      print(temperature);
      print(condition);
      print(cityName);

    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
