import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:intl/intl.dart';
import '../../Utils/color.dart';
import '../BottomNavigationBar/bottomtabbar.dart';
import 'bottomsheet.dart';

class Entrypage extends StatefulWidget {
  const Entrypage({super.key});

  @override
  State<Entrypage> createState() => _EntrypageState();
}

class _EntrypageState extends State<Entrypage> {
  @override
  final _formKey = GlobalKey<FormState>();
  TextEditingController _titleCtrl = TextEditingController();
  TextEditingController _noteCtrl= TextEditingController();
  TextEditingController _dateCtrl= TextEditingController();
  TextEditingController _timeCtrl= TextEditingController();
  bool status = false;
  selectDate(

      ) async {
    DateTime selectedDate = DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: selectedDate,
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      selectedDate = picked;
      final DateFormat formatter = DateFormat('dd-MM-yyyy');
      final String formatted = formatter.format(picked);
      _dateCtrl.text = formatted;
    }

    return null;
  }
  Widget build(BuildContext context) {
var screenWidth = MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: bgColor,
      body:  SafeArea(
        child:   Center(
          child: Padding(
              padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
    SvgPicture.asset('assets/images/undraw_ideas.svg',height:300 ,width: screenWidth -40,),
                  SizedBox(height: 30,),
                  Text(
                    'To get started with the app, create your first task',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      height: 1.4,
                      fontSize: 20,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 30,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: primary,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15.0),
                        textStyle: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                    onPressed: () {
                      showModalBottomSheet<void>(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft:  Radius.circular(10))),
                        // context and builder are
                        // required properties in this widget
                        context: context,
                        builder: (BuildContext context) {
                          // we set up a container inside which
                          // we create center column and display text

                          // Returning SizedBox instead of a Container
                          return BottomSheetPage();
                        },
                      );

                    }, child: Text(
                    '+  New task',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
