import 'package:flutter/material.dart';
import 'package:google_translation_example/utils/translations.dart';

class DropDownWidget extends StatelessWidget {
  final String  value;
  final ValueChanged<String?> onChangedLanguage;

  const DropDownWidget({
    required this.value,
    required this.onChangedLanguage,
    //required Key key,
     Key? key, // Agrega el parámetro Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = Translations.languages
        .map<DropdownMenuItem<String>>(
            (String value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ))
        .toList();

    return DropdownButton<String>(
      value: value,
      icon: const Icon(Icons.expand_more, color: Colors.grey),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Color.fromARGB(255, 5, 5, 5)),
      onChanged: onChangedLanguage,
      items: items,
    );
  }
}