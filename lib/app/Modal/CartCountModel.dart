class Count1 {
  int? responseCode;
  int? data;
  String? message;

  Count1({this.responseCode, this.data, this.message});

  Count1.fromJson(Map<String, dynamic> json) {
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
