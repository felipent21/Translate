import 'dart:convert';
import 'package:html_unescape/html_unescape.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:translator/translator.dart';

class TranslationApi {
  static const _apiKey = 'AIzaSyDmf-zlsUHhh_9kgfAfXfsUdGqWmiiYSQU';

 /*
  static Future<String> translate(String message, String toLanguageCode) async {
    final response = await http.post(
      'https://translation.googleapis.com/language/translate/v2?target=$toLanguageCode&key=$_apiKey&q=$message' as Uri,
    );
*/


static Future<String> translate(String message, String toLanguageCode) async {
    final uri = Uri.parse(
      'https://translation.googleapis.com/language/translate/v2?target=$toLanguageCode&key=$_apiKey&q=$message',
    );
  
    final response = await http.post(uri);

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      final translations = body['data']['translations'] as List;
      final translation = translations.first;

      return HtmlUnescape().convert(translation['translatedText']);
    } 
    
    else {
      throw Exception();
    }
    
  }

  

  static Future<String> translate2(
      String message, String fromLanguageCode, String toLanguageCode) async {
    final translation = await GoogleTranslator().translate(
      message,
      from: fromLanguageCode,
      to: toLanguageCode,
    );

    return translation.text;
  }
}