import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/color.dart';
import 'package:flutter_application_1/view/screens/auth/login_screen.dart';
import 'package:flutter_application_1/view/screens/home_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "image": "assets/images/Car rental-rafiki 1.svg",
      "title": "ابدأ رحلتك مع القيادة",
      "description":
          "تعلّم القيادة مع المدرسة المصرية - خطواتك الأولى نحو الاحتراف! اكتشف أفضل الميزات المصممة خصيصًا لك.",
    },
    {
      "image": "assets/images/driving-rafiki 1.svg",
      "title": "مرونة وسهولة في اختيار مواعيدك",
      "description":
          "اختر مواعيدك بكل سهولة، واستمتع بجلسات تدريب مخصصة تناسب احتياجاتك!",
    },
    {
      "image": "assets/images/driving school-rafiki 1.svg",
      "title": "برامج تدريب تناسب الجميع",
      "description":
          "سواء كنت مبتدئًا أو محترفًا – لدينا البرنامج المناسب سواء كنت مبتدئًا أو محترفًا – لدينا البرنامج المناسب",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _onboardingData.length,
              itemBuilder: (context, index) {
                final data = _onboardingData[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      data["image"]!,
                      height: 300,
                      width: 300,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      data["title"]!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: maincolor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        data["description"]!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          color: secondcolor,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _onboardingData.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                height: 8,
                width: _currentPage == index ? 16 : 8,
                decoration: BoxDecoration(
                  color: _currentPage == index
                      ? Colors.indigo
                      : Colors.indigo.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: () {
                if (_currentPage == _onboardingData.length - 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                } else {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: GradientColors,
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 50,
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  _currentPage == _onboardingData.length - 1
                      ? "ابدأ"
                      : "التالي",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
