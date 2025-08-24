import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/widgets/reusable_future_builder.dart';
import '../api/api_response.dart';
import '../api/api_service.dart';
import '../core/app_color.dart';
import 'location_helper.dart';

class CustomCardHour extends StatefulWidget {
  const CustomCardHour({super.key});

  @override
  State<CustomCardHour> createState() => _CustomCardHourState();
}

class _CustomCardHourState extends State<CustomCardHour> {
  late Future<List<ApiResponse>> value;

  @override
  void initState() {
    super.initState();
    value = _loadData();
  }

  Future<List<ApiResponse>> _loadData() async {
    final position = await LocationHelper.getCurrentLocation();
    return ApiService().hoursWeather(position.latitude, position.longitude);
  }

  @override
  Widget build(BuildContext context) {
    final todayDate = DateFormat('MMMM d').format(DateTime.now());

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        gradient: AppColor.gradientS3CCenter,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Today',
                  style: TextStyle(
                    color: AppColor.color_white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  todayDate,
                  style: const TextStyle(
                    color: AppColor.color_white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 2),
          Divider(color: AppColor.color_divider, thickness: 1),
          const SizedBox(height: 2),
          ReusableFutureBuilder<List<ApiResponse>>(
            future: value,
            onSuccess: (snapshot) {
              final dataList = snapshot;
              return SizedBox(
                height: 130,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: dataList.map((data) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '${data.temp}°',
                              style: const TextStyle(
                                color: AppColor.color_white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Image.network(
                              data.image!,
                              height: 65,
                              width: 65,
                              fit: BoxFit.contain,
                            ),
                            Text(
                              data.date!,
                              style: const TextStyle(
                                color: AppColor.color_white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
