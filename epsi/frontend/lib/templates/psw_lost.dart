import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'main.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, // Masque le "debug banner"
    home: CreateAccountPage(), // Lancer la page d'inscription
  ));
}

class Pswlost extends StatelessWidget {
  const Pswlost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Permet de rendre le contenu défilable
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center, // Centre le contenu horizontalement
            children: [
              // Centre le logo en haut de l'écran
              Center(
                child: Image.asset(
                  'assets/img/logo_epsi.jpg', // Chemin du logo
                  width: 100,
                  height: 100,
                ),
              ),
              const SizedBox(height: 20), // Espace entre le logo et le texte


              const Text(
                'Mot de passe oublié ?',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                textAlign: TextAlign.center,
                'Ne vous inquiété pas ! ça arrive.\nVeuillez renseigner l\'adresse mail associée à votre compte.',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 20), // Espace entre le titre et les champs de saisie

              // Champ pour l'email
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Email',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Entrez votre email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 40),

              ElevatedButton(
                onPressed: () {
                  // Logique pour le bouton de création de compte
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ConnexionPage()), // Remplace l'écran actuel par la page d'accueil
                  );
                },
                style: ElevatedButton.styleFrom(
                  overlayColor: Colors.purple[200], // Couleur survol
                  backgroundColor: Colors.deepPurple, // Fond
                  foregroundColor: Colors.white, // Texte
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), // Coins arrondis
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50), // Taille du bouton
                  side: const BorderSide(color: Colors.deepPurple, width: 1), // Bordure
                ),
                child: const Text(
                  'Connexion',
                  style: TextStyle(
                    fontWeight: FontWeight.bold, // Texte en gras
                    fontSize: 16, // Taille du texte
                  ),
                ),
              ),
              const SizedBox(height: 20), // Espacement avant le texte du lien

              // Texte "Vous avez déjà un compte ?" avec un lien
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  children: [
                    const TextSpan(
                      text: 'Vous n\'avez pas de compte ? ',
                    ),
                    TextSpan(
                      text: 'Créer un compte',
                      style: TextStyle(
                        color: Colors.deepPurple, // Couleur du lien
                        decoration: TextDecoration.underline, // Souligner le texte
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Navigation vers la page de connexion
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CreateAccountPage()),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
