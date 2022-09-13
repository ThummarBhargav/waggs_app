import 'package:waggs_app/app/constant/sizeConstant.dart';

class StoreModule {
  int? responseCode;
  product1? data;
  String? message;

  StoreModule({this.responseCode, this.data, this.message});

  StoreModule.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    data = json['data'] != null ? new product1.fromJson(json['data']) : null;
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

class product1 {
  List<Products0>? products;
  List<Sellers>? sellers;

  product1({this.products, this.sellers});

  product1.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products0>[];
      json['products'].forEach((v) {
        products!.add(new Products0.fromJson(v));
      });
    }
    if (json['sellers'] != null) {
      sellers = <Sellers>[];
      json['sellers'].forEach((v) {
        sellers!.add(new Sellers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.sellers != null) {
      data['sellers'] = this.sellers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products0 {
  String? sId;
  String? unit;
  double? rating;
  int? ratedBy;
  List<String>? images;
  SellerId? sellerId;
  String? title;
  String? description;
  Category? category;
  SubCategory? subCategory;
  int? weight;
  int? stock;
  int? price;
  int? discountedPrice;
  String? brand;
  double? discount;
  String? lifeStage;
  String? productType;
  String? flavor;
  String? breedSize;
  String? vegNonveg;
  String? color;
  String? materialUsed;

  Products0(
      {this.sId,
      this.unit,
      this.rating,
      this.ratedBy,
      this.images,
      this.sellerId,
      this.title,
      this.description,
      this.category,
      this.subCategory,
      this.weight,
      this.stock,
      this.price,
      this.discountedPrice,
      this.brand,
      this.discount,
      this.lifeStage,
      this.productType,
      this.flavor,
      this.breedSize,
      this.vegNonveg,
      this.color,
      this.materialUsed});

  Products0.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    unit = json['unit'];
    rating = (json['rating'].runtimeType == int)
        ? double.parse(json['rating'].toString())
        : json['rating'];
    ratedBy = json['ratedBy'];
    images = json['images'].cast<String>();
    sellerId = json['sellerId'] != null
        ? new SellerId.fromJson(json['sellerId'])
        : null;
    title = json['title'];
    description = json['description'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    subCategory = json['subCategory'] != null
        ? new SubCategory.fromJson(json['subCategory'])
        : null;
    weight = json['weight'];
    stock = json['stock'];
    price = (isNullEmptyOrFalse(json['price'])) ? 0 : json['price'];
    discountedPrice = json['discountedPrice'];
    brand = json['brand'];
    discount = (json['discount'].runtimeType == int)
        ? double.parse(json['discount'].toString())
        : json['discount'];
    lifeStage = json['life_stage'];
    productType = json['product_type'];
    flavor = json['flavor'];
    breedSize = json['breed_size'];
    vegNonveg = json['veg_nonveg'];
    color = json['color'];
    materialUsed = json['material_used'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['unit'] = this.unit;
    data['rating'] = this.rating;
    data['ratedBy'] = this.ratedBy;
    data['images'] = this.images;
    if (this.sellerId != null) {
      data['sellerId'] = this.sellerId!.toJson();
    }
    data['title'] = this.title;
    data['description'] = this.description;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.subCategory != null) {
      data['subCategory'] = this.subCategory!.toJson();
    }
    data['weight'] = this.weight;
    data['stock'] = this.stock;
    data['price'] = this.price;
    data['discountedPrice'] = this.discountedPrice;
    data['brand'] = this.brand;
    data['discount'] = this.discount;
    data['life_stage'] = this.lifeStage;
    data['product_type'] = this.productType;
    data['flavor'] = this.flavor;
    data['breed_size'] = this.breedSize;
    data['veg_nonveg'] = this.vegNonveg;
    data['color'] = this.color;
    data['material_used'] = this.materialUsed;
    return data;
  }
}

class SellerId {
  String? sId;
  bool? isEmailVerified;
  bool? isApproved;
  bool? waiveOffShipping;
  String? name;
  String? email;
  String? mobile;
  String? countryCode;
  String? address;
  double? latitude;
  double? longitude;
  String? city;
  String? companyName;
  String? country;
  String? fssaiNumber;
  String? gstNo;
  String? logoUrl;
  String? panNo;
  String? pincode;
  int? shippingLimit;
  String? state;

  SellerId(
      {this.sId,
      this.isEmailVerified,
      this.isApproved,
      this.waiveOffShipping,
      this.name,
      this.email,
      this.mobile,
      this.countryCode,
      this.address,
      this.latitude,
      this.longitude,
      this.city,
      this.companyName,
      this.country,
      this.fssaiNumber,
      this.gstNo,
      this.logoUrl,
      this.panNo,
      this.pincode,
      this.shippingLimit,
      this.state});

  SellerId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isEmailVerified = json['isEmailVerified'];
    isApproved = json['isApproved'];
    waiveOffShipping = json['waiveOffShipping'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    countryCode = json['countryCode'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    city = json['city'];
    companyName = json['companyName'];
    country = json['country'];
    fssaiNumber = json['fssaiNumber'];
    gstNo = json['gstNo'];
    logoUrl = json['logoUrl'];
    panNo = json['panNo'];
    pincode = json['pincode'];
    shippingLimit = json['shippingLimit'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['isEmailVerified'] = this.isEmailVerified;
    data['isApproved'] = this.isApproved;
    data['waiveOffShipping'] = this.waiveOffShipping;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['countryCode'] = this.countryCode;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['city'] = this.city;
    data['companyName'] = this.companyName;
    data['country'] = this.country;
    data['fssaiNumber'] = this.fssaiNumber;
    data['gstNo'] = this.gstNo;
    data['logoUrl'] = this.logoUrl;
    data['panNo'] = this.panNo;
    data['pincode'] = this.pincode;
    data['shippingLimit'] = this.shippingLimit;
    data['state'] = this.state;
    return data;
  }
}

class Category {
  String? sId;
  bool? isDeleted;
  String? name;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Category(
      {this.sId,
      this.isDeleted,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Category.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isDeleted = json['isDeleted'];
    name = json['name'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['isDeleted'] = this.isDeleted;
    data['name'] = this.name;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class SubCategory {
  String? sId;
  bool? isDeleted;
  String? name;
  String? categoryId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  SubCategory(
      {this.sId,
      this.isDeleted,
      this.name,
      this.categoryId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  SubCategory.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isDeleted = json['isDeleted'];
    name = json['name'];
    categoryId = json['categoryId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['isDeleted'] = this.isDeleted;
    data['name'] = this.name;
    data['categoryId'] = this.categoryId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Sellers {
  String? sId;
  String? name;
  String? email;
  String? mobile;
  String? countryCode;
  bool? isEmailVerified;
  bool? isApproved;
  String? logoUrl;
  String? companyName;
  String? address;
  String? city;
  String? state;
  String? country;
  String? pincode;
  String? fssaiNumber;
  String? fssaiFileUrl;
  String? gstNo;
  String? gstFileUrl;
  String? panNo;
  String? panFileUrl;
  int? shippingLimit;
  bool? waiveOffShipping;
  double? latitude;
  double? longitude;

  Sellers(
      {this.sId,
      this.name,
      this.email,
      this.mobile,
      this.countryCode,
      this.isEmailVerified,
      this.isApproved,
      this.logoUrl,
      this.companyName,
      this.address,
      this.city,
      this.state,
      this.country,
      this.pincode,
      this.fssaiNumber,
      this.fssaiFileUrl,
      this.gstNo,
      this.gstFileUrl,
      this.panNo,
      this.panFileUrl,
      this.shippingLimit,
      this.waiveOffShipping,
      this.latitude,
      this.longitude});

  Sellers.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    countryCode = json['countryCode'];
    isEmailVerified = json['isEmailVerified'];
    isApproved = json['isApproved'];
    logoUrl = json['logoUrl'];
    companyName = json['companyName'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    pincode = json['pincode'];
    fssaiNumber = json['fssaiNumber'];
    fssaiFileUrl = json['fssaiFileUrl'];
    gstNo = json['gstNo'];
    gstFileUrl = json['gstFileUrl'];
    panNo = json['panNo'];
    panFileUrl = json['panFileUrl'];
    shippingLimit = json['shippingLimit'];
    waiveOffShipping = json['waiveOffShipping'];
    latitude = json['latitude'];
    longitude = json['longitude'];
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
    data['companyName'] = this.companyName;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['pincode'] = this.pincode;
    data['fssaiNumber'] = this.fssaiNumber;
    data['fssaiFileUrl'] = this.fssaiFileUrl;
    data['gstNo'] = this.gstNo;
    data['gstFileUrl'] = this.gstFileUrl;
    data['panNo'] = this.panNo;
    data['panFileUrl'] = this.panFileUrl;
    data['shippingLimit'] = this.shippingLimit;
    data['waiveOffShipping'] = this.waiveOffShipping;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}
