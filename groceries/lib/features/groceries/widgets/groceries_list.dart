import 'package:flutter/material.dart';
import 'package:groceries/models/models.dart';

class GroceriesList extends StatelessWidget {
  const GroceriesList({
    super.key,
    required this.groceries,
    required this.onRemoved,
  });

  final List<Grocery> groceries;
  final Function(Grocery grocery) onRemoved;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: groceries.length,
      itemBuilder: (context, index) {
        final grocery = groceries[index];
        const textStyle = TextStyle(fontSize: 16);

        return Dismissible(
          onDismissed: (direction) => onRemoved(grocery),
          direction: DismissDirection.endToStart,
          background: Container(
            color: Colors.red,
            child: const Padding(
              padding: EdgeInsets.only(right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.delete_forever),
                ],
              ),
            ),
          ),
          key: ValueKey(grocery.id),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                children: [
                  Icon(
                    Icons.square,
                    color: grocery.category.color,
                  ),
                  const SizedBox(width: 20),
                  Text(grocery.name, style: textStyle),
                  const Spacer(),
                  Text(grocery.quantity.toString(), style: textStyle),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
