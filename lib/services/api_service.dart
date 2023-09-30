import 'dart:convert';
import 'package:http/http.dart';

import 'package:twitter_clone_api/classes/class_citation.dart';

class ApiService {
  static Future<List<Citation>> fetchRandomCitations(int count) async {
    final List<Citation> randomCitations = [];

    for (int i = 0; i < count; i++) {
      final response = await get(Uri.parse('https://kaamelott.chaudie.re/api/random'));

      if (response.statusCode == 200) {
        final dynamic jsonData = json.decode(response.body);

        if (jsonData['status'] == 1) {
          final Citation citation = Citation.fromJson(jsonData['citation']);
          randomCitations.add(citation);
        }
      }
    }

    return randomCitations;
  }
}

// format du JSON récupéré avec https://kaamelott.chaudie.re/api/random
// {"status":1,"citation":{"citation":"Je suis un mis\u00e9rable !","infos":{"auteur":"Alexandre Astier","acteur":"Nicolas Gabion","personnage":"Bohort","saison":"Livre III","episode":"Arthur sensei"}}}
// tranformé en objet Dart pour créer la classe Citation grâce à https://app.quicktype.io/