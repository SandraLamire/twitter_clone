import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TopNavigationTwitter extends StatelessWidget {
  const TopNavigationTwitter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(0xFF,0x58,0xB0,0xF0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: (){}, icon:const Icon(Icons.edit,color: Colors.white),),
            TextButton(
              onPressed: () {
                // Utiliser GoRouter pour naviguer vers la page de connexion
                GoRouter.of(context).go('/');
              },
              child: const Text(
                "Accueil",
                style: TextStyle(color: Colors.white),
              ),
            ),
            IconButton(onPressed: (){}, icon:const Icon(Icons.search,color: Colors.white),),
          ],),
      ),
    );
  }
}