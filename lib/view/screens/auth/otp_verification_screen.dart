import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/color.dart';
import 'package:flutter_application_1/view/screens/auth/new_password_screen.dart';
import 'package:flutter_application_1/view/widgets/custom_appbar.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(context, "المصرية"),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 13,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '  OTP  التحقق من',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: maincolor),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'دخل كلمة مرور المرسلة OTP',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: maincolor,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Pinput(
                length: 4,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                defaultPinTheme: PinTheme(
                  width: 56,
                  height: 56,
                  textStyle: const TextStyle(
                      fontSize: 20,
                      color: maincolor,
                      fontWeight: FontWeight.w600),
                  decoration: BoxDecoration(
                    border: Border.all(color: maincolor),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  width: 56,
                  height: 56,
                  textStyle: const TextStyle(
                      fontSize: 20,
                      color: maincolor,
                      fontWeight: FontWeight.w600),
                  decoration: BoxDecoration(
                    border: Border.all(color: maincolor, width: 2),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onCompleted: (pin) {
                  log('Entered OTP: $pin');
                  // Handle OTP verification logic here
                },
              ),
              const SizedBox(height: 16),
              const Text(
                '00:03:00',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  // Logic to resend OTP
                },
                child: const Text(
                  'لم تتلق الرمز؟ إعادة إرساله',
                  style: TextStyle(
                      fontSize: 16,
                      color: maincolor,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(height: 32),
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: GradientColors, // Replace with your GradientColors
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius:
                      BorderRadius.circular(12), // Match button's border radius
                ),
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    // Logic to verify OTP
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const CreateNewPasswordScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.transparent, // Transparent to show the gradient
                    shadowColor: Colors.transparent, // Remove shadow
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 80,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(12), // Rounded corners
                    ),
                  ),
                  child: const Text(
                    'ارسال',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
