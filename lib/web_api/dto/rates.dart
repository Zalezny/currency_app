class Rates {
  String? no;
  String? effectiveDate;
  double? mid;

  Rates({this.no, this.effectiveDate, this.mid});

  Rates.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    effectiveDate = json['effectiveDate'];
    mid = json['mid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no'] = no;
    data['effectiveDate'] = effectiveDate;
    data['mid'] = mid;
    return data;
  }
}