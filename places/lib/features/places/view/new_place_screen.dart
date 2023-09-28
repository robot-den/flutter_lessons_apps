import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:places/features/places/widgets/widgets.dart';
import 'package:places/models/models.dart';
import 'package:places/providers/places_provider.dart';

class NewPlaceScreen extends ConsumerStatefulWidget {
  const NewPlaceScreen({super.key});

  @override
  ConsumerState<NewPlaceScreen> createState() => _NewPlaceScreenState();
}

class _NewPlaceScreenState extends ConsumerState<NewPlaceScreen> {
  String _newPlaceTitle = '';
  File? _newPlaceimage;
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
    if (_formKey.currentState!.validate() && _newPlaceimage != null) {
      _formKey.currentState!.save();

      final place = Place(title: _newPlaceTitle, image: _newPlaceimage!);
      ref.read(placesProvider.notifier).savePlace(place);

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New place')),
      body: SingleChildScrollView(
        child: Padding(
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
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                  validator: validateTitle,
                  onSaved: (newValue) => _newPlaceTitle = newValue!,
                ),
                const SizedBox(height: 12),
                ImageInput(onImageSelected: (img) => _newPlaceimage = img),
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
      ),
    );
  }
}
