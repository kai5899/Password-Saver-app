class Account {
  int id; //auto
  String title;
  String auth;
  String password;
  int catId;
  String icon;
  int color;

  Account({
    this.id,
    this.auth,
    this.catId,
    this.icon,
    this.password,
    this.title,
    this.color
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
        auth: json["auth"],
        catId: json["catId"],
        icon: json["icon"],
        id: json["id"],
        password: json["password"],
        title: json["title"],
        color: json["color"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "auth": this.auth,
      "catId": this.catId,
      "password": this.password,
      "title": this.title,
      "icon": this.icon,
      "color":this.color
    };
  }
}
