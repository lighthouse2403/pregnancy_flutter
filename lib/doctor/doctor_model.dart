
class DoctorModel {
  String? doctorId = '';
  String name = '';
  String? address = '';
  String? time = '';
  String? hospital = '';
  String? phone = '';
  List<int>? rate = [];
  int? view = 0;

  DoctorModel({
    required this.doctorId,
    required this.name,
    required this.address,
    required this.time,
    this.hospital,
    this.rate,
    this.view,
    this.phone,
  });

  DoctorModel.fromJson(Map<String, dynamic> json) {
    doctorId = json['doctorId'] ?? '';
    name = json['name']?? '';
    address = json['address'] ?? '';
    time = json['time']?? '';
    hospital = json['hospital'] ?? '';
    if (json['rate'] != null) {
      rate = List.from(json['rate']);
    }
    view = json['view'] ?? 0;
    phone = json['phone'] ?? '';
  }
}