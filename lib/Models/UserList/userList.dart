

import 'package:taskoctohub/Data/response/Status.dart';
class UserListRequest {
  LoginEnum? apiname;
  String? companyId;
  String? mid;

  UserListRequest({this.companyId, this.mid});

  UserListRequest.fromJson(Map<String, dynamic> json) {
    companyId = json['CompanyId'];
    mid = json['mid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CompanyId'] = this.companyId;
    data['mid'] = this.mid;
    return data;
  }
}

class UserListResponse {
  LoginEnum? apiname;
  String? companyId;
  String? mid;
  int? roleId;
  int? loginId;
  int? companyBasicId;
  int? accountTypeId;
  String? accountTypeName;
  String? uploadImage;
  bool? isEnableProductUpload;
  String? contactType;
  String? company;
  String? loginName;
  String? name;
  String? password;
  String? emailId;
  String? mobile;
  String? identityType;
  String? identityNumber;
  String? uploadIdentity;
  String? professionalSkills;
  String? storeName;

  int? subscriptionId;
  bool? isPrimaryAddress;
  String? address;
  String? city;
  String? state;
  String? zipCode;
  String? country;
  String? contactCompany;
  int? result;
  String? insertedDate;
  bool? isDefaultBranchLocation;

  List<WebStores>? webStores;
  List<WebLocations>? webLocations;

  UserListResponse(
      {this.companyId,
        this.mid,
        this.roleId,
        this.loginId,
        this.companyBasicId,
        this.accountTypeId,
        this.accountTypeName,
        this.uploadImage,
        this.isEnableProductUpload,
        this.contactType,
        this.company,
        this.loginName,
        this.name,
        this.password,
        this.emailId,
        this.mobile,
        this.identityType,
        this.identityNumber,
        this.uploadIdentity,
        this.professionalSkills,
        this.storeName,

        this.subscriptionId,
        this.isPrimaryAddress,
        this.address,
        this.city,
        this.state,
        this.zipCode,
        this.country,
        this.contactCompany,
        this.result,
        this.insertedDate,
        this.isDefaultBranchLocation,

        this.webStores,
        this.webLocations});

  UserListResponse.fromJson(Map<String, dynamic> json) {
    companyId = json['companyId'];
    mid = json['mid'];
    roleId = json['roleId'];
    loginId = json['loginId'];
    companyBasicId = json['companyBasicId'];
    accountTypeId = json['accountTypeId'];
    accountTypeName = json['accountTypeName'];
    uploadImage = json['uploadImage'];
    isEnableProductUpload = json['isEnableProductUpload'];
    contactType = json['contactType'];
    company = json['company'];
    loginName = json['loginName'];
    name = json['name'];
    password = json['password'];
    emailId = json['emailId'];
    mobile = json['mobile'];
    identityType = json['identityType'];
    identityNumber = json['identityNumber'];
    uploadIdentity = json['uploadIdentity'];
    professionalSkills = json['professionalSkills'];
    storeName = json['storeName'];

    subscriptionId = json['subscriptionId'];
    isPrimaryAddress = json['isPrimaryAddress'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    zipCode = json['zipCode'];
    country = json['country'];
    contactCompany = json['contactCompany'];
    result = json['result'];
    insertedDate = json['insertedDate'];
    isDefaultBranchLocation = json['isDefaultBranchLocation'];

    if (json['webStores'] != null) {
      webStores = <WebStores>[];
      json['webStores'].forEach((v) {
        webStores!.add(new WebStores.fromJson(v));
      });
    }
    if (json['webLocations'] != null) {
      webLocations = <WebLocations>[];
      json['webLocations'].forEach((v) {
        webLocations!.add(new WebLocations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['companyId'] = this.companyId;
    data['mid'] = this.mid;
    data['roleId'] = this.roleId;
    data['loginId'] = this.loginId;
    data['companyBasicId'] = this.companyBasicId;
    data['accountTypeId'] = this.accountTypeId;
    data['accountTypeName'] = this.accountTypeName;
    data['uploadImage'] = this.uploadImage;
    data['isEnableProductUpload'] = this.isEnableProductUpload;
    data['contactType'] = this.contactType;
    data['company'] = this.company;
    data['loginName'] = this.loginName;
    data['name'] = this.name;
    data['password'] = this.password;
    data['emailId'] = this.emailId;
    data['mobile'] = this.mobile;
    data['identityType'] = this.identityType;
    data['identityNumber'] = this.identityNumber;
    data['uploadIdentity'] = this.uploadIdentity;
    data['professionalSkills'] = this.professionalSkills;
    data['storeName'] = this.storeName;

    data['subscriptionId'] = this.subscriptionId;
    data['isPrimaryAddress'] = this.isPrimaryAddress;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zipCode'] = this.zipCode;
    data['country'] = this.country;
    data['contactCompany'] = this.contactCompany;
    data['result'] = this.result;
    data['insertedDate'] = this.insertedDate;
    data['isDefaultBranchLocation'] = this.isDefaultBranchLocation;
    if (this.webStores != null) {
      data['webStores'] = this.webStores!.map((v) => v.toJson()).toList();
    }
    if (this.webLocations != null) {
      data['webLocations'] = this.webLocations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WebStores {
  int? branchId;
  String? branchName;
  int? cid;
  int? cbId;
  String? insertedDate;

  WebStores(
      {this.branchId, this.branchName, this.cid, this.cbId, this.insertedDate});

  WebStores.fromJson(Map<String, dynamic> json) {
    branchId = json['branchId'];
    branchName = json['branchName'];
    cid = json['cid'];
    cbId = json['cbId'];
    insertedDate = json['insertedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['branchId'] = this.branchId;
    data['branchName'] = this.branchName;
    data['cid'] = this.cid;
    data['cbId'] = this.cbId;
    data['insertedDate'] = this.insertedDate;
    return data;
  }
}

class WebLocations {
  int? locationId;
  String? locationName;
  int? bid;
  int? cid;
  int? cbId;
  String? insertedDate;

  WebLocations(
      {this.locationId,
        this.locationName,
        this.bid,
        this.cid,
        this.cbId,
        this.insertedDate});

  WebLocations.fromJson(Map<String, dynamic> json) {
    locationId = json['locationId'];
    locationName = json['locationName'];
    bid = json['bid'];
    cid = json['cid'];
    cbId = json['cbId'];
    insertedDate = json['insertedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['locationId'] = this.locationId;
    data['locationName'] = this.locationName;
    data['bid'] = this.bid;
    data['cid'] = this.cid;
    data['cbId'] = this.cbId;
    data['insertedDate'] = this.insertedDate;
    return data;
  }
}
