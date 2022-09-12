class VetDetailModel {
  int? responseCode;
  String? message;
  VetData? data;

  VetDetailModel({this.responseCode, this.message, this.data});

  VetDetailModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    message = json['message'];
    data = json['data'] != null ? new VetData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseCode'] = this.responseCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class VetData {
  String? sId;
  String? name;
  String? email;
  String? mobile;
  String? countryCode;
  bool? isEmailVerified;
  bool? isApproved;
  String? logoUrl;
  String? address;
  String? city;
  String? state;
  String? country;
  String? pincode;
  int? consultationLimit;
  String? degree;
  String? experience;
  String? description;
  double? latitude;
  double? longitude;
  String? instaLink;
  String? fbLink;
  String? linkedinLink;
  double? rating;
  int? ratedBy;
  List<Reviews>? reviews;
  int? totalReviewsCount;

  VetData(
      {this.sId,
        this.name,
        this.email,
        this.mobile,
        this.countryCode,
        this.isEmailVerified,
        this.isApproved,
        this.logoUrl,
        this.address,
        this.city,
        this.state,
        this.country,
        this.pincode,
        this.consultationLimit,
        this.degree,
        this.experience,
        this.description,
        this.latitude,
        this.longitude,
        this.instaLink,
        this.fbLink,
        this.linkedinLink,
        this.rating,
        this.ratedBy,
        this.reviews,
        this.totalReviewsCount});

  VetData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    countryCode = json['countryCode'];
    isEmailVerified = json['isEmailVerified'];
    isApproved = json['isApproved'];
    logoUrl = json['logoUrl'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    pincode = json['pincode'];
    consultationLimit = json['consultationLimit'];
    degree = json['degree'];
    experience = json['experience'];
    description = json['description'];
    latitude = (json['latitude'].runtimeType==int)?double.parse(json['latitude'].toString()):json['latitude'];
    longitude = (json['longitude'].runtimeType==int)?double.parse(json['longitude'].toString()):json['longitude'];
    instaLink = json['instaLink'];
    fbLink = json['fbLink'];
    linkedinLink = json['linkedinLink'];
    rating = (json['rating'].runtimeType==int)?double.parse(json['rating'].toString()):json['rating'];
    ratedBy = json['ratedBy'];
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
    totalReviewsCount = json['totalReviewsCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['countryCode'] = this.countryCode;
    data['isEmailVerified'] = this.isEmailVerified;
    data['isApproved'] = this.isApproved;
    data['logoUrl'] = this.logoUrl;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['pincode'] = this.pincode;
    data['consultationLimit'] = this.consultationLimit;
    data['degree'] = this.degree;
    data['experience'] = this.experience;
    data['description'] = this.description;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['instaLink'] = this.instaLink;
    data['fbLink'] = this.fbLink;
    data['linkedinLink'] = this.linkedinLink;
    data['rating'] = this.rating;
    data['ratedBy'] = this.ratedBy;
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    data['totalReviewsCount'] = this.totalReviewsCount;
    return data;
  }
}

class Reviews {
  String? sId;
  User? user;
  String? vet;
  String? updatedAt;
  int? rating;
  String? review;

  Reviews(
      {this.sId,
        this.user,
        this.vet,
        this.updatedAt,
        this.rating,
        this.review});

  Reviews.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    vet = json['vet'];
    updatedAt = json['updatedAt'];
    rating = json['rating'];
    review = json['review'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['vet'] = this.vet;
    data['updatedAt'] = this.updatedAt;
    data['rating'] = this.rating;
    data['review'] = this.review;
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