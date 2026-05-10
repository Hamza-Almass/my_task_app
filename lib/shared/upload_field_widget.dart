import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:my_task_app/features/upload/uploaded_file_controller.dart';
import 'package:my_task_app/features/upload/uploaded_file_widget.dart';

class UploadFieldWidget extends ConsumerWidget {
  UploadFieldWidget({
    super.key,
    required this.title,
    this.subtitle,
    required this.allowMultiple,
  });

  final String title;
  final String? subtitle;
  final bool allowMultiple;

  final uploadFileControllerHighLevel = ChangeNotifierProvider(
    (ref) => UploadedFileController(),
  );

  @override
  Widget build(BuildContext context, ref) {
    return ref.watch(uploadFileControllerHighLevel).files.isNotEmpty
        ? Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
              children: [
                ...ref
                    .watch(uploadFileControllerHighLevel)
                    .files
                    .map(
                      (e) =>
                          UploadedFileWidget(fileName: e.name, fileSize: e.size, closeTapped: (fileName){
                            ref.read(uploadFileControllerHighLevel).deleteFile(fileName);
                          },),
                    ),
              ],
            ),
        )
        : Column(
            crossAxisAlignment: .start,
            children: [
              SizedBox(height: 10),
              Text(title),
              SizedBox(height: 8),
              subtitle == null
                  ? SizedBox()
                  : Text(
                      subtitle ?? "",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),

              SizedBox(height: subtitle != null ? 10 : 0),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 0.5, color: Colors.grey),
                ),
                child: Column(
                  spacing: 10,
                  mainAxisAlignment: .center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color.fromARGB(255, 242, 221, 188),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            openSelectFile(allowMultiple, ref);
                          },
                          icon: Icon(Icons.upload),
                        ),
                      ],
                    ),
                    Text("Click here to upload files"),
                    Text("Supported: images,PDF,Excel (Max 10MB each)"),
                  ],
                ),
              ),
            ],
          );
  }

  Future<void> openSelectFile(bool allowMultiple, WidgetRef ref) async {
    final result = await FilePicker.pickFiles(
      allowMultiple: allowMultiple,
      type: FileType.custom, // or FileType.any
      allowedExtensions: [
        'jpg', 'jpeg', 'png', // images
        'pdf', // pdf
        'xls', 'xlsx', // excel
      ],
    );

    if (result != null) {
      final files = result.files.toList();

      files.forEach((file) {
        ref.read(uploadFileControllerHighLevel).addFile(file);
      });
    } else {
      print("User canceled");
    }
  }
}
