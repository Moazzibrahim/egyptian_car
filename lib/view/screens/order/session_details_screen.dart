import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/color.dart';
import 'package:flutter_application_1/view/widgets/custom_appbar.dart';

class SessionDetailsScreen extends StatefulWidget {
  const SessionDetailsScreen({super.key});

  @override
  _SessionDetailsScreenState createState() => _SessionDetailsScreenState();
}

class _SessionDetailsScreenState extends State<SessionDetailsScreen> {
  String? selectedLocation = "office";
  String? selectedSessionType = "beginner";
  String? selectedPaymentMethod = "cash";

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // RTL direction for Arabic
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(context, 'تفاصيل الجلسة'),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildSectionTitle("اختر الموقع :"),
                      buildRadioGroup(
                        options: {"من المكتب": "office", "من المنزل": "home"},
                        selectedValue: selectedLocation,
                        onChanged: (value) =>
                            setState(() => selectedLocation = value),
                      ),
                      const Divider(),
                      buildSectionTitle("نوع الجلسة :"),
                      buildRadioGroup(
                        options: {
                          "مبتدئ": "beginner",
                          "متوسط": "intermediate",
                          "احترافي": "professional"
                        },
                        selectedValue: selectedSessionType,
                        onChanged: (value) =>
                            setState(() => selectedSessionType = value),
                      ),
                      const Divider(),
                      buildSectionTitle("طريقة الدفع :"),
                      buildRadioGroup(
                        options: {"كاش": "cash", "فيزا": "visa"},
                        selectedValue: selectedPaymentMethod,
                        onChanged: (value) =>
                            setState(() => selectedPaymentMethod = value),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // The button is placed at the bottom of the screen
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Button logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: maincolor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "عرض السعر",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: maincolor,
        ),
      ),
    );
  }

  Widget buildRadioGroup({
    required Map<String, String> options,
    required String? selectedValue,
    required ValueChanged<String?> onChanged,
  }) {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 16.0, // Space between options
      children: options.entries.map((entry) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Radio<String>(
              value: entry.value,
              groupValue: selectedValue,
              activeColor: maincolor,
              onChanged: onChanged,
            ),
            Text(
              entry.key,
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
          ],
        );
      }).toList(),
    );
  }
}
