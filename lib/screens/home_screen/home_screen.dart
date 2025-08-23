import 'package:flutter/material.dart';
import 'package:weather/api/api_response.dart';
import 'package:weather/api/api_service.dart';
import 'package:weather/widgets/custom_card_hour.dart';
import '../../core/app_color.dart';
import '../../widgets/reusable_future_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static final String home_routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<ApiResponse> value;
  @override
  void initState() {
    value = ApiService().currentWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(gradient: AppColor.gradient1),
      child: SafeArea(
        child: ReusableFutureBuilder(
            future: value,
            onSuccess: (snapshot){
          final data = snapshot;
          return Column(
            children: [
              Image.network(
                data.image!,
                width: 150,
                height: 150,
                fit: BoxFit.contain,
                filterQuality: FilterQuality.high,
              ),
              Text(
                '${data.temp}°',
                style: TextStyle(
                  color: AppColor.color_white,
                  fontSize: 55,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10,),
              Text(
                data.condition!,
                style: TextStyle(
                  color: AppColor.color_white,
                  fontSize: 24,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Max: ${data.maxTemp}°',
                    style: TextStyle(
                      color: AppColor.color_white,
                      fontSize: 23,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 25),
                  Text(
                    'Min:${data.minTemp}°',
                    style: TextStyle(
                      color: AppColor.color_white,
                      fontSize: 23,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Image.asset('assets/images/house.png', height: 140),
              Expanded(child: CustomCardHomeEnd()),
            ],
          );
        })







      ),
    );
  }
}




// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//   static final String home_routeName = 'home';
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   late Future<ApiResponse> value;
//
//   @override
//   void initState() {
//     value = ApiService().currentWeather();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(gradient: AppColor.gradient1),
//       child: SafeArea(
//         child: ReusableFutureBuilder<ApiResponse>(
//           future: value,
//           onSuccess: (data) {
//             return Column(
//               children: [
//                 Image.network(data.image!, width: 150, height: 150, fit: BoxFit.contain),
//                 Text('${data.temp}°',
//                     style: const TextStyle(
//                       color: AppColor.color_white,
//                       fontSize: 55,
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w500,
//                     )),
//                 const SizedBox(height: 10),
//                 Text(data.condition!,
//                     style: const TextStyle(
//                       color: AppColor.color_white,
//                       fontSize: 24,
//                       fontFamily: 'Poppins',
//                       fontWeight: FontWeight.w400,
//                     )),
//                 const SizedBox(height: 10),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text('Max: ${data.maxTemp}°',
//                         style: const TextStyle(color: AppColor.color_white, fontSize: 23)),
//                     const SizedBox(width: 25),
//                     Text('Min: ${data.minTemp}°',
//                         style: const TextStyle(color: AppColor.color_white, fontSize: 23)),
//                   ],
//                 ),
//                 const SizedBox(height: 15),
//                 Image.asset('assets/images/house.png', height: 140),
//                 const Expanded(child: CustomCardHomeEnd()),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
// class CustomCardHomeEnd extends StatefulWidget {
//   const CustomCardHomeEnd({super.key});
//
//   @override
//   State<CustomCardHomeEnd> createState() => _CustomCardHomeEndState();
// }
//
// class _CustomCardHomeEndState extends State<CustomCardHomeEnd> {
//   late Future<List<ApiResponse>> value;
//
//   @override
//   void initState() {
//     value = ApiService().hoursWeather();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final todayDate = DateFormat('MMMM d').format(DateTime.now());
//
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(25),
//           topRight: Radius.circular(25),
//         ),
//         gradient: AppColor.gradientS2C,
//       ),
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text('Today',
//                     style: TextStyle(
//                       color: AppColor.color_white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.w400,
//                     )),
//                 Text(todayDate,
//                     style: const TextStyle(
//                       color: AppColor.color_white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.w400,
//                     )),
//               ],
//             ),
//           ),
//           const SizedBox(height: 5),
//           Divider(color: AppColor.color_divider),
//           const SizedBox(height: 5),
//           ReusableFutureBuilder<List<ApiResponse>>(
//             future: value,
//             onSuccess: (dataList) {
//               return SizedBox(
//                 height: 130,
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: dataList.map((data) {
//                       return Container(
//                         margin: const EdgeInsets.symmetric(horizontal: 8),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Text('${data.temp}°',
//                                 style: const TextStyle(color: AppColor.color_white, fontSize: 16)),
//                             Image.network(data.image!, height: 70, width: 65, fit: BoxFit.contain),
//                             Text(data.date!,
//                                 style: const TextStyle(color: AppColor.color_white, fontSize: 15)),
//                           ],
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
