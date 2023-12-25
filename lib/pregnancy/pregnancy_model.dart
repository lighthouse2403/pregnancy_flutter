
class PregnancyProcessModel {
  int week = 1;
  String? mom = '';
  String? baby = '';
  String? advice = '';

  PregnancyProcessModel(
    this.week,
    this.mom,
    this.baby,
    this.advice
  );

  PregnancyProcessModel.fromJson(Map<String, dynamic> json) {
    week = json['week'] ?? '';
    mom = json['mom']?? '';
    baby = json['baby'] ?? '';
    advice = json['advice']?? '';
  }
}