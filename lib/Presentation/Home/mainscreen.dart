// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:wellnest/Presentation/Appointments/schedule.dart';
import 'package:wellnest/Presentation/Home/home.dart';
import 'package:wellnest/Presentation/Messages/messages.dart';
import 'package:wellnest/Presentation/Profile/profile_page.dart';
import 'package:wellnest/Presentation/constants/constants.dart';

  ValueNotifier<int> pagenotifier = ValueNotifier(0);
class MainScreenPage extends StatelessWidget {
  const MainScreenPage({super.key});
 final _pages = const [HomePage(), SchedulePage(), MessagesPage(), ProfilePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: pagenotifier,
          builder: (context, newIndex, _) {
            return _pages[newIndex];
          }),
      bottomNavigationBar: ValueListenableBuilder(
          valueListenable: pagenotifier,
          builder: (context, newIndex, _) {
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: newIndex,
              selectedItemColor: maincolor,
              unselectedItemColor: const Color.fromRGBO(0, 0, 0, .56),
              showSelectedLabels: true,
              showUnselectedLabels: true,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_outlined,
                      size: 29.5,
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.calendar_month_sharp,
                      size: 26,
                    ),
                    label: 'Schedule'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.message_outlined,
                      size: 29.5,
                    ),
                    label: 'Messages'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person,
                      size: 29,
                    ),
                    label: 'Profile'),
              ],
              onTap: (value) {
                pagenotifier.value = value;
              },
            );
          }),
    );
  }
}
