import 'package:flutter/material.dart';
import 'classes/class_citation_card.dart';
import 'components/top_nav_bar.dart';
import 'components/bottom_nav_bar.dart';
import 'classes/class_citation.dart';
import 'services/api_service.dart';


class TwitterPage extends StatefulWidget {
  const TwitterPage(String email, {Key? key}) : super(key: key);

  @override
  _TwitterPageState createState() => _TwitterPageState();
}

class _TwitterPageState extends State<TwitterPage> {
  // Variable d'état pour stocker les citations
  List<Citation> citations = [];

  @override
  void initState() {
    super.initState();
    // Charger les 10 premières citations à l'ouverture de la page
    _refreshCitations();
  }

  Future<void> _refreshCitations() async {
    try {
      final List<Citation> randomCitations = await ApiService.fetchRandomCitations(10);

      setState(() {
        citations = randomCitations;
      });
    } catch (error) {
      print("Erreur lors du rafraîchissement des citations : $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Twitter Clone",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Column(
        children: [
          const TopNavigationTwitter(),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refreshCitations,
              child: ListView.builder(
                itemCount: citations.length,
                itemBuilder: (context, index) => CitationCard(citations[index]),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _refreshCitations,
            child: const Text('Rafraîchir'),
          ),
        ], // Children of Column
      ),
      bottomNavigationBar: const BottomNavigationTwitter(),
    );
  }  // Widget build
}  // class _TwitterPageState
