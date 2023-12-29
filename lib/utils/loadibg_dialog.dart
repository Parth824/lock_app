import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showLoadingDialog() {
  Future.delayed(const Duration(seconds: 0), () {
    Get.dialog(
        Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                      width: 25,
                      height: 25,
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        color: Color(0xFF334257),
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )),
                ],
              ),
            ),
          ),
        ),
        barrierDismissible: false);
  });
}

void hideLoadingDialog({@required BuildContext? context}) {
  FocusScope.of(Get.context!).unfocus();
  Get.back();
}
