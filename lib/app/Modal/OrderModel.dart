class Order {
  int? responseCode;
  Data? data;
  String? message;

  Order({this.responseCode, this.data, this.message});

  Order.fromJson(Map<String, dynamic> json) {
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
  List<Orders>? orders;
  List<OrderDetails>? orderDetails;
  int? totalCount;

  Data({this.orders, this.orderDetails, this.totalCount});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }
    if (json['orderDetails'] != null) {
      orderDetails = <OrderDetails>[];
      json['orderDetails'].forEach((v) {
        orderDetails!.add(new OrderDetails.fromJson(v));
      });
    }
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    if (this.orderDetails != null) {
      data['orderDetails'] = this.orderDetails!.map((v) => v.toJson()).toList();
    }
    data['totalCount'] = this.totalCount;
    return data;
  }
}

class Orders {
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

  Orders(
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

  Orders.fromJson(Map<String, dynamic> json) {
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

class OrderDetails {
  String? sId;
  String? status;
  bool? isProductRated;
  String? paymentStatus;
  String? orderId;
  String? orderNo;
  String? productId;
  Product? product;
  int? quantity;
  SellerId? sellerId;
  int? shippingCharge;
  String? userId;
  int? iV;
  String? createdAt;
  String? updatedAt;

  OrderDetails(
      {this.sId,
        this.status,
        this.isProductRated,
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
        this.updatedAt});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    status = json['status'];
    isProductRated = json['isProductRated'];
    paymentStatus = json['paymentStatus'];
    orderId = json['orderId'];
    orderNo = json['orderNo'];
    productId = json['productId'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
    quantity = json['quantity'];
    sellerId = json['sellerId'] != null
        ? new SellerId.fromJson(json['sellerId'])
        : null;
    shippingCharge = json['shippingCharge'];
    userId = json['userId'];
    iV = json['__v'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['status'] = this.status;
    data['isProductRated'] = this.isProductRated;
    data['paymentStatus'] = this.paymentStatus;
    data['orderId'] = this.orderId;
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
    data['userId'] = this.userId;
    data['__v'] = this.iV;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
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
  int? price;
  int? discountedPrice;
  double? discount;
  String? brand;
  List<String>? images;
  Null? color;
  String? lifeStage;
  String? breedSize;
  String? flavor;
  String? productType;
  Null? materialUsed;
  String? vegNonveg;

  Product(
      {this.sId,
        this.sellerId,
        this.title,
        this.description,
        this.category,
        this.subCategory,
        this.weight,
        this.unit,
        this.price,
        this.discountedPrice,
        this.discount,
        this.brand,
        this.images,
        this.color,
        this.lifeStage,
        this.breedSize,
        this.flavor,
        this.productType,
        this.materialUsed,
        this.vegNonveg});

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
    price = json['price'];
    discountedPrice = json['discountedPrice'];
    discount = json['discount'];
    brand = json['brand'];
    images = json['images'].cast<String>();
    color = json['color'];
    lifeStage = json['life_stage'];
    breedSize = json['breed_size'];
    flavor = json['flavor'];
    productType = json['product_type'];
    materialUsed = json['material_used'];
    vegNonveg = json['veg_nonveg'];
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
    data['price'] = this.price;
    data['discountedPrice'] = this.discountedPrice;
    data['discount'] = this.discount;
    data['brand'] = this.brand;
    data['images'] = this.images;
    data['color'] = this.color;
    data['life_stage'] = this.lifeStage;
    data['breed_size'] = this.breedSize;
    data['flavor'] = this.flavor;
    data['product_type'] = this.productType;
    data['material_used'] = this.materialUsed;
    data['veg_nonveg'] = this.vegNonveg;
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
