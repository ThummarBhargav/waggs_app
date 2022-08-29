class FpassModel {
  int? responseCode;
  Data? data;
  String? message;

  FpassModel({this.responseCode, this.data, this.message});

  FpassModel.fromJson(Map<String, dynamic> json) {
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
  String? newPasswordToken;

  Data({this.newPasswordToken});

  Data.fromJson(Map<String, dynamic> json) {
    newPasswordToken = json['newPasswordToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['newPasswordToken'] = this.newPasswordToken;
    return data;
  }
}
