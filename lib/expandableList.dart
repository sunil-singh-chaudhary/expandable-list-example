import 'package:flutter/material.dart';

import 'model/item.dart';

class ExpandableListView extends StatefulWidget {
  const ExpandableListView({Key? key}) : super(key: key);
  @override
  State<ExpandableListView> createState() => _StepsState();
}

class _StepsState extends State<ExpandableListView> {
  final List<ExpandableItem> _items = generateItems(10);
  List<int> currentIndexes = List.generate(10, (index) => -1);
  // Initialize with -1 to indicate no selection
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return Card(
              key: Key(_items[index].headerValue),
              elevation: 4,
              color: Colors.blue,
              child: ExpansionTile(
                childrenPadding: const EdgeInsets.all(4),
                leading: CircleAvatar(
                    backgroundColor: Colors.red,
                    child: Center(child: Text('${index + 1}'))),
                title: Text(_items[index].headerValue),
                backgroundColor: Colors.green,
                children: _items[index].subItems.map((entries) {
                  return RadioListTile<int>(
                      title: Text(entries),
                      value: _items[index].subItems.indexOf(
                          entries), //with asMap() we have to it like this
                      groupValue: currentIndexes[index],
                      onChanged: (value) {
                        setState(() {
                          currentIndexes[index] = value!;
                          debugPrint(
                            'Selected item in expansion $index: ${_items[index].subItems[currentIndexes[index]]}',
                          );
                        });
                      });
                }).toList(),
              ));
        });
  }
}

List<ExpandableItem> generateItems(int numberOfItems) {
  return List<ExpandableItem>.generate(numberOfItems, (int index) {
    return ExpandableItem(
        headerValue: 'Item $index',
        subItems: List<String>.generate(
          4,
          (int index) => 'subitem ${index + 1}',
        ));
  });
}
