import 'dart:convert';

ImageModel imageModelFromJson(String str) => ImageModel.fromJson(json.decode(str));

String imageModelToJson(ImageModel data) => json.encode(data.toJson());

class ImageModel {
  int status;
  String message;
  Data data;

  ImageModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
    status: json["Status"],
    message: json["Message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "Status": status,
    "Message": message,
    "data": data.toJson(),
  };
}

class Data {
  int totalRecords;
  List<Record> records;
  Data({
    required this.totalRecords,
    required this.records,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    totalRecords: json["TotalRecords"],
    records: List<Record>.from(json["Records"].map((x) => Record.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "TotalRecords": totalRecords,
    "Records": List<dynamic>.from(records.map((x) => x.toJson())),
  };
}

class Record {
  int id;
  String title;
  String shortDescription;
  int collectedValue;
  int totalValue;
  String startDate;
  String endDate;
  String mainImageUrl;

  Record({
    required this.id,
    required this.title,
    required this.shortDescription,
    required this.collectedValue,
    required this.totalValue,
    required this.startDate,
    required this.endDate,
    required this.mainImageUrl,
  });

  factory Record.fromJson(Map<String, dynamic> json) => Record(
    id: json["Id"],
    title: json["title"],
    shortDescription: json["shortDescription"],
    collectedValue: json["collectedValue"],
    totalValue: json["totalValue"],
    startDate: json["startDate"],
    endDate: json["endDate"],
    mainImageUrl: json["mainImageURL"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "title": title,
    "shortDescription": shortDescription,
    "collectedValue": collectedValue,
    "totalValue": totalValue,
    "startDate": startDate,
    "endDate": endDate,
    "mainImageURL": mainImageUrl,
  };
}
