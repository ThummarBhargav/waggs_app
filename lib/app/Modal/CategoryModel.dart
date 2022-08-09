class CategoryModel {
  int? responseCode;
  List<CategoryData>? catagoryData = [];
  String? message;

  CategoryModel({this.responseCode, this.catagoryData, this.message});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    if (json['data'] != null) {

      json['data'].forEach((v) {
        catagoryData!.add( CategoryData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseCode'] = this.responseCode;
    if (this.catagoryData != null) {
      data['data'] = this.catagoryData!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class CategoryData {
  bool? isDeleted;
  String? sId;
  String? name;
  String? createdAt;
  String? updatedAt;
  int? iV;

  CategoryData(
      {this.isDeleted,
        this.sId,
        this.name,
        this.createdAt,
        this.updatedAt,
        this.iV});

  CategoryData.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    name = json['name'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}