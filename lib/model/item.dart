class ExpandableItem {
  ExpandableItem({
    required this.headerValue,
    required this.subItems,
    this.isExpanded = false,
  });

  String headerValue;
  List<String> subItems;
  bool isExpanded;
}
