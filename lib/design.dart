import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:translate_app/language_dialog.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(context) {
    final localizationDelegate = LocalizedApp.of(context).delegate;
    return Scaffold(
        appBar: AppBar(
          title: Text(translate('appbar.title')),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                translate('language.selection.message'),
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    _onActionSheetPress(context);
                  },
                  child: Text(translate('language.selected_message', args: {
                    'language': translate(
                        'language.name.${localizationDelegate.currentLocale.languageCode}')
                  })))
            ],
          ),
        ));
  }

  void _onActionSheetPress(BuildContext context) {
    showDemoActionSheet(
      context: context,
      child: CupertinoActionSheet(
        title: Text(translate('language.selection.title')),
        message: Text(translate('language.selection.message')),
        actions: <Widget>[
          CupertinoActionSheetAction(
            child: Text(translate('language.name.en')),
            onPressed: () => Navigator.pop(context, 'en_US'),
          ),
          CupertinoActionSheetAction(
            child: Text(translate('language.name.es')),
            onPressed: () => Navigator.pop(context, 'es'),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () => Navigator.pop(context, null),
            child: const Text('cancel')),
      ),
    );
  }

  void showDemoActionSheet(
      {required BuildContext context, required Widget child}) {
    showCupertinoModalPopup<String>(
        context: context,
        builder: (BuildContext context) => child).then((String? value) {
      if (value != null) changeLocale(context, value);
    });
  }
}
