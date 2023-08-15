import 'package:flutter/material.dart';
import 'package:google_translation_example/api/translation_api.dart';
import 'package:google_translation_example/utils/translations.dart';

class TranslationWidget extends StatefulWidget {
  final String message;
  
  final String fromLanguage;
  final String toLanguage;
  final Widget Function(String translation) builder;

  const TranslationWidget({
    required this.message,
    
    required this.fromLanguage,
    required this.toLanguage,
    required this.builder,
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TranslationWidgetState createState() => _TranslationWidgetState();
}

class _TranslationWidgetState extends State<TranslationWidget> {
  late String translation = '';
  late String fromLanguageCode='';
  

  @override
  Widget build(BuildContext context) {

    final fromLanguageCode = Translations.getLanguageCode(widget.fromLanguage);
    final toLanguageCode = Translations.getLanguageCode(widget.toLanguage);

    return FutureBuilder(
      //future: TranslationApi.translate(widget.message, toLanguageCode),
      future: TranslationApi.translate2(
      widget.message, fromLanguageCode, toLanguageCode),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return buildWaiting();
          default:
            if (snapshot.hasError) {
              translation = 'Could not translate due to Network problems';
            } else {
              translation = snapshot.data;
            }
            return widget.builder(translation);
        }
      },
    );
  }

  Widget buildWaiting() =>
      // ignore: unnecessary_null_comparison
      translation == null ? Container() : widget.builder(translation);
}
