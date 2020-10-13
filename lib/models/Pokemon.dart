
class Pokemon{
  String name;
  String url;
  String get id =>url.split('/').reversed.elementAt(1);
  


  Pokemon({this.name,this.url});

  Pokemon.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}