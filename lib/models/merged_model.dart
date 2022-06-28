class MergedModel {
  MergedModel({
    required this.cur,
    required this.buy,
    required this.type,
    required this.sell,
    required this.diff,
  });

  final String cur;
  final String buy;
  final String type;
  final String sell;
  final String diff;

  factory MergedModel.fromJson(Map<String, dynamic> json) => MergedModel(
        buy: json["Alış"],
        type: json["Tür"],
        sell: json["Satış"],
        diff: json["Değişim"], 
        cur: json["İsim"],
    );

    Map<String, dynamic> toJson() => {
        "Alış": buy,
        "Tür": type,
        "Satış": sell,
        "Değişim": diff,
        "İsim" : cur
    };

  @override
  String toString() {
    return "($cur)";
  }
}
