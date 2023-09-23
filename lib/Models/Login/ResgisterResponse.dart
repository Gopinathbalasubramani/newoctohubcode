import 'package:taskoctohub/Data/response/Status.dart';

class RegisterRequest {
  LoginEnum? apiname;

  bool? isDefaultBranchLocation;
  String? companyId;
  int? accountTypeId;
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
  int? subscriptionId;
  List<Stores>? stores;
  bool? isPrimaryAddress;
  String? address;
  String? city;
  String? state;
  String? zipCode;
  String? country;
  String? contactCompany;
  String? mid;

  RegisterRequest(
      {this.isDefaultBranchLocation,
        this.companyId,
        this.accountTypeId,
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
        this.subscriptionId,
        this.stores,
        this.isPrimaryAddress,
        this.address,
        this.city,
        this.state,
        this.zipCode,
        this.country,
        this.contactCompany,
        this.mid});

  RegisterRequest.fromJson(Map<String, dynamic> json) {
    isDefaultBranchLocation = json['isDefaultBranchLocation'];
    companyId = json['companyId'];
    accountTypeId = json['accountTypeId'];
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
    subscriptionId = json['subscriptionId'];
    if (json['stores'] != null) {
      stores = <Stores>[];
      json['stores'].forEach((v) {
        stores!.add(new Stores.fromJson(v));
      });
    }
    isPrimaryAddress = json['isPrimaryAddress'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    zipCode = json['zipCode'];
    country = json['country'];
    contactCompany = json['contactCompany'];
    mid = json['mid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isDefaultBranchLocation'] = this.isDefaultBranchLocation;
    data['companyId'] = this.companyId;
    data['accountTypeId'] = this.accountTypeId;
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
    data['subscriptionId'] = this.subscriptionId;
    if (this.stores != null) {
      data['stores'] = this.stores!.map((v) => v.toJson()).toList();
    }
    data['isPrimaryAddress'] = this.isPrimaryAddress;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zipCode'] = this.zipCode;
    data['country'] = this.country;
    data['contactCompany'] = this.contactCompany;
    data['mid'] = this.mid;
    return data;
  }
}

class Stores {
  String? text;

  Stores({this.text});

  Stores.fromJson(Map<String, dynamic> json) {
    text = json['Text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Text'] = this.text;
    return data;
  }
}
class RegisterResponse {
  LoginEnum? apiname;
  String? companyId;
  String? mid;
  String? roleId;
  String? loginId;
  String? companyBasicId;
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
  List<StoresData>? stores;
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


  RegisterResponse(
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
        this.stores,
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
       });

  RegisterResponse.fromJson(Map<String, dynamic> json) {
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
    if (json['stores'] != null) {
      stores = <StoresData>[];
      json['stores'].forEach((v) {
        stores!.add(new StoresData.fromJson(v));
      });
    }
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
    if (this.stores != null) {
      data['stores'] = this.stores!.map((v) => v.toJson()).toList();
    }
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
    return data;
  }
}

class StoresData {
  String? text;

  StoresData({this.text});

  StoresData.fromJson(Map<String, dynamic> json) {
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    return data;
  }
}
