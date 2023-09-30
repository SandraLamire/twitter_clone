// format du JSON récupéré avec https://kaamelott.chaudie.re/api/random
// {"status":1,"citation":{"citation":"Je suis un mis\u00e9rable !","infos":{"auteur":"Alexandre Astier","acteur":"Nicolas Gabion","personnage":"Bohort","saison":"Livre III","episode":"Arthur sensei"}}}

class FutureTweet {
  int status;
  List<Citation> citation;

  FutureTweet({
    required this.status,
    required this.citation,
  });

  factory FutureTweet.fromJson(Map<String, dynamic> json) {
    final List<dynamic> citationJson = json['citation'] as List<dynamic>;
    final List<Citation> citations = citationJson
        .map((citationJson) => Citation.fromJson(citationJson as Map<String, dynamic>))
        .toList();

    return FutureTweet(
      status: json['status'] as int,
      citation: citations,
    );
  }
}

class Citation {
  final String citation;
  final Infos infos;

  Citation({
    required this.citation,
    required this.infos,
  });

  factory Citation.fromJson(Map<String, dynamic> json) {
    return Citation(
      citation: json['citation'] as String,
      infos: Infos.fromJson(json['infos'] as Map<String, dynamic>),
    );
  }
}

// en commentaire : autres attributs récupérables si besoin
class Infos {
  // String auteur;
  //String acteur;
  String personnage;
  //String saison;
  //String episode;

  Infos({
    // required this.auteur,
    //required this.acteur,
    required this.personnage,
    //required this.saison,
    //required this.episode,
  });

  factory Infos.fromJson(Map<String, dynamic> json) {
    return Infos(
      // auteur: json['auteur'] as String,
      //acteur: json['acteur'] as String,
      personnage: json['personnage'] as String,
      //saison: json['saison'] as String,
      //episode: json['episode'] as String,
    );
  }
}