
class VaccinationModel {
  String? vaccinationId = '';
  String name = '';
  List<String> address = [];
  String? time = '';
  String? phone = '';
  List<int>? rate = [];
  int? view = 0;

  VaccinationModel({
    required this.vaccinationId,
    required this.name,
    required this.address,
    required this.time,
    this.phone,
    this.rate,
    this.view,
  });

  VaccinationModel.fromJson(Map<String, dynamic> json) {
    vaccinationId = json['vaccinationId'] ?? '';
    name = json['name']?? '';
    time = json['time']?? '';
    phone = json['phone'] ?? '';
    view = json['view'] ?? 0;
    if (json['address'] != null) {
      address = List.from(json['address']);
    }
    if (json['rate'] != null) {
      rate = List.from(json['rate']);
    }
  }
}