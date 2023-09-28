// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names, camel_case_types

class gymPlans {
  gymPlans(
      {this.paymentRecurrence,
      required this.amount,
      required this.category,
      required this.description,
      required this.openingTime,
      required this.closingTime,
      required this.visitsPerMonth,
      required this.priviledges,
      required this.id});

  String? paymentRecurrence;
  String? amount;
  String? category;
  String? description;
  String? openingTime;
  String? closingTime;
  String? visitsPerMonth;
  String? priviledges;
  String? id;

  factory gymPlans.fromJson(dynamic JsonData) => gymPlans(
      id: JsonData['_id'] as String,
      category: JsonData['about'] as String,
      openingTime: JsonData['accessPeriod']['time']['start'] as String?,
      closingTime: JsonData['accessPeriod']['time']['end'] as String?,
      description: JsonData['about'] as String?,
      visitsPerMonth: JsonData['about'] as String?,
      amount: JsonData['about'] as String?,
      priviledges: JsonData['about'] as String?,
      paymentRecurrence: 'MONTHLY');
}
