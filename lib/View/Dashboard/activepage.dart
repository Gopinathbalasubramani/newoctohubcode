import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:octohubtask/Utils/color.dart';

import 'CalenderListView.dart';

class ActivatePage extends StatefulWidget {
  const ActivatePage({super.key});

  @override
  State<ActivatePage> createState() => _ActivatePageState();
}

class _ActivatePageState extends State<ActivatePage> {
  @override
  DateTime _selectedValue = DateTime.now();
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primary,
        leading: Icon(Icons.event_note),
        title: Text('Activate task'),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                DatePickerTimeline(
                  _selectedValue,
                  onDateChange: (date) {
                    setState(() {
                      _selectedValue = date;
                    });
                  }, width: double.infinity,
                ),
                Divider(),
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      //DayTasksText(),
                      //AddTaskFloatingButton(fromPage: TaskPageStatus.active),
                    ],
                  ),
                ),
                Divider(),
                // Container(
                //   height: MediaQuery.of(context).size.height -
                //       (7 * kBottomNavigationBarHeight),
                //   child: TaskList(
                //     taskStream: taskStream,
                //     pageStatus: pageStatus,
                //   ),
                // )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
