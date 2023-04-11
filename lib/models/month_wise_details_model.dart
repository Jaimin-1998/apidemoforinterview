// To parse this JSON data, do
//
//     final monthWiseDetailsModel = monthWiseDetailsModelFromJson(jsonString);

import 'dart:convert';

MonthWiseDetailsModel monthWiseDetailsModelFromJson(String str) => MonthWiseDetailsModel.fromJson(json.decode(str));

String monthWiseDetailsModelToJson(MonthWiseDetailsModel data) => json.encode(data.toJson());

class MonthWiseDetailsModel {
  MonthWiseDetailsModel({
    this.user,
    this.reports,
  });

  User? user;
  List<Report>? reports;

  factory MonthWiseDetailsModel.fromJson(Map<String, dynamic> json) => MonthWiseDetailsModel(
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    reports: json["reports"] == null ? [] : List<Report>.from(json["reports"]!.map((x) => Report.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
    "reports": reports == null ? [] : List<dynamic>.from(reports!.map((x) => x.toJson())),
  };
}

class Report {
  Report({
    this.date,
    this.optIns,
  });

  String? date;
  Map<String,dynamic>? optIns;

  factory Report.fromJson(Map<String, dynamic> json) {
   String date=json["date"].toString();
   var dk = json["opt_ins"];
   if(dk.runtimeType.toString()=="_InternalLinkedHashMap<String, dynamic>"){
     dk=json["opt_ins"];
   }
   else
     {
       dk={"":""};
     }


    return Report(
       date: date,
      optIns: dk
  );
}

  Map<String, dynamic> toJson() => {
    "date": date,
    "opt_ins": optIns,
  };
}
//
// class OptInsClass {
//   OptInsClass({
//     this.breakfast,
//     this.lunch,
//     this.dinner,
//   });
//
//   String? breakfast;
//   String? lunch;
//   String? dinner;
//
//   factory OptInsClass.fromJson(Map<String, dynamic> json) => OptInsClass(
//     breakfast: json["breakfast"]!,
//     lunch: json["lunch"]!,
//     dinner: json["dinner"]!,
//   );
//
//   Map<String, dynamic> toJson() => {
//     "breakfast": breakfast,
//     "lunch": lunch,
//     "dinner": dinner,
//   };
// }

class User {
  User({
    this.id,
    this.fName,
    this.lName,
    this.phone,
    this.email,
    this.image,
    this.isPhoneVerified,
    this.emailVerifiedAt,
    this.emailVerificationToken,
    this.cmFirebaseToken,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.orderCount,
    this.empId,
    this.departmentId,
    this.isVeg,
    this.isSatOpted,
    this.deviceId,
    this.isInvalidDevice,
  });

  int? id;
  String? fName;
  String? lName;
  String? phone;
  String? email;
  dynamic image;
  int? isPhoneVerified;
  dynamic emailVerifiedAt;
  dynamic emailVerificationToken;
  String? cmFirebaseToken;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? status;
  int? orderCount;
  String? empId;
  int? departmentId;
  int? isVeg;
  int? isSatOpted;
  String? deviceId;
  int? isInvalidDevice;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    fName: json["f_name"],
    lName: json["l_name"],
    phone: json["phone"],
    email: json["email"],
    image: json["image"],
    isPhoneVerified: json["is_phone_verified"],
    emailVerifiedAt: json["email_verified_at"],
    emailVerificationToken: json["email_verification_token"],
    cmFirebaseToken: json["cm_firebase_token"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    status: json["status"],
    orderCount: json["order_count"],
    empId: json["emp_id"],
    departmentId: json["department_id"],
    isVeg: json["is_veg"],
    isSatOpted: json["is_sat_opted"],
    deviceId: json["device_id"],
    isInvalidDevice: json["is_invalid_device"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "f_name": fName,
    "l_name": lName,
    "phone": phone,
    "email": email,
    "image": image,
    "is_phone_verified": isPhoneVerified,
    "email_verified_at": emailVerifiedAt,
    "email_verification_token": emailVerificationToken,
    "cm_firebase_token": cmFirebaseToken,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "status": status,
    "order_count": orderCount,
    "emp_id": empId,
    "department_id": departmentId,
    "is_veg": isVeg,
    "is_sat_opted": isSatOpted,
    "device_id": deviceId,
    "is_invalid_device": isInvalidDevice,
  };
}
