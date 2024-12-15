import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/color.dart';
import 'package:flutter_application_1/view/screens/auth/login_screen.dart';
import 'package:flutter_application_1/view/widgets/custom_appbar.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(context, "انشاء حساب"),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  // Header Section

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'أهلا بك معنا',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: maincolor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Text Fields
                  _buildTextField('الاسم'),
                  const SizedBox(height: 15),
                  _buildTextField('الإيميل'),
                  const SizedBox(height: 15),
                  _buildTextField('الرقم السري', isPassword: true),
                  const SizedBox(height: 30),

                  // Create Account Button
                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors:
                            GradientColors, // Replace with your GradientColors
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(
                          12), // Match button's border radius
                    ),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors
                            .transparent, // Transparent to show the gradient
                        shadowColor: Colors.transparent, // Remove shadow
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 80,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12), // Rounded corners
                        ),
                      ),
                      child: const Text(
                        'إنشاء حساب',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Login Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        ' لديك حساب؟',
                        style: TextStyle(fontSize: 18),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (ctx) => const LoginScreen()),
                          );
                        },
                        child: const Text(
                          ' تسجيل الدخول',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: maincolor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Text Field Widget
  Widget _buildTextField(String hint, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        filled: false,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: maincolor),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: maincolor, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        suffixIcon: isPassword
            ? const Icon(Icons.visibility_off, color: Colors.grey)
            : null,
      ),
      textAlign: TextAlign.right,
    );
  }
}
