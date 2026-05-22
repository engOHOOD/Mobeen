
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class ImagePickerWidget extends StatelessWidget {
  const ImagePickerWidget({super.key, this.onSelected});
  final void Function(String?)? onSelected;

  @override
  Widget build(BuildContext context) {
    String? pathImageSelect;
    return StatefulBuilder(
      builder: (context, setState) => InkWell(
        onTap: () async {
          final imagePicker = ImagePicker();
          final image = await imagePicker.pickImage(source: .gallery);
          if (image != null) {
            pathImageSelect = image.path;
            setState(() {});
          }

          if (onSelected != null) {
            onSelected!(pathImageSelect!);
          }
        },
        child: Container(
          color: Colors.amber,
          height: 25.sw,
          width: 25.sw,
          child: pathImageSelect != null
              ? Image.file(File(pathImageSelect!), fit: .cover)
              : Icon(Icons.upload),
        ),
      ),
    );
  }
}
