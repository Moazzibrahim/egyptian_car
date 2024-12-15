import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/color.dart';
import 'package:flutter_application_1/view/widgets/custom_appbar.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "انشاء رقم سري جديد",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: maincolor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              // Password Field
              Directionality(
                textDirection: TextDirection.rtl,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "الرقم السري",
                    hintStyle: const TextStyle(
                      color: maincolor,
                      fontSize: 18,
                    ),
                    suffixIcon:
                        const Icon(Icons.visibility_off, color: maincolor),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(color: maincolor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(color: maincolor, width: 2),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Confirm Password Field
              Directionality(
                textDirection: TextDirection.rtl,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "تأكيد الرقم السري",
                    labelStyle: const TextStyle(
                      color: maincolor,
                      fontSize: 18,
                    ),
                    suffixIcon:
                        const Icon(Icons.visibility_off, color: maincolor),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(color: maincolor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(color: maincolor, width: 2),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              // Submit Button
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
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle submission logic
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
                    "ارسال",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
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
