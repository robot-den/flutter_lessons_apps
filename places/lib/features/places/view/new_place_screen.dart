import 'package:flutter/material.dart';
import 'package:places/models/models.dart';

class NewPlaceScreen extends StatefulWidget {
  const NewPlaceScreen({super.key});

  @override
  State<NewPlaceScreen> createState() => _NewPlaceScreenState();
}

class _NewPlaceScreenState extends State<NewPlaceScreen> {
  String _newPlaceTitle = '';
  final _formKey = GlobalKey<FormState>();

  String? validateTitle(value) {
    if (value == null) {
      return 'Title is required';
    }

    final title = value.trim();
    if (title.isEmpty || title.length <= 1 || title.length > 50) {
      return 'Title should be between 1 and 50 characters';
    }

    return null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final place = Place(id: DateTime.now().toString(), title: _newPlaceTitle);

      // TODO: you stopped here trying to update provider
      // you have to convert this widget to support this provider
      // you have to implement provider that allows method
      // you have to convert list widget to support provider
      // you have to watch in list widget if something changed in provider
      // provider.savePlace(place);

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New place')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Title'),
                ),
                validator: validateTitle,
                onSaved: (newValue) => _newPlaceTitle = newValue!,
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: const Text('Add'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
