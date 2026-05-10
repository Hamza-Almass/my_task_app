import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:my_task_app/features/upload/models/upload_model.dart';
import 'package:my_task_app/shared/input_field_widget.dart';
import 'package:my_task_app/shared/upload_field_widget.dart';

final providerHardLevel = ChangeNotifierProvider((ref) => UploadController());

class UploadController extends ChangeNotifier {

  List<InputFieldWidget> fields = [];
  List<UploadFieldWidget> documents = [];

  UploadController(){
    loadJson();
  }

  Future<void> loadJson() async {
    final String response = await rootBundle.loadString("assets/sample.json");
    final Map<String, dynamic> data = json.decode(response);
    final uploadModel = UploadModel.fromJson(data);
    prepareItems(uploadModel);
    notifyListeners();
  }

  void prepareItems(UploadModel model) {
    model.documents.forEach((document) {
      final item = model.documents.firstWhere(
        (element) => element.docKey == document.docKey,
      );
      documents.add(UploadFieldWidget(title: item.nameEn,
       allowMultiple: item.multiple));
    });


    model.fields.forEach((field) {
      final item = model.fields.firstWhere(
        (element) => element.fieldKey == field.fieldKey,
      );
      fields.add(InputFieldWidget(title: item.labelEn, hint: item.descriptionEn));
    });

    notifyListeners();
  }
}
