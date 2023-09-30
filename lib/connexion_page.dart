import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:twitter_clone_api/classes/class_from_connexion.dart';


class ConnexionPage extends StatelessWidget {

  const ConnexionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text("Connexion à Twitter Clone",
          style: TextStyle(color: Colors.white),),
          centerTitle: true, // Centrer le titre horizontalement.
          backgroundColor:Colors.lightBlue,
      ),
      body: FormConnexion(onConnexionSuccess: () {
        // Utiliser GoRouter pour naviguer vers la page Twitter lorsque la connexion réussit
        GoRouter.of(context).go('/twitter_page');
      })
    );
  }
}
