// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:wellnest/Presentation/Appointments/success.dart';
import 'package:wellnest/Presentation/constants/constants.dart';


// ignore: must_be_immutable
class AppointmentPage extends StatelessWidget {
  AppointmentPage({super.key});

  final CalendarFormat _format = CalendarFormat.month;
  // ignore:
  ValueNotifier _selectedDay = ValueNotifier(DateTime.now());
  ValueNotifier _focussedDay = ValueNotifier(DateTime.now());
  ValueNotifier<int?> _currentIndex = ValueNotifier<int?>(null);
  ValueNotifier<bool> _isWeekend = ValueNotifier(true);
  ValueNotifier<bool> _timeSelected = ValueNotifier(false);
  String? token;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Appointment',
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 21,
              fontWeight: FontWeight.w600,
            ))),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          ValueListenableBuilder(
            valueListenable: _selectedDay,
            builder: (context, value, child) {
              return TableCalendar(
                headerStyle: const HeaderStyle(
                  titleCentered: true,
                ),
                calendarFormat: _format,
                focusedDay: value,
                firstDay: DateTime.now(),
                lastDay: DateTime(DateTime.now().year, 12, 31),
                rowHeight: 48,
                calendarStyle: const CalendarStyle(
                  isTodayHighlighted: true,
                  todayDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: maincolor,
                    shape: BoxShape.circle,
                  ),
                ),
                availableCalendarFormats: const {
                  CalendarFormat.month: 'Month',
                },
                selectedDayPredicate: (day) =>
                    isSameDay(day, _selectedDay.value),
                onDaySelected: (selectedDay, focusedDay) {
                  _selectedDay.value = selectedDay;
                  _focussedDay.value = focusedDay;
                  if (selectedDay.weekday == 6 || selectedDay.weekday == 7) {
                    _isWeekend.value = true;
                    _timeSelected.value = false;
                    _currentIndex.value = null;
                  } else {
                    _isWeekend.value = false;
                  }
                },
              );
            },
          ),
          kheight20,
          kheight20,
          Text('Select Consultation Time',
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ))),
          kheight10,
          ValueListenableBuilder<bool>(
              valueListenable: _isWeekend,
              builder: (context, isWeekend, child) {
                return isWeekend
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 30),
                        alignment: Alignment.center,
                        child: const Text(
                          'Weekend is not available, please select another date',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    : ValueListenableBuilder<int?>(
                        valueListenable: _currentIndex,
                        builder: (context, currentIndex, child) {
                          return GridView.builder(
                            padding:
                                EdgeInsets.symmetric(horizontal: size * 0.02),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4, childAspectRatio: 1.5),
                            itemCount: 8,
                            itemBuilder: (context, index) {
                              return InkWell(
                                splashColor: Colors.transparent,
                                onTap: () {
                                  _currentIndex.value = index;
                                  _timeSelected.value = true;
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: currentIndex == index
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                    color: currentIndex == index
                                        ? maincolor
                                        : null,
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${index + 9}:00 ${index + 9 > 11 ? "PM" : "AM"}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: currentIndex == index
                                          ? Colors.white
                                          : null,
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
              }),
          kheight50,
          kheight10,
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const SuccessPage(),
                  ),
                  (route) => false);
            },
            style: ButtonStyle(
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              backgroundColor: const WidgetStatePropertyAll(maincolor),
              minimumSize:
                  WidgetStateProperty.all(Size(size * 0.92, size * 0.15)),
            ),
            child: const Text(
              'Make Appointment',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
}
