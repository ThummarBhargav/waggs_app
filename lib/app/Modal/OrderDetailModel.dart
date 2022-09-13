import 'dart:ffi';

class OrderDetailModel {
  int? responseCode;
  Data? data;
  String? message;

  OrderDetailModel({this.responseCode, this.data, this.message});

  OrderDetailModel.fromJson(Map<String, dynamic> json) {
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
  String? status;
  bool isProductRated = false;
  String? paymentStatus;
  OrderId? orderId;
  String? orderNo;
  String? productId;
  Product? product;
  int? quantity;
  SellerId? sellerId;
  int? shippingCharge;
  UserId? userId;
  int? iV;
  String? createdAt;
  String? updatedAt;
  double rating = 0.0;
  Data({
    this.sId,
    this.status,
    this.isProductRated = false,
    this.paymentStatus,
    this.orderId,
    this.orderNo,
    this.productId,
    this.product,
    this.quantity,
    this.sellerId,
    this.shippingCharge,
    this.userId,
    this.iV,
    this.createdAt,
    this.updatedAt,
    this.rating = 0.0,
  });

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    status = json['status'];
    isProductRated = json['isProductRated'];
    paymentStatus = json['paymentStatus'];
    orderId =
        json['orderId'] != null ? new OrderId.fromJson(json['orderId']) : null;
    orderNo = json['orderNo'];
    productId = json['productId'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    quantity = json['quantity'];
    sellerId = json['sellerId'] != null
        ? new SellerId.fromJson(json['sellerId'])
        : null;
    shippingCharge = json['shippingCharge'];
    userId =
        json['userId'] != null ? new UserId.fromJson(json['userId']) : null;
    iV = json['__v'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (isProductRated) {
      rating = (json["rating"].runtimeType == int)
          ? double.parse(json["rating"].toString())
          : json["rating"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['status'] = this.status;
    data['isProductRated'] = this.isProductRated;
    data['paymentStatus'] = this.paymentStatus;
    if (this.orderId != null) {
      data['orderId'] = this.orderId!.toJson();
    }
    data['orderNo'] = this.orderNo;
    data['productId'] = this.productId;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['quantity'] = this.quantity;
    if (this.sellerId != null) {
      data['sellerId'] = this.sellerId!.toJson();
    }
    data['shippingCharge'] = this.shippingCharge;
    if (this.userId != null) {
      data['userId'] = this.userId!.toJson();
    }
    data['__v'] = this.iV;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class OrderId {
  String? sId;
  String? orderNo;
  String? userId;
  int? amount;
  String? address;
  double? latitude;
  double? longitude;
  int? gstAmount;
  int? taxableAmount;
  String? transactionId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  OrderId(
      {this.sId,
      this.orderNo,
      this.userId,
      this.amount,
      this.address,
      this.latitude,
      this.longitude,
      this.gstAmount,
      this.taxableAmount,
      this.transactionId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  OrderId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    orderNo = json['orderNo'];
    userId = json['userId'];
    amount = json['amount'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    gstAmount = json['gstAmount'];
    taxableAmount = json['taxableAmount'];
    transactionId = json['transactionId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['orderNo'] = this.orderNo;
    data['userId'] = this.userId;
    data['amount'] = this.amount;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['gstAmount'] = this.gstAmount;
    data['taxableAmount'] = this.taxableAmount;
    data['transactionId'] = this.transactionId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Product {
  String? sId;
  SellerId? sellerId;
  String? title;
  String? description;
  String? category;
  String? subCategory;
  int? weight;
  String? unit;
  String? color;
  num? price;
  num? discountedPrice;
  num? discount;
  String? lifeStage;
  String? brand;
  String? breedSize;
  String? flavor;
  String? productType;
  String? materialUsed;
  String? vegNonveg;
  List<String>? images;

  Product(
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

  Product.fromJson(Map<String, dynamic> json) {
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
    discount = json['discount'];
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

class UserId {
  String? sId;
  bool? isEmailVerified;
  String? name;
  String? email;
  String? mobile;
  String? countryCode;
  String? address;
  double? latitude;
  double? longitude;

  UserId(
      {this.sId,
      this.isEmailVerified,
      this.name,
      this.email,
      this.mobile,
      this.countryCode,
      this.address,
      this.latitude,
      this.longitude});

  UserId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isEmailVerified = json['isEmailVerified'];
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
    data['_id'] = this.sId;
    data['isEmailVerified'] = this.isEmailVerified;
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
