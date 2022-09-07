class GetPetModel {
  int? responseCode;
  PData? data;
  String? message;

  GetPetModel({this.responseCode, this.data, this.message});

  GetPetModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    if (json['data'] != null) {
      data = json['data'] != null ? new PData.fromJson(json['data']) : null;
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
}
class PData {
  String? sId;
  String? user;
  String? name;
  String? gender;
  String? uniqueNo;
  String? createdAt;
  String? updatedAt;
  int? iV;
  Subscription? subscription;
  int? remainingAppointments;

  PData(
      {this.sId,
        this.user,
        this.name,
        this.gender,
        this.uniqueNo,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.subscription,
        this.remainingAppointments});

  PData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    name = json['name'];
    gender = json['gender'];
    uniqueNo = json['uniqueNo'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    subscription = json['subscription'] != null
        ? new Subscription.fromJson(json['subscription'])
        : null;
    remainingAppointments = json['remainingAppointments'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user'] = this.user;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['uniqueNo'] = this.uniqueNo;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    if (this.subscription != null) {
      data['subscription'] = this.subscription!.toJson();
    }
    data['remainingAppointments'] = this.remainingAppointments;
    return data;
  }
}

class Subscription {
  String? sId;
  int? appointmentLimit;
  String? user;
  String? planId;
  String? expiryDate;
  String? pet;
  String? transaction;
  int? amount;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Subscription(
      {this.sId,
        this.appointmentLimit,
        this.user,
        this.planId,
        this.expiryDate,
        this.pet,
        this.transaction,
        this.amount,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Subscription.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    appointmentLimit = json['appointmentLimit'];
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
    data['_id'] = this.sId;
    data['appointmentLimit'] = this.appointmentLimit;
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






//class GetPetModel {
//   int? responseCode;
//   List<PData>? data;
//   String? message;
//
//   GetPetModel({this.responseCode, this.data, this.message});
//
//   GetPetModel.fromJson(Map<String, dynamic> json) {
//     responseCode = json['responseCode'];
//     if (json['data'] != null) {
//       data = <PData>[];
//       json['data'].forEach((v) {
//         data!.add(new PData.fromJson(v));
//       });
//     }
//     message = json['message'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['responseCode'] = this.responseCode;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     data['message'] = this.message;
//     return data;
//   }
// }
//
// class PData {
//   String? sId;
//   String? user;
//   String? name;
//   String? gender;
//   String? uniqueNo;
//   String? createdAt;
//   String? updatedAt;
//   int? iV;
//   List<Subscription>? subscription;
//   int? remainingAppointments;
//
//   PData(
//       {this.sId,
//         this.user,
//         this.name,
//         this.gender,
//         this.uniqueNo,
//         this.createdAt,
//         this.updatedAt,
//         this.iV,
//         this.subscription,
//         this.remainingAppointments});
//
//   PData.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     user = json['user'];
//     name = json['name'];
//     gender = json['gender'];
//     uniqueNo = json['uniqueNo'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     iV = json['__v'];
//     if (json['subscription'] != null) {
//       subscription = <Subscription>[];
//       json['details'].forEach((v) {
//         subscription!.add(new Subscription.fromJson(v));
//       });
//     }
//     remainingAppointments = json['remainingAppointments'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['user'] = this.user;
//     data['name'] = this.name;
//     data['gender'] = this.gender;
//     data['uniqueNo'] = this.uniqueNo;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     data['__v'] = this.iV;
//     if (this.subscription != null) {
//       data['subscription'] = this.subscription!.map((v) => v.toJson()).toList();
//     }
//     data['remainingAppointments'] = this.remainingAppointments;
//     return data;
//   }
// }