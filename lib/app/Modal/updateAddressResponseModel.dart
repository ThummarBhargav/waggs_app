class UpdateAddressModel {
  int? responseCode;
  UpdateAddress? data;
  String? message;

  UpdateAddressModel({this.responseCode, this.data, this.message});

  UpdateAddressModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    data =
        json['data'] != null ? new UpdateAddress.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseCode'] = this.responseCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class UpdateAddress {
  bool? isEmailVerified;
  bool? isDeleted;
  bool? isBlocked;
  String? sId;
  String? name;
  String? email;
  String? mobile;
  String? countryCode;
  String? emailVerificationToken;
  String? createdAt;
  String? updatedAt;
  String? address;
  double? latitude;
  double? longitude;
  String? newPasswordToken;
  String? newPasswordTokenValidity;

  UpdateAddress(
      {this.isEmailVerified,
      this.isDeleted,
      this.isBlocked,
      this.sId,
      this.name,
      this.email,
      this.mobile,
      this.countryCode,
      this.emailVerificationToken,
      this.createdAt,
      this.updatedAt,
      this.address,
      this.latitude,
      this.longitude,
      this.newPasswordToken,
      this.newPasswordTokenValidity});

  UpdateAddress.fromJson(Map<String, dynamic> json) {
    isEmailVerified = json['isEmailVerified'];
    isDeleted = json['isDeleted'];
    isBlocked = json['isBlocked'];
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    countryCode = json['countryCode'];
    emailVerificationToken = json['emailVerificationToken'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    newPasswordToken = json['newPasswordToken'];
    newPasswordTokenValidity = json['newPasswordTokenValidity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isEmailVerified'] = this.isEmailVerified;
    data['isDeleted'] = this.isDeleted;
    data['isBlocked'] = this.isBlocked;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['countryCode'] = this.countryCode;
    data['emailVerificationToken'] = this.emailVerificationToken;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['newPasswordToken'] = this.newPasswordToken;
    data['newPasswordTokenValidity'] = this.newPasswordTokenValidity;
    return data;
  }
}
