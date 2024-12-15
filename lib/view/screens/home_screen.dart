import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/color.dart';
import 'package:flutter_application_1/view/screens/order/session_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // State variables
  DateTime currentDate = DateTime.now();
  int selectedDayIndex = DateTime.now().weekday - 1;
  int selectedTimeIndex = -1;

  final List<String> daysOfWeek = [
    'السبت',
    'الأحد',
    'الاثنين',
    'الثلاثاء',
    'الأربعاء',
    'الخميس',
    'الجمعة'
  ];

  final List<String> timeSlots = [
    '9:00 صباحاً / 10:00 صباحاً',
    '10:00 صباحاً / 11:00 صباحاً',
    '11:00 صباحاً / 12:00 ظهراً',
    '12:00 ظهراً / 1:00 مساءً',
    '1:00 مساءً / 2:00 مساءً'
  ];

  final List<String> monthNames = [
    'يناير',
    'فبراير',
    'مارس',
    'أبريل',
    'مايو',
    'يونيو',
    'يوليو',
    'أغسطس',
    'سبتمبر',
    'أكتوبر',
    'نوفمبر',
    'ديسمبر'
  ];

  void changeMonth(int increment) {
    setState(() {
      currentDate = DateTime(currentDate.year, currentDate.month + increment);
    });
  }

  void selectDay(int index) {
    setState(() {
      selectedDayIndex = index;
    });
  }

  void selectTimeSlot(int index) {
    setState(() {
      selectedTimeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: maincolor),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        centerTitle: true,
        title: const Text(
          'مرحباً أحمد',
          style: TextStyle(
            color: maincolor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // Drawer
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'المصرية',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: maincolor,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            Expanded(
              child: ListView(
                children: [
                  buildDrawerItem('الرئيسية'),
                  buildDrawerItem('العروض'),
                  buildDrawerItem('الاقتراحات والشكاوي'),
                  buildDrawerItem('إعدادات الحساب'),
                  buildDrawerItem('الجلسات السابقة'),
                ],
              ),
            ),
          ],
        ),
      ),

      body: _buildBody(),
    );
  }

  Widget buildDrawerItem(String title) {
    return ListTile(
      leading: const Icon(Icons.chevron_left, color: maincolor),
      title: Text(
        title,
        textAlign: TextAlign.right,
        style: const TextStyle(
          color: maincolor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {},
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: maincolor),
                onPressed: () => changeMonth(-1),
              ),
              Text(
                '${currentDate.year} ٬ ${monthNames[currentDate.month - 1]}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: maincolor,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios, color: maincolor),
                onPressed: () => changeMonth(1),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(daysOfWeek.length, (index) {
              return GestureDetector(
                onTap: () => selectDay(index),
                child: Text(
                  daysOfWeek[index],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: selectedDayIndex == index ? maincolor : Colors.grey,
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 10),
          // Days in the month
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(7, (index) {
              int day = currentDate.day + index;
              return GestureDetector(
                onTap: () => selectDay(index),
                child: Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: selectedDayIndex == index
                        ? maincolor
                        : Colors.transparent,
                    border: Border.all(color: maincolor, width: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '$day',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color:
                          selectedDayIndex == index ? Colors.white : maincolor,
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 25),
          // Time slots
          Expanded(
            child: ListView.builder(
              itemCount: timeSlots.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => selectTimeSlot(index),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: selectedTimeIndex == index
                            ? maincolor.withOpacity(0.2)
                            : Colors.white,
                        border: Border.all(color: maincolor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            timeSlots[index],
                            style: const TextStyle(
                              fontSize: 16,
                              color: maincolor,
                            ),
                          ),
                          Text(
                            daysOfWeek[selectedDayIndex],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: maincolor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: selectedTimeIndex != -1
                ? () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (ctx) => const SessionDetailsScreen()),
                    );
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: maincolor,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            icon: const Icon(Icons.calendar_today, color: Colors.white),
            label: const Text(
              'حجز الآن',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
