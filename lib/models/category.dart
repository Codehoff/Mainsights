class Category {
  String name;
  List<String> subcategories;

  Category({
    this.name,
    this.subcategories,
  });

  Category.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    subcategories = json['subcategories'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['subcategories'] = this.subcategories;
    return data;
  }
}
