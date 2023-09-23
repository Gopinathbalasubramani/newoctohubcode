import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Res/Utils/color.dart';


class TaskDetailsPage extends StatefulWidget {
  const TaskDetailsPage({super.key});

  @override
  State<TaskDetailsPage> createState() => _TaskDetailsPageState();
}

class _TaskDetailsPageState extends State<TaskDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
        backgroundColor: primary,
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_sharp)),
        title: Text('Task Detail'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 0.0),
                child: ListTile(
                  contentPadding: const EdgeInsets.only(),
                  leading:  Container(
                    decoration: BoxDecoration(
                        color: primarySoft,
                        shape: BoxShape.circle
                    ),
                    height: 60,width: 60,

                    padding: const EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 10),
                    child: SvgPicture.asset('assets/images/to-do-list.svg',height: 20,width: 20,fit: BoxFit.contain,),
                  ),

                  // userData['avatar'] != null
                  //     ? Image.network(
                  //   userData['avatar'],
                  //   width: 120,
                  //   height: 80,
                  //   fit: BoxFit.values.last,
                  // )
                  //     : Container(
                  //   width: 80,
                  //   height: 80,
                  //   color: Colors.grey,
                  // ),
                  title: Row(

                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "1",
                        style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize:35,
                            fontFamily: 'Open Sans'
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          "active task",
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize:12,
                              color: Color(0xffe0e0e0),
                              fontFamily: 'Open Sans'
                          ),
                        ),
                      ),
                    ],
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      'Today 2020 May 20',
                      maxLines: 2,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          fontFamily: 'Open Sans'
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  trailing: Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: primary
                    ),
                    child: Text(
                      '+',
                      maxLines: 2,
                      style: const TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 35,
                          fontFamily: 'Open Sans',
                          color: Colors.white
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              Divider(),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(shape: BoxShape.circle,
                        color: greenAccent),child: Icon(Icons.check,color: Colors.white,size: 15,),),
                  SizedBox(width: 20,),
                  Text('Task Completed')

                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    child: Icon(Icons.add_alert,color: Colors.grey,size: 20,),),
                  SizedBox(width: 20,),
                  Text('Task Completed'),

                ],
              ),
              SizedBox(height: 20,),
              Divider(),
              Container(
                margin: EdgeInsets.symmetric(vertical: 0.0),
                child: ListTile(
                  contentPadding: const EdgeInsets.only(),
                  leading:  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      border: Border.all(width: 1,color: Color(0xfff2f2f2))

                    ),
                    height: 60,width: 60,

                    padding: const EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 10),
                    child: Icon(Icons.event_note,size: 20,),
                  ),

                  // userData['avatar'] != null
                  //     ? Image.network(
                  //   userData['avatar'],
                  //   width: 120,
                  //   height: 80,
                  //   fit: BoxFit.values.last,
                  // )
                  //     : Container(
                  //   width: 80,
                  //   height: 80,
                  //   color: Colors.grey,
                  // ),
                  title: Row(

                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          "title",
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize:12,
                              color: Color(0xffe0e0e0),
                              fontFamily: 'Open Sans'
                          ),
                        ),
                      ),
                    ],
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Text(
                      'Attend the flutter meetup a1 Andela',
                      maxLines: 2,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          fontFamily: 'Open Sans'
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                ),
              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.symmetric(vertical: 0.0),
                child: ListTile(
                  contentPadding: const EdgeInsets.only(),
                  leading:  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(width: 1,color: Color(0xfff2f2f2))

                    ),
                    height: 60,width: 60,

                    padding: const EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 10),
                    child: Icon(Icons.notes,size: 20,),
                  ),

                  // userData['avatar'] != null
                  //     ? Image.network(
                  //   userData['avatar'],
                  //   width: 120,
                  //   height: 80,
                  //   fit: BoxFit.values.last,
                  // )
                  //     : Container(
                  //   width: 80,
                  //   height: 80,
                  //   color: Colors.grey,
                  // ),
                  title: Row(

                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          "Note",
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize:12,
                              color: Color(0xffe0e0e0),
                              fontFamily: 'Open Sans'
                          ),
                        ),
                      ),
                    ],
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Text(
                      'I have to attend an importent meetup where we should showcase some quick apps builld the app ',
                      maxLines: 2,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          fontFamily: 'Open Sans'
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                ),
              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.symmetric(vertical: 0.0),
                child: ListTile(
                  contentPadding: const EdgeInsets.only(),
                  leading:  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(width: 1,color: Color(0xfff2f2f2))

                    ),
                    height: 60,width: 60,

                    padding: const EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 10),
                    child: Icon(Icons.calendar_today_outlined,size: 20,),
                  ),

                  // userData['avatar'] != null
                  //     ? Image.network(
                  //   userData['avatar'],
                  //   width: 120,
                  //   height: 80,
                  //   fit: BoxFit.values.last,
                  // )
                  //     : Container(
                  //   width: 80,
                  //   height: 80,
                  //   color: Colors.grey,
                  // ),
                  title: Row(

                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          "date",
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize:12,
                              color: Color(0xffe0e0e0),
                              fontFamily: 'Open Sans'
                          ),
                        ),
                      ),
                    ],
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Text(
                      '2023-may-20',
                      maxLines: 2,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          fontFamily: 'Open Sans'
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                ),
              ),
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.symmetric(vertical: 0.0),
                child: ListTile(
                  contentPadding: const EdgeInsets.only(),
                  leading:  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(width: 1,color: Color(0xfff2f2f2))

                    ),
                    height: 60,width: 60,

                    padding: const EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 10),
                    child: Icon(Icons.timer_sharp,size: 20,),
                  ),

                  // userData['avatar'] != null
                  //     ? Image.network(
                  //   userData['avatar'],
                  //   width: 120,
                  //   height: 80,
                  //   fit: BoxFit.values.last,
                  // )
                  //     : Container(
                  //   width: 80,
                  //   height: 80,
                  //   color: Colors.grey,
                  // ),
                  title: Row(

                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          "time",
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize:12,
                              color: Color(0xffe0e0e0),
                              fontFamily: 'Open Sans'
                          ),
                        ),
                      ),
                    ],
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(left: 0),
                    child: Text(
                      '2:35PM',
                      maxLines: 2,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          fontFamily: 'Open Sans'
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
