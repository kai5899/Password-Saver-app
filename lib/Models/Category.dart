class Category {
  int id; // auto
  String title;
  int color;

  Category({
    this.color,
    this.id,
    this.title,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      color: json["color"],
      id: json["id"],
      title: json["title"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "color": this.color,
      "title": this.title,
    };
  }
}

List<Category> categories = [
  Category(
    id: 1,
    title: "social",
  ),
  Category(
    id: 2,
    title: "banks",
  ),
  Category(
    id:3,
    title: "work"
  ),
  Category(
    id:4,
    title: "others"
  )

];
