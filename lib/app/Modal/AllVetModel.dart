
class AllvetModel {
  int? responseCode;
  String? message;
  Data? data;

  AllvetModel({this.responseCode, this.message, this.data});

  AllvetModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  int? totalCount;
  List<Vets>? vets;

  Data({this.totalCount, this.vets});

  Data.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    if (json['vets'] != null) {
      vets = <Vets>[];
      json['vets'].forEach((v) {
        vets!.add(new Vets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCount'] = this.totalCount;
    if (this.vets != null) {
      data['vets'] = this.vets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Vets {
  String? sId;
  String? name;
  String? email;
  String? mobile;
  String? countryCode;
  bool? isEmailVerified;
  bool? isApproved;
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
  String? logoUrl;

  Vets(
      {this.sId,
        this.name,
        this.email,
        this.mobile,
        this.countryCode,
        this.isEmailVerified,
        this.isApproved,
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
        this.logoUrl});

  Vets.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    countryCode = json['countryCode'];
    isEmailVerified = json['isEmailVerified'];
    isApproved = json['isApproved'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    pincode = json['pincode'];
    consultationLimit = json['consultationLimit'];
    degree = json['degree'];
    experience = json['experience'];
    description = json['description'];
    latitude = (json['latitude'].runtimeType== int)?double.parse(json['latitude'].toString()):json['latitude'];
    longitude = (json['longitude'].runtimeType== int)?double.parse(json['longitude'].toString()):json['longitude'];
    instaLink = json['instaLink'];
    fbLink = json['fbLink'];
    linkedinLink = json['linkedinLink'];
    rating = (json['rating'].runtimeType == int)
        ? double.parse(json['rating'].toString())
        : json['rating'];
    ratedBy = json['ratedBy'];
    logoUrl = json['logoUrl'];
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
    data['logoUrl'] = this.logoUrl;
    return data;
  }
}