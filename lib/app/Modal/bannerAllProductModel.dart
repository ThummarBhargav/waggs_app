class bannerModels {
  int? responseCode;
  List<BannerData>? data;
  String? message;

  bannerModels({this.responseCode, this.data, this.message});

  bannerModels.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    if (json['data'] != null) {
      data = <BannerData>[];
      json['data'].forEach((v) {
        data!.add(new BannerData.fromJson(v));
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

class BannerData {
  String? sId;
  int? order;
  String? image;
  String? mobileImage;
  String? url;
  String? createdAt;
  String? updatedAt;
  int? iV;

  BannerData(
      {this.sId,
        this.order,
        this.image,
        this.mobileImage,
        this.url,
        this.createdAt,
        this.updatedAt,
        this.iV});

  BannerData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    order = json['order'];
    image = json['image'];
    mobileImage = json['mobileImage'];
    url = json['url'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['order'] = this.order;
    data['image'] = this.image;
    data['mobileImage'] = this.mobileImage;
    data['url'] = this.url;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
