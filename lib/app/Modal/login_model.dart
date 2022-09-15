class LoginModel {
  int? responseCode;
  Data? data;
  String? message;

  LoginModel({this.responseCode, this.data, this.message});

  LoginModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  User1? user;
  String? token;

  Data({this.user, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User1.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class User1 {
  String? sId;
  String? name;
  String? email;
  String? mobile;
  String? countryCode;
  bool? isEmailVerified;
  String? address;
  double? latitude;
  double? longitude;

  User1(
      {this.sId,
      this.name,
      this.email,
      this.mobile,
      this.countryCode,
      this.isEmailVerified,
      this.address,
      this.latitude,
      this.longitude});

  User1.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    countryCode = json['countryCode'];
    isEmailVerified = json['isEmailVerified'];
    address = json['address'];
    latitude = (json['latitude'].runtimeType == int)
        ? double.parse(json['latitude'].toString())
        : json['latitude'];
    longitude = (json['longitude'].runtimeType == int)
        ? double.parse(json['longitude'].toString())
        : json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['countryCode'] = this.countryCode;
    data['isEmailVerified'] = this.isEmailVerified;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}
