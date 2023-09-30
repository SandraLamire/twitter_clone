import 'package:flutter/material.dart';
import '../components/buttons_tweet_bar.dart';
import 'class_citation.dart';


class CitationCard extends StatelessWidget {
  final Citation citation;

  const CitationCard(this.citation, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          Text(
            citation.infos.personnage,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(citation.citation),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: ButtonTweetBar(),
          ),
        ],
      ),
    );
  }
}