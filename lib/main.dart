import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(const HokReglApp());
}

class HokReglApp extends StatelessWidget {
  const HokReglApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HOK Regl Takvimi',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const CalendarScreen(),
    );
  }
}

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});
  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HOK Regl Takvimi 🌸')),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selected, focused) {
              setState(() {
                _selectedDay = selected;
                _focusedDay = focused;
              });
            },
          ),
          if (_selectedDay != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Seçilen Gün: ${_selectedDay!.day}.${_selectedDay!.month}.${_selectedDay!.year}',
                style: const TextStyle(fontSize: 18, color: Colors.pink),
              ),
            ),
        ],
      ),
    );
  }
}
