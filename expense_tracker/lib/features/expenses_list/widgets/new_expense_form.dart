import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class NewExpenseForm extends StatefulWidget {
  const NewExpenseForm({super.key});

  @override
  State<NewExpenseForm> createState() => _NewExpenseFormState();
}

class _NewExpenseFormState extends State<NewExpenseForm> {
  DateTime _selectedDate = DateTime.now();
  Category _selectedCategory = Category.values.first;
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _showDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime.parse('1970-01-01');
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  List<DropdownMenuItem> _categoriesAsDropdownItems() {
    return Category.values.map((category) {
      return DropdownMenuItem(
        value: category,
        child: Text(
          category.name.toUpperCase(),
        ),
      );
    }).toList();
  }

  void _changeSelectedCategory(category) {
    if (category != null) {
      setState(() {
        _selectedCategory = category;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    label: Text('Amount'),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(Expense.formatDate(_selectedDate)),
                    IconButton(
                      onPressed: _showDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: _categoriesAsDropdownItems(),
                onChanged: (value) => _changeSelectedCategory(value),
              ),
              const Spacer(),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Save expense'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
