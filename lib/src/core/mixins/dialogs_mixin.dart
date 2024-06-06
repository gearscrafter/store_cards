import 'package:flutter/material.dart';

import '../commons/widgets/alert_dialog_widget.dart';

mixin DialogsMixin {
  void alertDialog({
    required BuildContext context,
    required String description,
    required Function callback,
    required String title,
  }) {
    showDialog(
        context: context,
        builder: (context) => AlertDialogWidget(
              description: description,
              callback: callback,
              title: title,
            ));
  }
}
