import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskoctohub/Models/UserList/userList.dart';
import 'package:http/http.dart' as http;
import '../../Data/network/ApiEndPoints.dart';
import '../../Data/network/BaseApiService.dart';

class UpdateData extends StatefulWidget {
 final String? token;
  const UpdateData({super.key,this.token});

  @override
  State<UpdateData> createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  @override
void initState() {
    // TODO: implement initState
    super.initState();
    getUserListDetails();
  }
  List<UserListResponse> userListResponse = [];
  getUserListDetails() async {
    try {
      Future.delayed(Duration.zero, () async {


        var databody = UserListRequest(
            companyId:"DEF56C4F-808D-4F81-993C-EF67C77A5F91",
            mid: "MIN#00"
        );
        var bodyString = json.encode(databody);
        Map<String,String> headers;
        headers = {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${widget.token}'
        };
        final getApiurl =
            '${BaseApiService.base_url}${ApiEndPoints().getContactProfiles}';
        var response = await http.post(Uri.parse(getApiurl),body: bodyString,headers: headers);
        print("response${response.statusCode}");
        if(response.statusCode == 200){



          setState(() {
            var planList = jsonDecode(response.body);
            userListResponse = List<UserListResponse>.from(
                planList.map((i) => UserListResponse.fromJson(i)));

          });

        }
        /*pleacementVM.getPermanencyPlanListDataDetails(
          getApiurl,
        );*/
      });
    } catch (Exception) {
      print(Exception);
    }
  }
  Widget build(BuildContext context) {


    return  Scaffold(
body: Center(
  child: Text('Login Success'),
),
    );
  }
}
