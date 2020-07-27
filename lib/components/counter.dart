import 'package:flutter/material.dart';


class Counter extends StatefulWidget {

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {

  int currentValue = 0;
  int minValue = 0;
  int maxValue = 99;

  @override

  Widget build(BuildContext context) {
      return Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Container(
                width: 40.0,
                height: 40.0,
                child: FloatingActionButton(
                  onPressed: () {
                    if(currentValue > minValue)
                      setState((){currentValue = currentValue - 1;});
                  },
                  heroTag: 'plus',
                  backgroundColor: Colors.red,
                  child: Icon(Icons.remove),
                ),
              ),
              SizedBox(width: 10),
              Text(currentValue.toString(),style: TextStyle(fontSize: 30)),
              SizedBox(width: 10),
              Container(
                width: 40.0,
                height: 40.0,
                child: FloatingActionButton(
                  onPressed: () {
                    if(currentValue < maxValue)
                      setState((){currentValue = currentValue + 1;});
                },
                heroTag: 'plus',
                backgroundColor: Colors.red,
                  child: Icon(Icons.add),
                ),
              ),

            ],
          ),
        ),
      );
  }
}
