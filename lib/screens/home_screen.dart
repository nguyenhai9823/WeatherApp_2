import 'package:flutter/material.dart';
import 'package:weatherapp2/controller/global_controller.dart';
import 'package:get/get.dart';
import 'package:weatherapp2/widgets/current_weather_widget.dart';
import 'package:weatherapp2/widgets/header_widget.dart';
import 'package:weatherapp2/widgets/hourly_data_widget.dart';

import '../widgets/daily_data_forecast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => globalController.checkLoading().isTrue
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
              child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const HeaderWidget(),

                    CurrentWeatherWidget(
                      weatherDataCurrent: globalController.getData().getCurrentWeather(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    HourlyDataWidget(
                      weatherDataHourly: globalController.getData().getHourlytWeather()
                    ),
                    DailyDataForecast(
                      weatherDataDaily: globalController.getData().getDailyWeather(),
                    ),
                  ],
                ),
            )),
      ),
    );
  }
}
