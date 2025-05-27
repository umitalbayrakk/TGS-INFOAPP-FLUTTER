import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tgs_info_app_flutter/utils/colors.dart';

// MARK: CalendarWidgets
class CalendarWidgets extends StatelessWidget {
  const CalendarWidgets({super.key});
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
        weekendStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
      ),
      onDaySelected: (selectedDay, focusedDay) {
        print(selectedDay);
      },
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        weekendTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
        selectedTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
        defaultTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
        todayTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
        todayDecoration: BoxDecoration(color: AppColors.appBarColor, shape: BoxShape.circle),
        selectedDecoration: BoxDecoration(color: AppColors.appBarColor, shape: BoxShape.circle),
      ),
      locale: 'tr',
      selectedDayPredicate: (day) => isSameDay(day, DateTime.now()),
      calendarFormat: CalendarFormat.week,
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: DateTime.now(),
      headerStyle: HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
        formatButtonShowsNext: false,
        titleTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
