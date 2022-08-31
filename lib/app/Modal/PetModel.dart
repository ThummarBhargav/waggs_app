
class PetModel {
  int? responseCode;
  List<PetData>? data;
  String? message;

  PetModel({this.responseCode, this.data, this.message});

  PetModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    if (json['data'] != null) {
      data = <PetData>[];
      json['data'].forEach((v) {
        data!.add(new PetData.fromJson(v));
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
class PetData{
  String? id;
  String? user;
  int? name;
  String? gender;
  int? uniqueNo;
  String? createdAt;
  String? updatedAt;
   int?      iv;
  List<Subscriptions>? subscription;
   String? age;
   String? breed;
  String? image;

  PetData(
      {this.id,
        this.user,
        this.name,
        this.gender,
        this.uniqueNo,
        this.createdAt,
        this.updatedAt,
        this.iv,
        this.subscription,
        this.age,
        this.breed,
      this.image});

  PetData.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    user = json['user'];
    name = json['name'];
    gender = json['gender'];
    uniqueNo = json['uniqueNo'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iv = json['__v'];
    if (json['subscription'] != null) {
      subscription = <Subscriptions>[];
      json['subscription'].forEach((v) {
        subscription!.add(new Subscriptions.fromJson(v));
      });
    }
    age = json['age'];
    breed = json['breed'];
    image = json['image'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['user'] = this.user;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['uniqueNo'] = this.uniqueNo;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iv;
    data['updatedAt'] = this.updatedAt;
    if (this.subscription != null) {
      data['fields'] = this.subscription!.map((v) => v.toJson()).toList();
    }
    data['age'] = this.age;
    data['breed'] = this.breed;
    data['image'] = this.image;
    return data;
  }

}


class Subscriptions {
  String? SubId;
  int? appointmentLimit;
  String? user;
  String? planId;
  String? expiryDate;
  String?  pet;
  String? transaction;
  int? amount;
  String? createdAt;
  String? updatedAt;
  String? iv;

  Subscriptions({this.SubId, this.appointmentLimit, this.user, this.planId,
    this.expiryDate,this.pet,this.transaction,this.amount,this.createdAt,this.updatedAt,this.iv});

  Subscriptions.fromJson(Map<String, dynamic> json) {
    SubId = json['_id'];
    appointmentLimit = json['appointmentLimit'];
    user = json['user'];
    planId = json['planId'];
    expiryDate = json['expiryDate'];
    pet = json['pet'];
    transaction = json['transaction'];
    amount = json['amount'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iv = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.SubId;
    data['appointmentLimit'] = this.appointmentLimit;
    data['user'] = this.user;
    data['planId'] = this.planId;
    data['expiryDate'] = this.expiryDate;
    data['pet'] = this.pet;
    data['transaction'] = this.transaction;
    data['amount'] = this.amount;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iv;
    return data;
  }
}