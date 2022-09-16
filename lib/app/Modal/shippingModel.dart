class ShippingModel {
  int? responseCode;
  Shipping1? data;
  String? message;

  ShippingModel({this.responseCode, this.data, this.message});

  ShippingModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    data = json['data'] != null ? Shipping1.fromJson(json['data']) : null;
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

class Shipping1 {
  int? appFee;
  int? gst;
  int? shippingCharge;
  int? freeShipping;
  int? maxDeliveryRadius;
  int? appointmentFee;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Shipping1(
      {this.appFee,
      this.gst,
      this.shippingCharge,
      this.freeShipping,
      this.maxDeliveryRadius,
      this.appointmentFee,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Shipping1.fromJson(Map<String, dynamic> json) {
    appFee = json['appFee'];
    gst = json['gst'];
    shippingCharge = json['shippingCharge'];
    freeShipping = json['freeShipping'];
    maxDeliveryRadius = json['maxDeliveryRadius'];
    appointmentFee = json['appointmentFee'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appFee'] = this.appFee;
    data['gst'] = this.gst;
    data['shippingCharge'] = this.shippingCharge;
    data['freeShipping'] = this.freeShipping;
    data['maxDeliveryRadius'] = this.maxDeliveryRadius;
    data['appointmentFee'] = this.appointmentFee;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
