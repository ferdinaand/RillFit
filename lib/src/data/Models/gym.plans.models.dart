// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names, camel_case_types

class gymPlans {
  gymPlans({
    this.paymentRecurrence,
    this.amount,
    this.category,
    this.description,
    this.openingTime,
    this.closingTime,
    this.visitsPerMonth,
    this.priviledges,
  });

  String? paymentRecurrence;
  String? amount;
  String? category;
  String? description;
  String? openingTime;
  String? closingTime;
  String? visitsPerMonth;
  String? priviledges;
}
