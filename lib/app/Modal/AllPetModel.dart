class PetListModel {
  int? responseCode;
  Data? data;
  String? message;

  PetListModel({this.responseCode, this.data, this.message});

  PetListModel.fromJson(Map<String, dynamic> json) {
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
  List<Pets>? pets;
  int? totalCount;

  Data({this.pets, this.totalCount});

  Data.fromJson(Map<String, dynamic> json) {
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
  String? image;

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
      this.breed,
      this.image});

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
    image = json['image'];
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
    data['image'] = this.image;
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
