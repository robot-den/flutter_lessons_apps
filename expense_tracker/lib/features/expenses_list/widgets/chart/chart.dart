import 'package:expense_tracker/features/expenses_list/widgets/chart/chart_bar.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.totalsByCategory});

  final Map<Category, double> totalsByCategory;

  double get maxCategoryTotal {
    double max = 0;

    totalsByCategory.forEach((_, value) {
      if (value > max) {
        max = value;
      }
    });

    return max;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.3),
            Theme.of(context).colorScheme.primary.withOpacity(0.0),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: totalsByCategory.values.map((categoryTotal) {
                return ChartBar(fill: categoryTotal / maxCategoryTotal);
              }).toList(),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: totalsByCategory.entries.map((e) {
              return Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Icon(
                  categoryToIcon[e.key],
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
                ),
              ));
            }).toList(),
          ),
        ],
      ),
    );
  }
}
