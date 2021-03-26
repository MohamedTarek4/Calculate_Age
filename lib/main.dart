import 'package:calculate_age/functions.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    new MaterialApp(
      title: "Calculate Age",
      home: Home(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Days> _daysItems = [
    for (int x = 0; x <= 30; x++) Days(x, x),
  ];

  List<DropdownMenuItem<Days>> _dropdownMenuDaysItems;
  Days _selectedItem;

  List<DropdownMenuItem<Days>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<Days>> items = List();
    for (Days listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.number.toString()),
          value: listItem,
        ),
      );
    }
    return items;
  }

//////////////////////////////////////////////////////////////////////////////////////////////

  List<Months> _monthItems = [
    for (int x = 0; x <= 12; x++) Months(x, x),
  ];

  List<DropdownMenuItem<Months>> _dropdownMenuMonthesItems;
  Months _selectedItemMonthes;

  List<DropdownMenuItem<Months>> buildDropDownMenuMonthesItems(List listItems) {
    List<DropdownMenuItem<Months>> items = List();
    for (Months listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.numbermonth.toString()),
          value: listItem,
        ),
      );
    }
    return items;
  }

//////////////////////////////////////////////////////////////////////////////////////////////

  void initState() {
    super.initState();
    _dropdownMenuDaysItems = buildDropDownMenuItems(_daysItems);
    _selectedItem = _dropdownMenuDaysItems[0].value;

    _dropdownMenuMonthesItems = buildDropDownMenuMonthesItems(_monthItems);
    _selectedItemMonthes = _dropdownMenuMonthesItems[0].value;
  }

  final myController = TextEditingController();
  int yearOfBirth;
  int DayOfBirth;
  int monthOfBirth;

//////////////////////////////////////////////////////////////////////////////////////////////

  void bottomSheet(int y, int m, int d) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          if (m == 0 || d == 0 || y == 0) {
            return Container(
              color: Colors.blueGrey[900],
              child: Center(
                child: Text(
                  "Invalid data",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            );
          } else {
            return Container(
              color: Colors.blueGrey[900],
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Your Age",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    Text(
                      "You have $y years and  $m months and $d days",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ],
                ),
              ),
            );
          }
        });
  }
//////////////////////////////////////////////////////////////////////////////////////////////

  void CalculateAge(y, m, d) {
    yearOfBirth = (now.year - y) - 1;
    monthOfBirth = ((12 - m) + now.month) - 1;
    DayOfBirth = ((30 - d) + now.day);

    if (DayOfBirth >= 30) {
      DayOfBirth = DayOfBirth - 30;
      monthOfBirth = monthOfBirth + 1;
    }
    if (monthOfBirth >= 12) {
      yearOfBirth++;
      monthOfBirth = monthOfBirth - 12;
    }
    if (y > now.year || y == 0 || y == null) {
      yearOfBirth = 0;
    }
    if (d == 0) {
      DayOfBirth = 0;
    }
    if (m == 0) {
      monthOfBirth = 0;
    }

    bottomSheet(yearOfBirth, monthOfBirth, DayOfBirth);
  }
//////////////////////////////////////////////////////////////////////////////////////////////
  ///

  DateTime now = new DateTime.now();

//////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar,  the implmentation is founded at the class "function"
      appBar: calculateAge_appBar,

      //body
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            heightSizedBox150, // sizedBox that have a hieght 150

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Choose: ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            //////////////////////////////////////////////////////////////////////////////////////////////

            heightSizedBox30, // sizedBox with a hieght 30

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Day: "),
                widthSizedBox100,
                DropdownButton<Days>(
                    value: _selectedItem,
                    items: _dropdownMenuDaysItems,
                    onChanged: (value) {
                      setState(() {
                        _selectedItem = value;
                      });
                    }),
              ],
            ),

            //////////////////////////////////////////////////////////////////////////////////////////////

            heightSizedBox30, // sizedBox with a hieght 30

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Month: "),
                widthSizedBox90,
                DropdownButton<Months>(
                    value: _selectedItemMonthes,
                    items: _dropdownMenuMonthesItems,
                    onChanged: (value2) {
                      setState(() {
                        _selectedItemMonthes = value2;
                      });
                    }),
              ],
            ),

            //////////////////////////////////////////////////////////////////////////////////////////////

            heightSizedBox30,

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Year: "),
                widthSizedBox90,
                Container(
                  width: 100.0,
                  height: 100.0,
                  child: TextField(
                    autocorrect: true,
                    keyboardType: TextInputType.number,
                    controller: myController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'year',
                    ),
                  ),
                ),
              ],
            ),

            //////////////////////////////////////////////////////////////////////////////////////////////
            heightSizedBox30,

            Center(
              child: OutlineButton(
                onPressed: () {
                  int y = int.parse(myController.text);
                  int m = _selectedItemMonthes.numbermonth;
                  int d = _selectedItem.number;
                  CalculateAge(y, m, d);
                },

                //--------------------------------------------------------------------------
                child: Text("Calculate",
                    style: TextStyle(color: Colors.blueGrey[900])),
                color: Colors.blueGrey[900],
                borderSide:
                    new BorderSide(color: Colors.blueGrey[900], width: 3.0),
              ),

              //////////////////////////////////////////////////////////////////////////////////////////////
            ),
          ],
        ),
      ),
    );
  }
}
