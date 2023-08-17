import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class LanguageDialog extends StatefulWidget {
  const LanguageDialog({super.key});

  @override
  State<LanguageDialog> createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<LanguageDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(translate('language.dialog_title')),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(translate('language.name.en')),
            onTap: () {
              changeLocale(context, const Locale('en_US'));
              setState(() {});
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(translate('language.name.es')),
            onTap: () {
              changeLocale(context, const Locale('es'));
              setState(() {});
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

  void changeLocale(BuildContext context, Locale locale) {
    var delegate = LocalizedApp.of(context).delegate;
    delegate.changeLocale(locale);
  }
}
