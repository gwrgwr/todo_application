import 'package:flutter/material.dart';

class MySnackbar {
  static SnackBar mySnackbar() {
    return SnackBar(
      content: const Text(
        'Tarefa adicionada com sucesso !',
        style: TextStyle(
        ),
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
