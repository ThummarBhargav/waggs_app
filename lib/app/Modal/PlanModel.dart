
class PlanModel {
  int? responseCode;
  List<PlanData>? data;
  String? message;

  PlanModel({this.responseCode, this.data, this.message});

  PlanModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    if (json['data'] != null) {
      data = <PlanData>[];
      json['data'].forEach((v) {
        data!.add(new PlanData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseCode'] = this.responseCode;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }

}
class PlanData{
  String? id;
  String? name;
  int? validity;
  int? amount;
  int? appointmentLimit;

  PlanData(
      {this.id,
        this.name,
        this.validity,
        this.amount,
        this.appointmentLimit});

  PlanData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    validity = json['validity'];
    amount = json['amount'];
    appointmentLimit = json['appointmentLimit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['validity'] = this.validity;
    data['amount'] = this.amount;
    data['appointmentLimit'] = this.appointmentLimit;
    return data;
  }

}