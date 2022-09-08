
class PetModel {
  int? responseCode;
  Data1? data;
  String? message;

  PetModel({this.responseCode, this.data, this.message});

  PetModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    data = json['data'] != null ? new Data1.fromJson(json['data']) : null;
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

class Data1{
  int? appointmentLimit;
  String? sId;
  String? user;
  String? planId;
  String? expiryDate;
  String? pet;
  String? transaction;
  int? amount;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Data1(
      {this.appointmentLimit,
        this.sId,
        this.user,
        this.planId,
        this.expiryDate,
        this.pet,
        this.transaction,
        this.amount,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Data1.fromJson(Map<String, dynamic> json) {
    appointmentLimit = json['appointmentLimit'];
    sId = json['_id'];
    user = json['user'];
    planId = json['planId'];
    expiryDate = json['expiryDate'];
    pet = json['pet'];
    transaction = json['transaction'];
    amount = json['amount'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appointmentLimit'] = this.appointmentLimit;
    data['_id'] = this.sId;
    data['user'] = this.user;
    data['planId'] = this.planId;
    data['expiryDate'] = this.expiryDate;
    data['pet'] = this.pet;
    data['transaction'] = this.transaction;
    data['amount'] = this.amount;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}



