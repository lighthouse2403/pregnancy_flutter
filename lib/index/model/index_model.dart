class IndexModel {
  String? week;
  String? bpdAverage;
  String? bpdRange;
  String? flAverage;
  String? flRange;
  String? efwAverage;
  String? efwRange;

  IndexModel({
    this.week,
    this.bpdAverage,
    this.bpdRange,
    this.flAverage,
    this.flRange,
    this.efwAverage,
    this.efwRange,
  });

  factory IndexModel.fromJson(Map<String, dynamic> json) => IndexModel(
    week: json["week"],
    bpdAverage: json["bpd_tb"],
    bpdRange: json["bpd_gh"],
    flAverage: json["fl_tb"],
    flRange: json["fl_gh"],
    efwAverage: json["efw_tb"],
    efwRange: json["efw_gh"],
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