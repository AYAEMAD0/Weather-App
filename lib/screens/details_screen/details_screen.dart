import 'package:flutter/material.dart';
import 'package:weather/api/api_service.dart';

import '../../api/api_response.dart';
import '../../core/app_color.dart';
import '../../widgets/custom_large_card_details.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});
  static final String details_routeName = 'details';

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late Future<List<ApiResponse>> value;
  @override
  void initState() {
    value = ApiService().daysWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: 20),
          Text(
            '7-Days Forecasts',
            style: TextStyle(
              color: AppColor.color_white,
              fontSize: 23,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 5),
          FutureBuilder(
            future: value,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColor.color_white),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "Error: ${snapshot.error}",
                    style: const TextStyle(
                      color: AppColor.color_white,
                      fontSize: 30,
                    ),
                  ),
                );
              } else if (snapshot.hasData) {
                final dataList = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: dataList.map((data) {
                        return Container(
                          width: 90,
                          height: 180,
                          padding: const EdgeInsets.all(12),
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            gradient: AppColor.gradientS3C2,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '${data.date}',
                                style: const TextStyle(
                                  color: AppColor.color_white,
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Image.network(
                                data.image!,
                                height: 50,
                              ),
                              Text(
                                '${data.temp}°',
                                style: const TextStyle(
                                  color: AppColor.color_white,
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    )
                  ),
                );
              } else {
                return const Center(
                  child: Text(
                    "No data available",
                    style: TextStyle(color: AppColor.color_white, fontSize: 24),
                  ),
                );
              }
            },
          ),
          CustomLargeCardDetails(),
        ],
      ),
    );
  }
}
