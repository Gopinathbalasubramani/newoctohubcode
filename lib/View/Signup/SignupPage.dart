import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:taskoctohub/Models/Login/ResgisterResponse.dart';
import 'package:taskoctohub/View/LoginPage.dart';

import '../../Data/network/ApiEndPoints.dart';
import '../../Data/network/BaseApiService.dart';
import '../../Data/response/Status.dart';
import '../../Models/UserList/UpdateUser.dart';
import '../../Models/UserList/userList.dart';
import '../../Res/Utils/color.dart';
import '../../ViewModel/Login/LoginVM.dart';
import '../entryPage/bottomsheet.dart';
import 'package:http/http.dart' as http;
class SignupPage extends StatefulWidget {
  final String? token;
  const SignupPage({super.key,this.token});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  LoginVM loginModel = LoginVM();
  RegisterResponse registerResponse = RegisterResponse();
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController stores = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController country = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List<Stores>  storeDate = [];
  List<UpdateDataStores>  updaDataStore = [];
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserListDetails();
  }
  bool clickupdate = false;
  bool clickregister = true;
  int? updateIndex;
  List<UserListResponse> userListResponse = [];
  getUserListDetails() async {
    print("authtkone${widget.token}");
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
              children: [
                SizedBox(height: 20,),
                /*Align(
                  alignment: Alignment.center,
                    child: SvgPicture.asset('assets/images/undraw_ideas.svg',height:100 ,width: screenWidth -40,)),
                SizedBox(height: 20,),*/
                Text("Sign up",style: TextStyle(color: Colors.white,fontSize: 20),),
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
                      filled: true,
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
                      controller:email ,
                      validator: (value) {

                        if(value!.isNotEmpty){
                          return '';
                        }
                        else{
                          return 'enter your Email';
                        }
                      },
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'enter email',
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
                      controller:mobile ,
                      validator: (value) {

                        if(value!.isNotEmpty){
                          return '';
                        }
                        else{
                          return 'enter your Mobile';
                        }
                      },
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'enter mobile',
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
                      controller:stores ,
                      validator: (value) {

                        if(value!.isNotEmpty){
                          return '';
                        }
                        else{
                          return 'enter your stores';
                        }
                      },
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'enter Stores',
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
                      controller:companyName ,
                      validator: (value) {

                        if(value!.isNotEmpty){
                          return '';
                        }
                        else{
                          return 'enter  company name';
                        }
                      },
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'enter company name',
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
                      controller:address ,
                      validator: (value) {

                        if(value!.isNotEmpty){
                          return '';
                        }
                        else{
                          return 'enter  address';
                        }
                      },
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'enter address',
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
                      controller:city ,
                      validator: (value) {

                        if(value!.isNotEmpty){
                          return '';
                        }
                        else{
                          return 'enter city';
                        }
                      },
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'enter city',
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
                      controller:state ,
                      validator: (value) {

                        if(value!.isNotEmpty){
                          return '';
                        }
                        else{
                          return 'enter state';
                        }
                      },
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'enter state',
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
                      controller:country ,
                      validator: (value) {

                        if(value!.isNotEmpty){
                          return '';
                        }
                        else{
                          return 'enter country';
                        }
                      },
                      decoration: InputDecoration(
                        filled: true,
                        hintText: 'enter country',
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
                Visibility(
                  visible: clickregister,
                  child: Container(
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
                          var body = RegisterRequest(
                              isDefaultBranchLocation:true,
                              companyId: "DEF56C4F-808D-4F81-993C-EF67C77A5F91",
                              accountTypeId: 2,
                              isEnableProductUpload: false,
                              contactType: "Customer",
                              company: companyName.text,
                              loginName: userName.text,
                              name: "User972",
                              password: "12345678",
                              emailId: email.text,
                              mobile: mobile.text,
                              identityType: "Pancard",
                              identityNumber: "99KSHSK0991",
                              uploadIdentity: "Pan//Image path991",
                              professionalSkills: "tech991",
                              subscriptionId: 1,
                              stores: storeDate,
                              isPrimaryAddress: false,
                              address: address.text,
                              city: city.text,
                              state: state.text,
                              zipCode: "50003",
                              country: country.text,
                              contactCompany: "JBS991",
                              mid:"MIN#00"
                          );
                          userName.clear();
                          email.clear();
                          mobile.clear();
                          stores.clear();
                          companyName.clear();
                          address.clear();
                          city.clear();
                          state.clear();
                          country.clear();
                          loginModel.validateLogin(body);

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
                      'Register',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    ),
                  ),
                ),
                Visibility(
                  visible:clickupdate ,
                  child: Container(
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
                        UpdateUser(updateIndex ?? 0);



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
                      'Update',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    ),
                  ),
                ),
                ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: userListResponse.length,
                  itemBuilder: (BuildContext context, int index) {
                  return Card(
                    margin: EdgeInsets.only(left: 16,right: 16,top: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16,top: 10,bottom: 10),
                        child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Name: ${userListResponse[index].name}"),
                                SizedBox(height: 4.0,),
                                Text("email: ${userListResponse[index].emailId}"),
                                SizedBox(height: 4.0,),
                                Text("mobile: ${userListResponse[index].mobile}"),
                              ],
                            ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16,top: 0,bottom: 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(

                                  onTap: (){
                                   setState(() {
                                     clickupdate = true;
                                     clickregister = false;
                                     updateIndex = index;
                                     updateData(index);
                                   });
                                  }, child: Icon(Icons.edit,size: 15,)),
                                SizedBox(height: 12.0,),
                                GestureDetector(

                                  onTap: (){
                                    setState(() {
                                      deleteUser(userListResponse[index].companyBasicId ??0);
                                      userListResponse.removeAt(index);
                                    });


                                  }, child: Icon(Icons.delete_forever_sharp,size: 22,),)
                              ],
                            ),
                          )
                          ],
                        ),
                      ),
                    ),
                  );
                },),
                SizedBox(height: 20,),
                ChangeNotifierProvider<LoginVM>(
                  create: (BuildContext context) => loginModel,
                  child: Consumer<LoginVM>(builder: (context, viewModel, _) {
                    if (loginModel.registerResonse.data?.apiname ==
                        LoginEnum.REGISTER) {
                      handleLoginApiResponse(
                          loginModel.registerResonse.status);
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
    print("REGISTER info status  $status");
    switch (status) {
      case Status.LOADING:
        print("REGISTER Info :: LOADING ");
        break;
      case Status.ERROR:
        print("REGISTER Info :: ERROR ");
        break;
      case Status.COMPLETED:
        loginModel.registerResonse.data?.apiname = LoginEnum.NONE;
        print("REGISTER Info :: COMPLETED ");
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) =>LoginPage(
        //
        //
        //       )),
        // );

        

        break;
      default:
    }
    return Container();
  }
  updateData(int index){
    setState(() {
      userName.text = userListResponse[index].name ??'';
      email.text = userListResponse[index].emailId ??'';
      mobile.text = userListResponse[index].mobile ??'';
      stores.text = userListResponse[index].storeName ??'';
      companyName.text = userListResponse[index].company ??'';
      address.text = userListResponse[index].address ??'';
      city.text = userListResponse[index].city ??'';
      state.text = userListResponse[index].state ??'';
      country.text = userListResponse[index].country ??'';
    });
  }
  deleteUser(int id){
    try {
      Future.delayed(Duration.zero, () async {


        var databody = {
          "CompanyBasicId":id.toString()
        };
        var bodyString = json.encode(databody);
        Map<String,String> headers;
        headers = {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${widget.token}'
        };
        final getApiurl =
            '${BaseApiService.base_url}${ApiEndPoints().deleteUser}';
        var response = await http.post(Uri.parse(getApiurl),body: bodyString,headers: headers);
        print("response${response.statusCode}");
        if(response.statusCode == 200){
print(jsonDecode(response.body));
        }
        /*pleacementVM.getPermanencyPlanListDataDetails(
          getApiurl,
        );*/
      });
    } catch (Exception) {
      print(Exception);
    }
  }
  UpdateUser(int index){
    try {
      Future.delayed(Duration.zero, () async {

var data = UpdateDataStores(text: stores.text,);
updaDataStore.add(data);
print("updaDataStore${updaDataStore[0].text}");
        var databody =UpdateUserListRequest (

              isDefaultBranchLocation: true,
              mid: "MIN#00",
              companyId: "DEF56C4F-808D-4F81-993C-EF67C77A5F91",
              companyBasicId: userListResponse[index].companyBasicId,
              accountTypeId: 5,
              accountTypeName: "Supplier",
              uploadImage: "user999 image//path",
              isEnableProductUpload: false,
              contactType: "Suppliar",
              company: "NANO12",
              loginName: "NANO1",
              name: userName.text,
              password: "12345678223",
              emailId: email.text,
              mobile: mobile.text,
              identityType: "Pancard",
              identityNumber: "99KSNANO990",
              uploadIdentity: "Pan//Image path NANO",
              professionalSkills: "Entertainment NANO",
              stores: updaDataStore,
              subscriptionId: 1,
              isPrimaryAddress: false,
              address: address.text,
              city: city.text,
              state: state.text,
              zipCode: "50003",
              country: country.text,
              contactCompany: "NANO"

        );
        var bodyString = json.encode(databody);
        Map<String,String> headers;
        headers = {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${widget.token}'
        };
        final getApiurl =
            '${BaseApiService.base_url}${ApiEndPoints().updateUser}';
        var response = await http.post(Uri.parse(getApiurl),body: bodyString,headers: headers);
        print("response${response.body}");
        if(response.statusCode == 200){
          getUserListDetails();
          print(jsonDecode(response.body));
          setState(() {
            userName.clear();
            email.clear();
            mobile.clear();
            stores.clear();
            companyName.clear();
            address.clear();
            city.clear();
            state.clear();
            country.clear();
            clickupdate = false;
            clickregister = true;
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
}
