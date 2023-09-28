import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({
    super.key,
    required this.onImageSelected,
  });

  final void Function(File image) onImageSelected;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _image;

  void _takePicture() async {
    final imagePicker = ImagePicker();
    final takenImage =
        await imagePicker.pickImage(source: ImageSource.camera, maxWidth: 600);

    if (takenImage == null) {
      return;
    }

    setState(() {
      _image = File(takenImage.path);
    });
    widget.onImageSelected(_image!);
  }

  Widget get content {
    if (_image == null) {
      return TextButton.icon(
        onPressed: _takePicture,
        icon: const Icon(Icons.camera),
        label: const Text('Take a picture'),
      );
    }

    return GestureDetector(
      onTap: _takePicture,
      child: Image.file(
        _image!,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: try to replace with FormField<File>
    return Container(
      height: 250,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.9),
      ),
      child: content,
    );
  }
}
