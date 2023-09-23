import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:groceries/models/models.dart';
import 'package:groceries/repositories/grocery/groceries_repository.dart';

class NewGroceryScreen extends StatefulWidget {
  const NewGroceryScreen({super.key});

  @override
  State<NewGroceryScreen> createState() => _NewGroceryScreenState();
}

class _NewGroceryScreenState extends State<NewGroceryScreen> {
  final repo = GetIt.I<AbstractGroceriesRepository>();
  List<Category> categories = [];
  final _formKey = GlobalKey<FormState>();

  String _newGroceryName = '';
  int _newGroceryQuantity = 1;
  Category _newGroceryCategory = otherCategory;

  @override
  void initState() {
    super.initState();

    categories = repo.categories();
  }

  String? validateName(value) {
    if (value == null) {
      return 'Name is required';
    }

    final name = value.trim();
    if (name.isEmpty || name.length <= 1 || name.length > 50) {
      return 'Name should be between 1 and 50 characters';
    }

    return null;
  }

  String? validateQuantity(value) {
    if (value == null || value.trim().isEmpty) {
      return 'Quantity is required';
    }

    final quantity = int.tryParse(value);
    if (quantity == null) {
      return 'Quantity is required';
    }

    if (quantity < 1 || quantity > 100) {
      return 'Quantity should be between 1 and 100';
    }

    return null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final grocery = Grocery(
        id: DateTime.now().toString(),
        name: _newGroceryName,
        quantity: _newGroceryQuantity,
        category: _newGroceryCategory,
      );
      repo.saveGrocery(grocery);
      // Navigator.of(context).pop(true);
    }
  }

  void _resetForm() {
    _formKey.currentState!.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New grocery'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
                validator: validateName,
                onSaved: (newValue) => _newGroceryName = newValue!,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        label: Text('Quantity'),
                      ),
                      initialValue: '1',
                      validator: validateQuantity,
                      onSaved: (newValue) =>
                          _newGroceryQuantity = int.parse(newValue!),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: _newGroceryCategory,
                      items: [
                        for (final category in categories)
                          DropdownMenuItem(
                            value: category,
                            child: Row(
                              children: [
                                Icon(Icons.square, color: category.color),
                                const SizedBox(width: 6),
                                Text(category.name)
                              ],
                            ),
                          ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _newGroceryCategory = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _resetForm,
                    child: const Text('Reset'),
                  ),
                  const SizedBox(width: 6),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: const Text('Add'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
