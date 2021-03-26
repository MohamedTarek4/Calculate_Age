import 'package:flutter/material.dart';

AppBar calculateAge_appBar = new AppBar(
  title: new Text(
    "Calculate Age",
    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
  ),
  centerTitle: true,
  backgroundColor: Colors.blueGrey[900],
);

SizedBox heightSizedBox150 = new SizedBox(
  height: 80,
);

SizedBox heightSizedBox30 = new SizedBox(
  height: 30,
);

SizedBox widthSizedBox100 = new SizedBox(
  width: 100,
);

SizedBox widthSizedBox90 = new SizedBox(
  width: 80,
);


//////////////////////////////////////////////////////////////////////////////////////////////

class Days {
  int value;
  int number;

  Days(this.value, this.number);
}

class Months {
  int value;
  int numbermonth;

  Months(this.value, this.numbermonth);
}

class Year {
  int value;
  int numberYear;

  Year(this.value, this.numberYear);
}

