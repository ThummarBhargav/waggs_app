class CreateImageSlotModel {
  int? responseCode;
  Data? data;
  String? message;

  CreateImageSlotModel({this.responseCode, this.data, this.message});

  CreateImageSlotModel.fromJson(Map<String, dynamic> json) {
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
  File? file;

  Data({this.file});

  Data.fromJson(Map<String, dynamic> json) {
    file = json['file'] != null ? new File.fromJson(json['file']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.file != null) {
      data['file'] = this.file!.toJson();
    }
    return data;
  }
}

class File {
  String? url;
  int? size;
  String? type;

  File({this.url, this.size, this.type});

  File.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    size = json['size'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['size'] = this.size;
    data['type'] = this.type;
    return data;
  }
}
