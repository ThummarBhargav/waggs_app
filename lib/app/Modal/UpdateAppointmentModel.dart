class UpdateAppointmentModel {
  int? responseCode;
  Data? data;
  String? message;

  UpdateAppointmentModel({this.responseCode, this.data, this.message});

  UpdateAppointmentModel.fromJson(Map<String, dynamic> json) {
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
  String? paymentStatus;
  bool? isVetRated;
  String? sId;
  String? user;
  String? vet;
  String? pet;
  String? note;
  String? date;
  String? status;
  String? subscription;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? reason;

  Data(
      {this.paymentStatus,
      this.isVetRated,
      this.sId,
      this.user,
      this.vet,
      this.pet,
      this.note,
      this.date,
      this.status,
      this.subscription,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.reason});

  Data.fromJson(Map<String, dynamic> json) {
    paymentStatus = json['paymentStatus'];
    isVetRated = json['isVetRated'];
    sId = json['_id'];
    user = json['user'];
    vet = json['vet'];
    pet = json['pet'];
    note = json['note'];
    date = json['date'];
    status = json['status'];
    subscription = json['subscription'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['paymentStatus'] = this.paymentStatus;
    data['isVetRated'] = this.isVetRated;
    data['_id'] = this.sId;
    data['user'] = this.user;
    data['vet'] = this.vet;
    data['pet'] = this.pet;
    data['note'] = this.note;
    data['date'] = this.date;
    data['status'] = this.status;
    data['subscription'] = this.subscription;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['reason'] = this.reason;
    return data;
  }
}
