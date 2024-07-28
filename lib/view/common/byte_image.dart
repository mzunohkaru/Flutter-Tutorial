import 'dart:typed_data';

import 'package:flutter/material.dart';

class ByteImage extends StatelessWidget {
  const ByteImage({super.key, required this.bytes});
  final Uint8List bytes;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        width: 60,
        height: 60,
        child: Align(
          alignment: Alignment.center,
          child: Image.memory(bytes),
        ),
      ),
    );
  }
}
