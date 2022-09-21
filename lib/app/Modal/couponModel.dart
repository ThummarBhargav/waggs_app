class couponModal {
  int? responseCode;
  double? data;
  String? message;

  couponModal({this.responseCode, this.data, this.message});

  couponModal.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    data = json['data'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseCode'] = this.responseCode;
    data['data'] = this.data;
    data['message'] = this.message;
    return data;
  }
}
