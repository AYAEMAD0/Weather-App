import 'package:flutter/material.dart';
import '../core/app_color.dart';

class ReusableFutureBuilder<T> extends StatelessWidget {
  final Future<T> future;
  final Widget Function(T data) onSuccess;

  const ReusableFutureBuilder({
    super.key,
    required this.future,
    required this.onSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: AppColor.color_white),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              "Error: ${snapshot.error}",
              style: const TextStyle(color: AppColor.color_white, fontSize: 20),
            ),
          );
        } else if (snapshot.hasData) {
          return onSuccess(snapshot.data as T);
        } else {
          return const Center(
            child: Text(
              "No data available",
              style: TextStyle(color: AppColor.color_white, fontSize: 24),
            ),
          );
        }
      },
    );
  }
}
