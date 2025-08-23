import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/widgets/reusable_future_builder.dart';
import '../api/api_response.dart';
import '../api/api_service.dart';
import '../core/app_color.dart';

class CustomCardHomeEnd extends StatefulWidget {
  const CustomCardHomeEnd({super.key});

  @override
  State<CustomCardHomeEnd> createState() => _CustomCardHomeEndState();
}

class _CustomCardHomeEndState extends State<CustomCardHomeEnd> {
  late Future<List<ApiResponse>> value;

  @override
  void initState() {
    value = ApiService().hoursWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final todayDate = DateFormat('MMMM d').format(DateTime.now());

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        gradient: AppColor.gradientS2C,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today',
                  style: TextStyle(
                    color: AppColor.color_white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  todayDate, //error
                  style: TextStyle(
                    color: AppColor.color_white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Divider(color: AppColor.color_divider),
          const SizedBox(height: 5),
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
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Image.network(
                              data.image!,
                              height: 70,
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
