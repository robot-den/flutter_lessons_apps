import 'package:flutter/material.dart';
import 'package:groceries/models/models.dart';

class GroceriesList extends StatelessWidget {
  const GroceriesList({super.key, required this.groceries});

  final List<Grocery> groceries;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: groceries.length,
      itemBuilder: (context, index) {
        final grocery = groceries[index];
        const textStyle = TextStyle(fontSize: 16);

        return Card(
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
        );
      },
    );
  }
}
