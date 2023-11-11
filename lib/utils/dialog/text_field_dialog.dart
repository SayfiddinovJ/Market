import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/data/local/storage_repository.dart';
import 'package:market/ui/widgets/global_textfield.dart';
import 'package:market/utils/extensions/extensions.dart';
import 'package:market/utils/formaters/letters_formatter.dart';

Future<void> showTextFieldDialog({
  required String message,
  required BuildContext context,
}) async {
  TextEditingController controller = TextEditingController();
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) => StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(message),
              15.ph,
              SizedBox(
                height: 50.h,
                child: GlobalTextField(
                  hintText: 'Do\'kon nomi',
                  controller: controller,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  textFormatter: OnlyLettersTextFormatter(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () async {
                debugPrint('Controller: ${controller.text}');
                await StorageRepository.putString('company', controller.text);
                if (context.mounted) {
                  Navigator.pop(context);
                }
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    ),
  );
}
