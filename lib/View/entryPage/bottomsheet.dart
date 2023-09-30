import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:intl/intl.dart';

import '../../Utils/color.dart';
import '../BottomNavigationBar/bottomtabbar.dart';
class BottomSheetPage extends StatefulWidget {
  const BottomSheetPage({super.key});

  @override
  State<BottomSheetPage> createState() => _BottomSheetPageState();
}

class _BottomSheetPageState extends State<BottomSheetPage> {
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
    return SizedBox(
      height: 480,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Task form'),IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: Icon(Icons.close_rounded,color: Colors.black,size: 20,))
              ],),
            SizedBox(height: 10,),
            Form(
              key: _formKey,
              //autovalidateMode: _autoValidate,
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical: 2.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _titleCtrl,
                      // validator: (value) => Validate.getMsg('title', value ??''),
                      decoration: buildInputDecoration(
                        false,
                        'Enter the task title',
                        iconData: Icons.edit,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                            onTap: () => selectDate(),
                            child: AbsorbPointer(
                              child: TextFormField(
                                readOnly: true,
                                controller: _dateCtrl,
                                // validator: (value) => Validate.getMsg(
                                //   'date',
                                //   value ??'',
                                // ),
                                decoration: buildInputDecoration(
                                  false,
                                  'Date',
                                  iconData: Icons.calendar_today,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {

    TimeOfDay? pickedTime =  await showTimePicker(
    initialTime: TimeOfDay.now(),
    context: context,
    );

    if(pickedTime != null ){
    print(pickedTime.format(context));   //output 10:51 PM

    setState(() {
    _timeCtrl.text = pickedTime.format(context); //set the value of text field.
    });
    }else{
    print("Time is not selected");
    }
    },

                            child: AbsorbPointer(
                              child: TextFormField(
                                readOnly: true,
                                controller: _timeCtrl,
                                // validator: (value) => Validate.getDateTimeMsg(
                                //   'time',
                                //   value!,
                                // ),
                                decoration: buildInputDecoration(
                                  false,
                                  'Time',
                                  iconData: Icons.alarm,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      maxLines: 3,
                      maxLength: 100,
                      controller: _noteCtrl,
                      //validator: (value) => Validate.getMsg('note', value!),
                      decoration: buildInputDecoration(
                        true,
                        'Enter a little note to describe the task', iconData: IconData(1),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[

                          FlutterSwitch(
                            activeColor: Colors.green,
                            width: 70.0,
                            height: 30.0,
                            valueFontSize: 15.0,
                            toggleSize: 25.0,
                            value: status,
                            borderRadius: 30.0,
                            padding: 8.0,
                            showOnOff: true,
                            onToggle: (val) {
                              setState(() {
                                status = val;
                              });
                            },
                          ),
                          Text(
                            'Set reminder for this task ?',
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              color: darkGrey,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: primary,
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15.0),
                            textStyle: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold)),
                //           TextEditingController _titleCtrl = TextEditingController();
                //         TextEditingController _noteCtrl= TextEditingController();
                //   TextEditingController _dateCtrl= TextEditingController();
                // TextEditingController _timeCtrl= TextEditingController();
                        onPressed: _titleCtrl.text.isNotEmpty  && _noteCtrl.text.isNotEmpty &&_dateCtrl.text.isNotEmpty&&_timeCtrl.text.isNotEmpty?  () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomTabsCustomWidget(
                                  menuScreenContext: context,
                                  selectedIndex: 0,
                                )),
                          );

                        }:null, child: Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      ),
                    )

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ModalBottomSheet extends StatelessWidget {
   ModalBottomSheet({Key? key}) : super(key: key);

  @override
  final _formKey = GlobalKey<FormState>();
   TextEditingController _titleCtrl = TextEditingController();
   TextEditingController _noteCtrl= TextEditingController();
   TextEditingController _dateCtrl= TextEditingController();
   TextEditingController _timeCtrl= TextEditingController();
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
         // height: 200,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  <Widget>[
                  Row(children: [
                    Text('Task form')
                  ],),
                  Form(
                    key: _formKey,
                    //autovalidateMode: _autoValidate,
                    child: Padding(
                      padding:  EdgeInsets.symmetric(vertical: 2.0),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: _titleCtrl,
                            // validator: (value) => Validate.getMsg('title', value ??''),
                            decoration: buildInputDecoration(
                              false,
                              'Enter the task title',
                              iconData: Icons.edit,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: GestureDetector(
                                  // onTap: () => utils.selectDate(context, _dateCtrl!),
                                  child: AbsorbPointer(
                                    child: TextFormField(
                                      readOnly: true,
                                      controller: _dateCtrl,
                                      // validator: (value) => Validate.getMsg(
                                      //   'date',
                                      //   value ??'',
                                      // ),
                                      decoration: buildInputDecoration(
                                        false,
                                        'Date',
                                        iconData: Icons.calendar_today,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              Expanded(
                                child: GestureDetector(
                                  //onTap: () => utils.selectTime(context, _timeCtrl!),
                                  child: AbsorbPointer(
                                    child: TextFormField(
                                      readOnly: true,
                                      controller: _timeCtrl,
                                      // validator: (value) => Validate.getDateTimeMsg(
                                      //   'time',
                                      //   value!,
                                      // ),
                                      decoration: buildInputDecoration(
                                        false,
                                        'Time',
                                        iconData: Icons.alarm,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            maxLines: 3,
                            maxLength: 100,
                            controller: _noteCtrl,
                            //validator: (value) => Validate.getMsg('note', value!),
                            decoration: buildInputDecoration(
                              true,
                              'Enter a little note to describe the task', iconData: IconData(1),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[

                                Text(
                                  'Set reminder for this task ?',
                                  style: TextStyle(
                                    fontFamily: 'Open Sans',
                                    color: darkGrey,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),

                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

}
InputDecoration buildInputDecoration(bool isTextArea, String hintText,
    {required IconData iconData}) =>
    InputDecoration(
      filled: true,
      hintText: hintText,
      fillColor: Colors.grey[100],
      prefixIcon: isTextArea ? null : Icon(iconData),
      contentPadding: isTextArea ? EdgeInsets.all(15.0) : null,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
    );