import 'package:waggs_app/app/Modal/GetPetModel.dart';

class AllPetModel {
  int? responseCode;
  List<AllData>? data;
  String? message;

  AllPetModel({this.responseCode, this.data, this.message});

  AllPetModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    if (json['data'] != null) {
      data = <AllData>[];
      json['data'].forEach((v) {
        data!.add(new AllData.fromJson(v));
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

class AllData {
  List<Pets>? pets;
  int? totalCount;

  AllData({this.pets, this.totalCount});

  AllData.fromJson(Map<String, dynamic> json) {
    if (json['pets'] != null) {
      pets = <Pets>[];
      json['pets'].forEach((v) {
        pets!.add(new Pets.fromJson(v));
      });
    }
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pets != null) {
      data['pets'] = this.pets!.map((v) => v.toJson()).toList();
    }
    data['totalCount'] = this.totalCount;
    return data;
  }
}

class Pets {
  String? sId;
  String? user;
  String? name;
  String? gender;
  String? uniqueNo;
  String? createdAt;
  String? updatedAt;
  int? iV;
  Subscription? subscription;
  String? age;
  String? breed;

  Pets(
      {this.sId,
        this.user,
        this.name,
        this.gender,
        this.uniqueNo,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.subscription,
        this.age,
        this.breed});

  Pets.fromJson(Map<String, dynamic> json) {
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
    age = json['age'];
    breed = json['breed'];
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
    data['age'] = this.age;
    data['breed'] = this.breed;
    return data;
  }
}

class Subscription {
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

  Subscription(
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

  Subscription.fromJson(Map<String, dynamic> json) {
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