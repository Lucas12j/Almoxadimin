class Items {
  int amont;
  String descr;
  int id;
  String name;

  Items({this.amont, this.descr, this.id, this.name});

  Items.fromJson(Map<String, dynamic> json) {
    amont = json['amont'];
    descr = json['descr'];
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amont'] = this.amont;
    data['descr'] = this.descr;
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
