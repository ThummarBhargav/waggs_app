class CartProduct {
  int? responseCode;
  Data? data;
  String? message;

  CartProduct({this.responseCode, this.data, this.message});

  CartProduct.fromJson(Map<String, dynamic> json) {
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
  String? sId;
  String? userId;
  List<Details>? details;

  Data({this.sId, this.userId, this.details});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details!.add(new Details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    if (this.details != null) {
      data['details'] = this.details!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Details {
  int? quantity;
  String? productId;
  Product2? product;

  Details({this.quantity, this.productId, this.product});

  Details.fromJson(Map<String, dynamic> json) {
    quantity = json['quantity'];
    productId = json['productId'];
    product =
    json['product'] != null ? new Product2.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quantity'] = this.quantity;
    data['productId'] = this.productId;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product2 {
  String? sId;
  SellerId? sellerId;
  String? title;
  String? description;
  String? category;
  String? subCategory;
  int? weight;
  String? unit;
  String? color;
  int? price;
  int? discountedPrice;
  double? discount;
  String? lifeStage;
  String? brand;
  String? breedSize;
  String? flavor;
  String? productType;
  Null? materialUsed;
  String? vegNonveg;
  List<String>? images;

  Product2(
      {this.sId,
        this.sellerId,
        this.title,
        this.description,
        this.category,
        this.subCategory,
        this.weight,
        this.unit,
        this.color,
        this.price,
        this.discountedPrice,
        this.discount,
        this.lifeStage,
        this.brand,
        this.breedSize,
        this.flavor,
        this.productType,
        this.materialUsed,
        this.vegNonveg,
        this.images});

  Product2.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    sellerId = json['sellerId'] != null
        ? new SellerId.fromJson(json['sellerId'])
        : null;
    title = json['title'];
    description = json['description'];
    category = json['category'];
    subCategory = json['subCategory'];
    weight = json['weight'];
    unit = json['unit'];
    color = json['color'];
    price = json['price'];
    discountedPrice = json['discountedPrice'];
    discount = (json['discount'].runtimeType == int )?double.tryParse(json['discount'].toString()):json['discount'];
    lifeStage = json['life_stage'];
    brand = json['brand'];
    breedSize = json['breed_size'];
    flavor = json['flavor'];
    productType = json['product_type'];
    materialUsed = json['material_used'];
    vegNonveg = json['veg_nonveg'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.sellerId != null) {
      data['sellerId'] = this.sellerId!.toJson();
    }
    data['title'] = this.title;
    data['description'] = this.description;
    data['category'] = this.category;
    data['subCategory'] = this.subCategory;
    data['weight'] = this.weight;
    data['unit'] = this.unit;
    data['color'] = this.color;
    data['price'] = this.price;
    data['discountedPrice'] = this.discountedPrice;
    data['discount'] = this.discount;
    data['life_stage'] = this.lifeStage;
    data['brand'] = this.brand;
    data['breed_size'] = this.breedSize;
    data['flavor'] = this.flavor;
    data['product_type'] = this.productType;
    data['material_used'] = this.materialUsed;
    data['veg_nonveg'] = this.vegNonveg;
    data['images'] = this.images;
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
