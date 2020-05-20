import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'city_screen.dart';
import 'package:weather_icons/weather_icons.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;
  LocationScreen({this.locationWeather});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  String weatherIcon;
  var temperature;
  String message;
  var cityName;
  var condition;

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        message = 'Unable to get weather data';
        return;
      }
      condition = weatherData['weather'][0]['id'];
      temperature = weatherData['main']['temp'].toInt();
      cityName = weatherData['name'];
//      weatherIcon = weather.getWeatherIcon(condition);
      message = weather.getMessage(temperature) + ' in $cityName!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/location_background.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8),
                BlendMode.dstATop,
              ),
            ),
          ),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () async {
                        var weatherData = await weather.getLocationWeather();
                        updateUI(weatherData);
                      },
                      child: Icon(
                        Icons.near_me,
                        size: 35.0,
                      ),
                    ),
                    FlatButton(
                      onPressed: () async {
                        var typedCityName = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CityScreen(),
                          ),
                        );
                        if (typedCityName != null) {
                          var weatherData =
                              await weather.getCityWeather(typedCityName);
                          updateUI(weatherData);
                          cityName = typedCityName;
                        }
                      },
                      child: Icon(
                        Icons.location_city,
                        size: 35.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: <Widget>[
                        Center(
                          child: Text(
                            '$temperature˚',
                            style: kTempTextStyle2,
                          ),
                        ),
//                        Text(
//                          weatherIcon,
//                          style: kConditionTextStyle,
//                        ),
                        weather.getWeatherIcon(condition),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 15.0, left: 15.0),
                    child: Padding(
                      padding: const EdgeInsets.all(0.5),
                      child: Text(
                        message,
                        textAlign: TextAlign.center,
                        style: kMessageTextStyle2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
