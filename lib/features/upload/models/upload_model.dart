class UploadModel {
  final List<Field> fields;
  final List<Document> documents;
  final List<MerchantType> merchantTypes;

  UploadModel({
    required this.fields,
    required this.documents,
    required this.merchantTypes,
  });

  factory UploadModel.fromJson(Map<String, dynamic> json) {
    return UploadModel(
      fields: (json["fields"] as List).map((e) => Field.fromJson(e)).toList(),
      documents: (json["documents"] as List)
          .map((d) => Document.fromJson(d))
          .toList(),
      merchantTypes: (json["merchantTypes"] as List)
          .map((m) => MerchantType.fromJson(m))
          .toList(),
    );
  }
}

class Field {
  final String fieldKey;
  final String labelEn;
  final String descriptionEn;
  final String description;
  final String type;
  final int length;

  Field({
    required this.fieldKey,
    required this.labelEn,
    required this.descriptionEn,
    required this.description,
    required this.type,
    required this.length,
  });

  factory Field.fromJson(Map<String, dynamic> json) {
    return Field(
      fieldKey: json["fieldKey"],
      labelEn: json["labelEn"],
      descriptionEn: json["descriptionEn"],
      description: json["description"],
      type: json["type"],
     length: json["length"] ?? 0,
    );
  }
}

class Document {
  final String docKey;
  final String nameEn;
  final String name;
  final bool multiple;

  Document({
    required this.docKey,
    required this.nameEn,
    required this.name,
    required this.multiple,
  });

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      docKey: json["docKey"],
      nameEn: json["nameEn"],
      name: json["name"],
      multiple: json["multiple"],
    );
  }
}

class MerchantType {
  final String typeCode;
  final String nameEn;
  final String name;
  final String descriptionEn;
  final String description;
  final String? iconUrl;
  final List<MerchantTypeField> fields;
  final List<MerchantTypeDocument> documents;

  MerchantType({
    required this.typeCode,
    required this.nameEn,
    required this.name,
    required this.descriptionEn,
    required this.description,
    this.iconUrl,
    required this.fields,
    required this.documents,
  });

  factory MerchantType.fromJson(Map<String, dynamic> json) {
    return MerchantType(
      typeCode: json["typeCode"],
      nameEn: json["nameEn"],
      name: json["name"],
      descriptionEn: json["descriptionEn"],
      description: json["description"],
      iconUrl: json["iconUrl"],
      fields: (json["fields"] as List)
      .map((e) => MerchantTypeField.fromJson(e)).toList(),
      documents: (json["documents"] as List)
      .map((e) => MerchantTypeDocument.fromJson(e)).toList(),
    );
  }
}

class MerchantTypeField {
  final String fieldKey;
  final bool required;

  MerchantTypeField({required this.fieldKey, required this.required});

  factory MerchantTypeField.fromJson(Map<String, dynamic> json) {
    return MerchantTypeField(fieldKey: json["fieldKey"], required: json["required"]);
  }

}

class MerchantTypeDocument {
  final String docKey;
  final bool required;

  MerchantTypeDocument({required this.docKey, required this.required});
 
  factory MerchantTypeDocument.fromJson(Map<String, dynamic> json) {
    return MerchantTypeDocument(docKey: json["docKey"], required: json["required"]);
  }

}
