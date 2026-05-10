import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UploadedFileWidget extends ConsumerWidget {
  const UploadedFileWidget({
    super.key,
    required this.fileName,
    required this.fileSize,
    required this.closeTapped
  });

  final String fileName;
  final int fileSize;
  final Function(String) closeTapped;

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[300],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(Icons.document_scanner_outlined),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: .center,
              crossAxisAlignment: .start,
              children: [Text(fileName), Text("20 MB")],
            ),
            Spacer(),
            IconButton(onPressed: () {
              closeTapped(fileName);
            }, icon: Icon(Icons.close)),
          ],
        ),
      ),
    );
  }
}
