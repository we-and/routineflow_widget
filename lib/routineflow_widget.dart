import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:routineflow_widget/dashed_line.dart';

class RoutineFlow extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      RoutineFlowFirstLine(),
      RoutineFlowDashLine(),
        RoutineFlowTitle(),
        RoutineFlowSteps(),
        RoutineFlowTimer()
      ],),
    );
  }
}

class RoutineFlowFirstLine extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.fromLTRB(0,5,0,10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text("UP NEXT",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 12),),
        Text("00:15 - 5 steps",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize: 12),)
      ],),
    );
  }
}

class RoutineFlowDashLine extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return   const DashedLine(
      height: 5,
      color: Colors.blue,
      dashWidth: 30,
      dashSpace: 10,
    );
    return const MySeparator(color: Colors.blue,height: 3,);
  }
}

class RoutineFlowTitle extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
      Text("Morning Routine",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
      Text("5:30 PM",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)
      ],),
    );
  }
}

class RoutineFlowSteps extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
Text("1. Make my bed",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12, color: Colors.grey),)
    ],);
  }
}

class RoutineFlowTimer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Wrap(children: [
        Text("13:20 to 13:35 ",style: TextStyle(  color: Colors.blue,fontSize: 12,decoration: TextDecoration.underline,decorationColor: Colors.blue)),
        Text("if you start now",style: TextStyle(color: Colors.blue,fontSize: 12),)
        ],),
      ),
    );
  }
}


class MySeparator extends StatelessWidget {
  const MySeparator({Key? key, this.height = 1, this.color = Colors.black})
      : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 20.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color,borderRadius: BorderRadius.circular(10)),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}