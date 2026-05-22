import 'package:flutter/material.dart';
import 'package:mobeen/core/constants/app_colors.dart';
import 'package:sizer/sizer.dart';
import 'package:mobeen/core/widgets/loading_widget.dart';

extension ContextExtensions on BuildContext {
  // Snackbar
  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
      ),
    );
  }

  void showLoading() {
    LoadingWidgetOverlay().show(this);
  }

  void hideLoading() {
    LoadingWidgetOverlay().hide();
  }

  void showBottomSheet({required Widget widget, double? height, Color? color}) {
    showModalBottomSheet(
      context: this,
      useSafeArea: true,
      showDragHandle: true,
      isScrollControlled: true,
      clipBehavior: .hardEdge,
      builder: (context) => Container(
        padding: EdgeInsetsGeometry.symmetric(vertical: 8, horizontal: 16),
        height: height ?? 75.h,
        width: 100.w,
        color: color,
        child: widget,
      ),
    );
  }

  void showConfirmDialog({
    required String title,
    required String message,
    required VoidCallback onConfirm,
    String confirmTitle = "تأكيد",
    String cancelTitle = "تراجع",
    Color? confirmColor,
        Color? confirmColorText,

  }) {
    showDialog(
      context: this,
      builder: (dialogContext) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(title, textAlign: TextAlign.right),
        content: Text(message, textAlign: TextAlign.right),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(cancelTitle),
          ),
           ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  confirmColor ?? AppColors.primary,
              foregroundColor: confirmColorText ?? Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              Navigator.pop(dialogContext);
              onConfirm();
            },
            child: Text(confirmTitle),
          ),
        ],
      ),
    );
  }
}
