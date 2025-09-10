import 'package:flutter/material.dart';

class MoreMenuDialog {
  static void show(
    BuildContext context, {
    required List<MenuOption> options,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: const Text("Menu"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: options.map((option) {
              return ListTile(
                leading: Icon(option.icon),
                title: Text(option.label),
                onTap: () {
                  Navigator.pop(context); // close dialog
                  option.onTap(); // run the action
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

class MenuOption {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  MenuOption({
    required this.label,
    required this.icon,
    required this.onTap,
  });
}
