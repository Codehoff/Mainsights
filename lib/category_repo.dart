import "./models/category.dart";

class CategoryRepo {
  List<Map> getAllCategories() => _dummyCategories;

  getSubcategoyByCategory(String name) => _dummyCategories
      .map((map) => Category.fromJson(map))
      .where((item) => item.name == name)
      .map((item) => item.subcategories)
      .expand((i) => i)
      .toList();

  List<String> getNames() => _dummyCategories
      .map((map) => Category.fromJson(map))
      .map((item) => item.name)
      .toList();

  List _dummyCategories = [
    {
      "name": "Accounting",
      "subcategories": ["General"],
    },
    {
      "name": "Process",
      "subcategories": ["Merger Model", "Comps"],
    },
    {
      "name": "Valuation",
      "subcategories": ["DCF", "LBO"],
    }
  ];
}
