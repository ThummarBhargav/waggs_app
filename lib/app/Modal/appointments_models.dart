class Appointments1 {
  int? responseCode;
  Data? data;
  String? message;

  Appointments1({this.responseCode, this.data, this.message});

  Appointments1.fromJson(Map<String, dynamic> json) {
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
  List<Appointments>? appointments;
  int? totalCount;

  Data({this.appointments, this.totalCount});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['appointments'] != null) {
      appointments = <Appointments>[];
      json['appointments'].forEach((v) {
        appointments!.add(new Appointments.fromJson(v));
      });
    }
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.appointments != null) {
      data['appointments'] = this.appointments!.map((v) => v.toJson()).toList();
    }
    data['totalCount'] = this.totalCount;
    return data;
  }
}

class Appointments {
  String? paymentStatus;
  bool? isVetRated;
  String? sId;
  User? user;
  Vet? vet;
  Pet? pet;
  String? note;
  String? date;
  String? status;
  String? subscription;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? reason;

  Appointments(
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

  Appointments.fromJson(Map<String, dynamic> json) {
    paymentStatus = json['paymentStatus'];
    isVetRated = json['isVetRated'];
    sId = json['_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    vet = json['vet'] != null ? new Vet.fromJson(json['vet']) : null;
    pet = json['pet'] != null ? new Pet.fromJson(json['pet']) : null;
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
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.vet != null) {
      data['vet'] = this.vet!.toJson();
    }
    if (this.pet != null) {
      data['pet'] = this.pet!.toJson();
    }
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

class User {
  bool? isEmailVerified;
  String? sId;
  String? name;
  String? email;
  String? mobile;
  String? countryCode;
  String? address;
  double? latitude;
  double? longitude;

  User(
      {this.isEmailVerified,
      this.sId,
      this.name,
      this.email,
      this.mobile,
      this.countryCode,
      this.address,
      this.latitude,
      this.longitude});

  User.fromJson(Map<String, dynamic> json) {
    isEmailVerified = json['isEmailVerified'];
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    countryCode = json['countryCode'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isEmailVerified'] = this.isEmailVerified;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['countryCode'] = this.countryCode;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

class Vet {
  bool? isEmailVerified;
  bool? isApproved;
  double? rating;
  int? ratedBy;
  String? sId;
  String? name;
  String? email;
  String? mobile;
  String? countryCode;
  String? address;
  double? latitude;
  double? longitude;
  String? city;
  int? consultationLimit;
  String? country;
  String? degree;
  String? description;
  String? experience;
  String? fbLink;
  String? instaLink;
  String? linkedinLink;
  String? logoUrl;
  String? pincode;
  String? state;

  Vet(
      {this.isEmailVerified,
      this.isApproved,
      this.rating,
      this.ratedBy,
      this.sId,
      this.name,
      this.email,
      this.mobile,
      this.countryCode,
      this.address,
      this.latitude,
      this.longitude,
      this.city,
      this.consultationLimit,
      this.country,
      this.degree,
      this.description,
      this.experience,
      this.fbLink,
      this.instaLink,
      this.linkedinLink,
      this.logoUrl,
      this.pincode,
      this.state});

  Vet.fromJson(Map<String, dynamic> json) {
    isEmailVerified = json['isEmailVerified'];
    isApproved = json['isApproved'];
    rating = (json['rating'].runtimeType == int)
        ? double.parse(json['rating'].toString())
        : json['rating'];
    ratedBy = json['ratedBy'];
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    countryCode = (json['countryCode'].runtimeType == int)
        ? double.parse(json['countryCode'].toString())
        : json['countryCode'];
    address = json['address'];
    latitude = (json['latitude'].runtimeType == int)
        ? double.parse(json['latitude'].toString())
        : json['latitude'];
    longitude = (json['longitude'].runtimeType == int)
        ? double.parse(json['longitude'].toString())
        : json['longitude'];
    city = json['city'];
    consultationLimit = json['consultationLimit'];
    country = json['country'];
    degree = json['degree'];
    description = json['description'];
    experience = json['experience'];
    fbLink = json['fbLink'];
    instaLink = json['instaLink'];
    linkedinLink = json['linkedinLink'];
    logoUrl = json['logoUrl'];
    pincode = json['pincode'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isEmailVerified'] = this.isEmailVerified;
    data['isApproved'] = this.isApproved;
    data['rating'] = this.rating;
    data['ratedBy'] = this.ratedBy;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['countryCode'] = this.countryCode;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['city'] = this.city;
    data['consultationLimit'] = this.consultationLimit;
    data['country'] = this.country;
    data['degree'] = this.degree;
    data['description'] = this.description;
    data['experience'] = this.experience;
    data['fbLink'] = this.fbLink;
    data['instaLink'] = this.instaLink;
    data['linkedinLink'] = this.linkedinLink;
    data['logoUrl'] = this.logoUrl;
    data['pincode'] = this.pincode;
    data['state'] = this.state;
    return data;
  }
}

class Pet {
  String? sId;
  String? user;
  String? name;
  String? gender;
  String? uniqueNo;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? subscription;
  String? age;
  String? breed;
  String? image;

  Pet(
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

  Pet.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    name = json['name'];
    gender = json['gender'];
    uniqueNo = json['uniqueNo'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    subscription = json['subscription'];
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
    data['subscription'] = this.subscription;
    data['age'] = this.age;
    data['breed'] = this.breed;
    data['image'] = this.image;
    return data;
  }
}
