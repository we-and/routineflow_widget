import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClosestRoutine extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    List<DateTime> dateTimes = [
      DateTime.now().subtract(Duration(hours: 2)),
      DateTime.now().add(Duration(hours: 1)),
      DateTime.now().add(Duration(hours: 3)),
      DateTime.now().add(Duration(hours: 3,days: 3)),
      DateTime.now().subtract(Duration(hours: 4)),
    ];

    DateTime closestDateTime =RoutineFinder. findClosestDateTime(dateTimes);
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Text("Date list:",style: TextStyle(fontWeight: FontWeight.bold),),
          Column(children: dateTimes.map((date)=>Text(DateFormat('yyyy-MM-dd HH:mm:ss').format(date))).toList(),),
          Text("Closest to now:",style: TextStyle(fontWeight: FontWeight.bold),),
          Text("The closest date and time is:",style: TextStyle(fontWeight: FontWeight.normal),),
          Text(DateFormat('yyyy-MM-dd HH:mm:ss').format(closestDateTime)),
        ],
      ),
    );
  }
}







class RoutineFinder {
static DateTime findClosestDateTime(List<DateTime> dateTimes) {
  // Get the current datetime
  final now = DateTime.now();

  DateTime? closestDateTime;
  Duration? smallestDifference;

  for (final dateTime in dateTimes) {
    // Calculate the difference in time between now and the current dateTime
    final difference = dateTime.difference(now).abs();

    // If it's the first iteration or if the current difference is smaller than the smallest found so far
    if (smallestDifference == null || difference < smallestDifference) {
      smallestDifference = difference;
      closestDateTime = dateTime;
    }
  }

  // Handle the case where the input list might be empty
  if (closestDateTime == null) {
    throw ArgumentError("The list of dates cannot be empty.");
  }

  return closestDateTime;
}
}