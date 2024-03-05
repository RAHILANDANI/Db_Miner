class ApiModel {
  String Name;
  String Description;
  bool HTTPS;
  String Link;
  String Categories;

  ApiModel(
      {required this.Name,
      required this.Description,
      required this.HTTPS,
      required this.Link,
      required this.Categories});
}
