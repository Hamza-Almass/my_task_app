import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UploadedFileController extends ChangeNotifier {

  List<PlatformFile> files = [];

  void addFile(PlatformFile file) {
    files.add(file);
    notifyListeners();
  }

  void deleteFile(String fileName) {
    var item = files.firstWhere((e) => e.name == fileName);
    files.remove(item);
    notifyListeners();
  }

  void deleteAll() {
    files = [];
    notifyListeners();
  }
}