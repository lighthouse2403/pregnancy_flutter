class IndexModel {
  String? week;
  String? bpdAverage;
  String? bpdRange;
  String flAverage;
  String flRange;
  String efwAverage;
  String efwRange;

  IndexModel({
    this.empPayslipsId,
    this.month,
    this.description,
    this.paymentPeriod,
    this.lastAccessBy,
    this.lastAccessDate,
    this.lastAccessTime,
    this.successAccess,
    this.failAccess,
  });

  factory IndexModel.fromJson(Map<String, dynamic> json) => new Sample(
    empPayslipsId: json["empPayslipsId"],
    month: json["month"],
    description: json["description"],
    paymentPeriod: json["paymentPeriod"],
    lastAccessBy: json["lastAccessBy"],
    lastAccessDate: json["lastAccessDate"],
    lastAccessTime: json["lastAccessTime"],
    successAccess: json["successAccess"],
    failAccess: json["failAccess"],
  );

  Map<String, dynamic> toJson() => {
    "empPayslipsId": empPayslipsId,
    "month": month,
    "description": description,
    "paymentPeriod": paymentPeriod,
    "lastAccessBy": lastAccessBy,
    "lastAccessDate": lastAccessDate,
    "lastAccessTime": lastAccessTime,
    "successAccess": successAccess,
    "failAccess": failAccess,
  };
}