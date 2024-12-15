import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/color.dart';
import 'package:flutter_application_1/view/screens/auth/signup_screen.dart';
import 'package:flutter_application_1/view/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'تسجيل الدخول',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: maincolor,
          ),
        ),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl, // Set RTL text direction
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  _buildGreetingText(),
                  const SizedBox(height: 20),
                  _buildEmailField(),
                  const SizedBox(height: 20),
                  _buildPasswordField(),
                  const SizedBox(height: 10),
                  _buildForgotPasswordButton(),
                  const SizedBox(height: 20),
                  _buildLoginButton(),
                  const SizedBox(height: 20),
                  _buildSignUpSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Refactored method to build the greeting text
  Widget _buildGreetingText() {
    return const Row(
      children: [
        Text(
          'أهلا بك',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: maincolor,
          ),
        ),
      ],
    );
  }

  Widget _buildEmailField() {
    return _buildTextField(
      controller: _emailController,
      labelText: 'البريد الإلكتروني',
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'يرجى إدخال البريد الإلكتروني';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField() {
    return _buildTextField(
      controller: _passwordController,
      labelText: 'كلمة المرور',
      obscureText: _obscurePassword,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'يرجى إدخال كلمة المرور';
        }
        return null;
      },
      suffixIcon: IconButton(
        icon: Icon(
          _obscurePassword
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
        ),
        onPressed: () {
          setState(() {
            _obscurePassword = !_obscurePassword;
          });
        },
      ),
    );
  }

  // Reusable method for creating text fields
  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    TextInputType? keyboardType,
    bool obscureText = false,
    Widget? suffixIcon,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: maincolor),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: maincolor),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        suffixIcon: suffixIcon,
      ),
      validator: validator,
    );
  }

  // Refactored method for forgot password button
  Widget _buildForgotPasswordButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => const HomeScreen()),
            );
          },
          child: const Text(
            'نسيت كلمة المرور؟',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: maincolor,
            ),
          ),
        ),
      ],
    );
  }

  // Refactored method for login button
  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState?.validate() ?? false) {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) => const HomeScreen()),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: maincolor,
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 140,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: const Text(
        'تسجيل الدخول',
        style: TextStyle(
          fontSize: 17,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Refactored method for sign up section
  Widget _buildSignUpSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'ليس لديك حساب؟',
          style: TextStyle(fontSize: 18),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => SignupScreen()),
            );
          },
          child: const Text(
            'إنشاء حساب',
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: maincolor,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
