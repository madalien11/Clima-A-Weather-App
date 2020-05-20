import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

const apiKey = 'd83ade382cb29260d5cf2d42e6569737';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric");
    var data = await networkHelper.getData();
    return data;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        "https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric");
    var data = await networkHelper.getData();
    return data;
  }

  IconButton getWeatherIcon(int condition) {
    if (condition < 300) {
      return IconButton(
        iconSize: 110,
        icon: BoxedIcon(
          WeatherIcons.thunderstorm,
          size: 70,
        ),
        onPressed: () {},
      );
    } else if (condition < 400) {
      return IconButton(
        iconSize: 110,
        icon: BoxedIcon(
          WeatherIcons.showers,
          size: 70,
        ),
        onPressed: () {},
      );
    } else if (condition < 600) {
      return IconButton(
        iconSize: 110,
        icon: BoxedIcon(
          WeatherIcons.rain,
          size: 70,
        ),
        onPressed: () {},
      );
    } else if (condition < 700) {
      return IconButton(
        iconSize: 110,
        icon: BoxedIcon(
          WeatherIcons.snow,
          size: 70,
        ),
        onPressed: () {},
      );
    } else if (condition < 800) {
      return IconButton(
        iconSize: 110,
        icon: BoxedIcon(
          WeatherIcons.fog,
          size: 70,
        ),
        onPressed: () {},
      );
    } else if (condition == 800) {
      return IconButton(
        iconSize: 110,
        icon: BoxedIcon(
          WeatherIcons.day_sunny,
          size: 70,
        ),
        onPressed: () {},
      );
    } else if (condition <= 804) {
      return IconButton(
        iconSize: 110,
        icon: BoxedIcon(
          WeatherIcons.cloud,
          size: 70,
        ),
        onPressed: () {},
      );
    } else {
      return IconButton(
        iconSize: 110,
        icon: BoxedIcon(
          WeatherIcons.alien,
          size: 70,
        ),
        onPressed: () {},
      );
    }

//    if (condition < 300) {
//      return '🌩';
//    } else if (condition < 400) {
//      return '🌧';
//    } else if (condition < 600) {
//      return '☔️';
//    } else if (condition < 700) {
//      return '☃️';
//    } else if (condition < 800) {
//      return '🌫';
//    } else if (condition == 800) {
//      return '☀️';
//    } else if (condition <= 804) {
//      return '☁️';
//    } else {
//      return '🤷‍';
//    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
