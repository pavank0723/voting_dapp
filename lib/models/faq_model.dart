class FaqModel {
  int? id;
  String headerName;
  String description;
  bool isExpanded;

  FaqModel({
    this.id,
    required this.headerName,
    required this.description,
    this.isExpanded = false,
  });
}
