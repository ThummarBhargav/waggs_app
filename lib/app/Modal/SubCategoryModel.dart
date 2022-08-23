import 'package:get/get.dart';

class SubCategorymodel {
  int? responseCode;
  List<SubCategoryData>? data;
  String? message;

  SubCategorymodel({this.responseCode, this.data, this.message});

  SubCategorymodel.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    if (json['data'] != null) {
      data = <SubCategoryData>[];
      json['data'].forEach((v) {
        data!.add(new SubCategoryData.fromJson(v));
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

class SubCategoryData {
  bool? isDeleted;
  String? sId;
  String? name;
  List<Fields>? fields;
  String? categoryId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  SubCategoryData(
      {this.isDeleted,
        this.sId,
        this.name,
        this.fields,
        this.categoryId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  SubCategoryData.fromJson(Map<String, dynamic> json) {
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    name = json['name'];
    if (json['fields'] != null) {
      fields = <Fields>[];
      json['fields'].forEach((v) {
        fields!.add(new Fields.fromJson(v));
      });
    }
    categoryId = json['categoryId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isDeleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['name'] = this.name;
    if (this.fields != null) {
      data['fields'] = this.fields!.map((v) => v.toJson()).toList();
    }
    data['categoryId'] = this.categoryId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Fields {
  List<String>? values;
  String? sId;
  String? id;
  RxBool? isExpanded;

  Fields({this.values, this.sId, this.id,this.isExpanded});

  Fields.fromJson(Map<String, dynamic> json) {
    values = json['values'].cast<String>();
    sId = json['_id'];
    id = json['id'];
    isExpanded = false.obs;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['values'] = this.values;
    data['_id'] = this.sId;
    data['id'] = this.id;
    return data;
  }
}
