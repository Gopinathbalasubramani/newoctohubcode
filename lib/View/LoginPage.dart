import 'dart:convert';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskoctohub/Models/Login/Login.dart';
import 'package:taskoctohub/Models/Login/ResgisterResponse.dart';

import '../../Data/response/Status.dart';
import '../../Res/Utils/color.dart';
import '../../ViewModel/Login/LoginVM.dart';

import 'Signup/SignupPage.dart';
import 'Signup/Update.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginVM loginModel = LoginVM();
  RegisterResponse registerResponse = RegisterResponse();
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
bool passwordHide = true;
  String token = '';
  final _formKey = GlobalKey<FormState>();
  List<Stores>  storeDate = [];
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height *0.30,),
                /*Align(
                  alignment: Alignment.center,
                    child: SvgPicture.asset('assets/images/undraw_ideas.svg',height:100 ,width: screenWidth -40,)),
                SizedBox(height: 20,),*/
                Text("Login",style: TextStyle(color: Colors.white,fontSize: 20),),
                Padding(
                  padding: const EdgeInsets.only(left: 16,right: 16,top: 20),
                  child: TextFormField(
                      controller:userName ,

                      validator: (value) {

                        if(value!.isNotEmpty){
                          return '';
                        }
                        else{
                          return 'enter your username';
                        }
                      },
                      decoration: InputDecoration(
                        filled: passwordHide,
                        hintText: 'enter username',
                        fillColor: Colors.grey[100],


                        contentPadding:  EdgeInsets.only(left: 16) ,
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
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16,right: 16,top: 20),
                  child: TextFormField(
                      controller:password ,
                      validator: (value) {

                        if(value!.isNotEmpty){
                          return '';
                        }
                        else{
                          return 'enter password';
                        }
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'enter password',

                        fillColor: Colors.grey[100],


                        contentPadding:  EdgeInsets.only(left: 16) ,
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
                      )
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(left: 16,right: 16,top: 26,bottom: 16),
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
                    onPressed:  () {
                      /*if (_formKey.currentState!.validate()) {*/
                      // var data = Stores(text: stores.text);
                      // storeDate.add(data);
                      var body = LoginRequest(
                         email: userName.text,
                        password: password.text
                      );
                      userName.clear();
                      password.clear();

                      loginModel.logindetail(body);

                      /*  }*/


                      /*Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomTabsCustomWidget(
                              menuScreenContext: context,
                              selectedIndex: 0,
                            )),
                      );*/

                    }, child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  ),
                ),

                ChangeNotifierProvider<LoginVM>(
                  create: (BuildContext context) => loginModel,
                  child: Consumer<LoginVM>(builder: (context, viewModel, _) {
                    if (loginModel.loginResonse.data?.apiname ==
                        LoginEnum.LOGIN) {
                      handleLoginApiResponse(
                          loginModel.loginResonse.status);
                    }
                    return Container();
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  handleLoginApiResponse(var status) {
    print("LOGIN info status  $status");
    switch (status) {
      case Status.LOADING:
        print("LOGIN Info :: LOADING ");
        break;
      case Status.ERROR:
        print("LOGIN Info :: ERROR ");
        break;
      case Status.COMPLETED:
        loginModel.loginResonse.data?.apiname = LoginEnum.NONE;
        print("LOGIN Info :: COMPLETED ");

         loginModel.loginResonse.data?.authToken ??'';
        rootnavigation(loginModel.loginResonse.data?.authToken ??'');

        break;
      default:
    }
    return Container();
  }
  rootnavigation(String token){
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SignupPage(
              token:token

          )),
    );
  }
}
