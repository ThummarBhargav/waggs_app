class SignUpResponseModel {
  int? responseCode;
  Data? data;
  String? message;

  SignUpResponseModel({this.responseCode, this.data, this.message});

  SignUpResponseModel.fromJson(Map<String, dynamic> json) {
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
  String? sId;
  String? name;
  String? email;
  String? mobile;
  String? countryCode;
  bool? isEmailVerified;

  Data(
      {this.sId,
        this.name,
        this.email,
        this.mobile,
        this.countryCode,
        this.isEmailVerified});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    countryCode = json['countryCode'];
    isEmailVerified = json['isEmailVerified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['countryCode'] = this.countryCode;
    data['isEmailVerified'] = this.isEmailVerified;
    return data;
  }
}