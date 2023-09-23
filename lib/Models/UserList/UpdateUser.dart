class UpdateUserListRequest {
  bool? isDefaultBranchLocation;
  String? mid;
  String? companyId;
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
  List<UpdateDataStores>? stores;
  int? subscriptionId;
  bool? isPrimaryAddress;
  String? address;
  String? city;
  String? state;
  String? zipCode;
  String? country;
  String? contactCompany;

  UpdateUserListRequest(
      {this.isDefaultBranchLocation,
        this.mid,
        this.companyId,
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
        this.stores,
        this.subscriptionId,
        this.isPrimaryAddress,
        this.address,
        this.city,
        this.state,
        this.zipCode,
        this.country,
        this.contactCompany});

  UpdateUserListRequest.fromJson(Map<String, dynamic> json) {
    isDefaultBranchLocation = json['isDefaultBranchLocation'];
    mid = json['mid'];
    companyId = json['CompanyId'];
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
    if (json['stores'] != null) {
      stores = <UpdateDataStores>[];
      json['stores'].forEach((v) {
        stores!.add(new UpdateDataStores.fromJson(v));
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isDefaultBranchLocation'] = this.isDefaultBranchLocation;
    data['mid'] = this.mid;
    data['CompanyId'] = this.companyId;
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
    return data;
  }
}

class UpdateDataStores {
  String? text;

  UpdateDataStores({this.text});

  UpdateDataStores.fromJson(Map<String, dynamic> json) {
    text = json['Text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Text'] = this.text;
    return data;
  }
}
