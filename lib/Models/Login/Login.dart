import '../../Data/response/Status.dart';

class LoginRequest {
  String? email;
  String? password;
  LoginEnum? apiname;
  LoginRequest({this.email, this.password});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    email = json['Email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
class LoginResponse {
  LoginEnum? apiname;
  int? id;
  String? fullName;
  String? userName;
  String? email;
  String? phoneNumber;
  String? userPassword;
  String? userKey;
  int? userRole;
  String? accountTypeId;
  String? cbid;

  String? insertedDate;
  String? modifiedDate;
  String? password;
  String? cid;
  int? defaultCompany;
  String? mid;
  String? midnames;
  List<Companies>? companies;
  String? authToken;
  String? expiresIn;

  LoginResponse(
      {this.id,
        this.fullName,
        this.userName,
        this.email,
        this.phoneNumber,
        this.userPassword,
        this.userKey,
        this.userRole,
        this.accountTypeId,
        this.cbid,

        this.insertedDate,
        this.modifiedDate,
        this.password,
        this.cid,
        this.defaultCompany,
        this.mid,
        this.midnames,
        this.companies,
        this.authToken,
        this.expiresIn});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    userName = json['userName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    userPassword = json['userPassword'];
    userKey = json['userKey'];
    userRole = json['userRole'];
    accountTypeId = json['accountTypeId'];
    cbid = json['cbid'];

    insertedDate = json['insertedDate'];
    modifiedDate = json['modifiedDate'];
    password = json['password'];
    cid = json['cid'];
    defaultCompany = json['defaultCompany'];
    mid = json['mid'];
    midnames = json['midnames'];
    if (json['companies'] != null) {
      companies = <Companies>[];
      json['companies'].forEach((v) {
        companies!.add(new Companies.fromJson(v));
      });
    }
    authToken = json['authToken'];
    expiresIn = json['expiresIn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['userPassword'] = this.userPassword;
    data['userKey'] = this.userKey;
    data['userRole'] = this.userRole;
    data['accountTypeId'] = this.accountTypeId;
    data['cbid'] = this.cbid;

    data['insertedDate'] = this.insertedDate;
    data['modifiedDate'] = this.modifiedDate;
    data['password'] = this.password;
    data['cid'] = this.cid;
    data['defaultCompany'] = this.defaultCompany;
    data['mid'] = this.mid;
    data['midnames'] = this.midnames;
    if (this.companies != null) {
      data['companies'] = this.companies!.map((v) => v.toJson()).toList();
    }
    data['authToken'] = this.authToken;
    data['expiresIn'] = this.expiresIn;
    return data;
  }
}

class Companies {
  int? cid;
  String? mid;
  String? accountType;
  String? companyName;
  String? companyDescription;

  String? insertedDate;
  String? imagename;

  Companies(
      {this.cid,
        this.mid,
        this.accountType,
        this.companyName,
        this.companyDescription,
        this.insertedDate,
        this.imagename});

  Companies.fromJson(Map<String, dynamic> json) {
    cid = json['cid'];
    mid = json['mid'];
    accountType = json['accountType'];
    companyName = json['companyName'];
    companyDescription = json['companyDescription'];

    insertedDate = json['insertedDate'];
    imagename = json['imagename'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cid'] = this.cid;
    data['mid'] = this.mid;
    data['accountType'] = this.accountType;
    data['companyName'] = this.companyName;
    data['companyDescription'] = this.companyDescription;

    data['insertedDate'] = this.insertedDate;
    data['imagename'] = this.imagename;
    return data;
  }
}
