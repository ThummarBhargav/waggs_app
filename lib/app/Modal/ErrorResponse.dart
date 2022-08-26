class ErrorResponse {
  String? message;
  int? responseCode;

  ErrorResponse({this.message, this.responseCode});

  ErrorResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    responseCode = json['responseCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['responseCode'] = this.responseCode;
    return data;
  }
}
