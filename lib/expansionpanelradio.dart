import 'package:expandablelistexample/model/item.dart';
import 'package:flutter/material.dart';

class ExpansionPanelRadioDemo extends StatefulWidget {
  const ExpansionPanelRadioDemo({Key? key}) : super(key: key);

  @override
  _ExpansionPanelRadioDemoState createState() =>
      _ExpansionPanelRadioDemoState();
}

class _ExpansionPanelRadioDemoState extends State<ExpansionPanelRadioDemo> {
  final List<ExpandableItem> _items = generateItems(10);
  List<int> currentIndexesList = List.generate(10, (index) => -1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('ExpansionPanelRadio'),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          elevation: 1,
          expandedHeaderPadding: const EdgeInsets.all(0),
          children: _items.asMap().entries.map<ExpansionPanelRadio>((fentry) {
            final int index = fentry.key;
            ExpandableItem indexvalue = fentry.value;

            return ExpansionPanelRadio(
              value: index, // Use a unique value for each item
              canTapOnHeader: true,
              headerBuilder: (context, isExpanded) {
                return ListTile(
                  title: Text(indexvalue.headerValue),
                );
              },
              body: Column(
                children: indexvalue.subItems.asMap().entries.map((entry) {
                  final int subIndex = entry.key;
                  final String subItem = entry.value;

                  return RadioListTile<int>(
                    controlAffinity: ListTileControlAffinity.trailing,
                    title: Text(subItem),
                    value: subIndex,
                    groupValue: currentIndexesList[index],
                    onChanged: (value) {
                      setState(() {
                        currentIndexesList[index] = value!;
                      });
                    },
                  );
                }).toList(),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

List<ExpandableItem> generateItems(int numberOfItems) {
  return List<ExpandableItem>.generate(numberOfItems, (int index) {
    return ExpandableItem(
      headerValue: 'Item $index',
      subItems: List<String>.generate(
        4,
        (int index) => 'subitem ${index + 1}',
      ),
    );
  });
}
