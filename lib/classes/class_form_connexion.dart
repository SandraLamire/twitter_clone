import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class FormConnexion extends StatefulWidget {
  // Callback pour la connexion réussie
  final VoidCallback onConnexionSuccess;

  const FormConnexion({
    super.key,
    // Ajouter pour avoir accès au callback connexion success
    required this.onConnexionSuccess,
  });

  @override
  State<FormConnexion> createState() => _FormConnexionState();
}

class _FormConnexionState extends State<FormConnexion> {
  final _keyForm = GlobalKey<FormState>();
  final textEditContID = TextEditingController();
  final textEditContPWD = TextEditingController();
  // Mettre le Switch sur non par défaut
  var switchRemember = false;

  @override
  void initState() {
    super.initState();
    // Charger les informations de connexion sauvegardées lors du démarrage de la page
    loadSavedCredentials();
  }

  void loadSavedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    final savedUsername = prefs.getString('username');
    final savedPassword = prefs.getString('password');

    // Si un nom d'utilisateur a été sauvegardé, remplir le champ d'identifiant
    if (savedUsername != null) {
      textEditContID.text = savedUsername;
    }

    // Si un mot de passe a été sauvegardé, remplir le champ de mot de passe
    if (savedPassword != null) {
      textEditContPWD.text = savedPassword;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _keyForm,
      child:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: textEditContID,
              decoration: const InputDecoration(hintText: "Identifiant (e-mail)"),
              validator: (val){
                if(val == null || val.isEmpty){
                  return "Veuillez remplir le champ";
                }
                if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z.]{2,6}$").hasMatch(val)){
                  return "Vérifier le format (ex: john@kennedy.gov)";
                }
                return null;
              },
            ),
            TextFormField(
              controller: textEditContPWD,
              decoration: const InputDecoration(hintText: "Mot de passe"),
              // Masquer le mot de passe
              obscureText: true,
              validator: (val){
                if(val == null || val.isEmpty){
                  return "Veuillez remplir le champ";
                }
                return null;
              },
            ),
            SwitchListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: switchRemember,
              onChanged: (val) async {
                setState(() {
                  // Mettre à jour l'état du switch
                  switchRemember = val;
                });
                if (val) {
                  // Utilisateur a activé "Se souvenir de moi", stocker l'identifiant et le mot de passe
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setString('username', textEditContID.text);
                  await prefs.setString('password', textEditContPWD.text);
                } else {
                  // Utilisateur a désactivé "Se souvenir de moi", supprimer l'identifiant et le mot de passe
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.remove('username');
                  await prefs.remove('password');
                }
              },
              title: const Text("Mémoriser mes informations"),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton.icon(
                  onPressed: (){
                    // Bandeau de "Bienvenu emailSaisi" en bas de la twitter_page
                    if(_keyForm.currentState?.validate() == true){
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text("Bienvenu ${textEditContID.text}")
                          )
                      );
                      // Appeller le callback pour la connexion réussie
                      widget.onConnexionSuccess();
                    }
                  }, icon: const Icon(Icons.login
              ),
                  label: const Text("Connexion")
              ),
            )
          ], // Children of Column
        ),
      ),
    );
  } // Widget build
}  // class _FormConnexionState