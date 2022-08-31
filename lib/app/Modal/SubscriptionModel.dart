class subscriprion {
  int? responseCode;
  Data? data;
  String? message;

  subscriprion({this.responseCode, this.data, this.message});

  subscriprion.fromJson(Map<String, dynamic> json) {
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
  Transaction? transaction;
  Order? order;

  Data({this.transaction, this.order});

  Data.fromJson(Map<String, dynamic> json) {
    transaction = json['transaction'] != null
        ? new Transaction.fromJson(json['transaction'])
        : null;
    order = json['order'] != null ? new Order.fromJson(json['order']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.transaction != null) {
      data['transaction'] = this.transaction!.toJson();
    }
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    return data;
  }
}

class Transaction {
  String? state;
  String? transactionType;
  int? shippingAmount;
  String? sId;
  String? userId;
  int? amount;
  String? planId;
  int? gstAmount;
  int? taxableAmount;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Transaction(
      {this.state,
        this.transactionType,
        this.shippingAmount,
        this.sId,
        this.userId,
        this.amount,
        this.planId,
        this.gstAmount,
        this.taxableAmount,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Transaction.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    transactionType = json['transactionType'];
    shippingAmount = json['shippingAmount'];
    sId = json['_id'];
    userId = json['userId'];
    amount = json['amount'];
    planId = json['planId'];
    gstAmount = json['gstAmount'];
    taxableAmount = json['taxableAmount'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['transactionType'] = this.transactionType;
    data['shippingAmount'] = this.shippingAmount;
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['amount'] = this.amount;
    data['planId'] = this.planId;
    data['gstAmount'] = this.gstAmount;
    data['taxableAmount'] = this.taxableAmount;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Order {
  String? id;
  String? entity;
  int? amount;
  int? amountPaid;
  int? amountDue;
  String? currency;
  String? receipt;
  Null? offerId;
  String? status;
  int? attempts;
  List<String>? notes;
  int? createdAt;

  Order(
      {this.id,
        this.entity,
        this.amount,
        this.amountPaid,
        this.amountDue,
        this.currency,
        this.receipt,
        this.offerId,
        this.status,
        this.attempts,
        this.notes,
        this.createdAt});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    entity = json['entity'];
    amount = json['amount'];
    amountPaid = json['amount_paid'];
    amountDue = json['amount_due'];
    currency = json['currency'];
    receipt = json['receipt'];
    offerId = json['offer_id'];
    status = json['status'];
    attempts = json['attempts'];
    notes = json['notes'].cast<String>();
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['entity'] = this.entity;
    data['amount'] = this.amount;
    data['amount_paid'] = this.amountPaid;
    data['amount_due'] = this.amountDue;
    data['currency'] = this.currency;
    data['receipt'] = this.receipt;
    data['offer_id'] = this.offerId;
    data['status'] = this.status;
    data['attempts'] = this.attempts;
    data['notes'] = this.notes;
    data['created_at'] = this.createdAt;
    return data;
  }
}