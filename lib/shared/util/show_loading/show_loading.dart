// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:study_case_vascomm/state_util.dart';

showLoading({
  String? message,
}) async {
  print("showLoading called");
  await showDialog<void>(
    context: globalContext,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            width: 110,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Wrap(
                    children: [
                      const SizedBox(
                        width: 12,
                        height: 12,
                        child: CircularProgressIndicator(),
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      Text(
                        message ?? "Loading...",
                        style: const TextStyle(
                          fontSize: 10.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
  print("showLoading completed");
}

hideLoading() async {
  print("hideLoading called");
  Get.back();
  print("hideLoading completed");
}
