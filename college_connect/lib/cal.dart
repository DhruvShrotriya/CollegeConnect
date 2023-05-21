import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UpcomingEventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upcoming Events'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Current Week',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          WeekRow(),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Upcoming Events',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5, // Replace with your actual number of events
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Event ${index + 1}'),
                  subtitle: Text('Event description'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class WeekRow extends StatelessWidget {
  final List<String> daysOfWeek = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun'
  ];

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final currentWeekday = now.weekday;
    final startOfWeek = now.subtract(Duration(days: currentWeekday - 1));
    final currentMonth =
        DateFormat.MMMM().format(now); // Import 'package:intl/intl.dart'

    return Column(
      children: [
        SizedBox(height: 1),
        Text(
          currentMonth,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        Container(
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 7,
            itemBuilder: (context, index) {
              final day = startOfWeek.add(Duration(days: index));
              final isToday = day.day == now.day;

              return Container(
                width: 60,
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isToday ? Colors.deepPurple : Colors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        daysOfWeek[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isToday ? Colors.deepPurple : Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        day.day.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isToday ? Colors.deepPurple : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
