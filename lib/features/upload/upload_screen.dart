import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_task_app/features/upload/upload_controller.dart';

class UploadScreen extends ConsumerWidget {

 UploadScreen({super.key});
 final List<Widget> widgets = [];

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              ...ref.watch(providerHardLevel).documents,
              ...ref.watch(providerHardLevel).fields
              ]),
          ),
        ),
      ),
    );
  }
}
