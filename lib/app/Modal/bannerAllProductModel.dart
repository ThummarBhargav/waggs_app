class models {
  String? sId;
  int? order;
  String? image;
  String? mobileImage;
  String? url;
  String? createdAt;
  String? updatedAt;
  int? iV;

  models(
      {this.sId,
        this.order,
        this.image,
        this.mobileImage,
        this.url,
        this.createdAt,
        this.updatedAt,
        this.iV});

  models.fromJson(Map<String, dynamic> json) {
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
