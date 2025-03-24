import 'package:epsi/templates/home_page.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart'; // Pour le gestionnaire d'événements TapGestureRecognizer
import 'package:quickalert/quickalert.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, // Masque le "debug banner"
    home: CreateAccountPage(), // Lancer la page d'inscription
  ));
}

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

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

              // Centre le texte "Créer un compte"
              const Text(
                'Créer un compte',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20), // Espace entre le titre et les champs de saisie

              // Champ pour le nom de l'étudiant
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Nom d\'utilisateur',
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
                  labelText: 'Nom de l\'étudiant',
                  hintText: 'Entrez votre nom complet',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 20), // Espace entre les champs de saisie

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
              const SizedBox(height: 20),

              // Champ pour le mot de passe
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Mot de passe',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                obscureText: true, // Cache le texte pour le mot de passe
                decoration: InputDecoration(
                  labelText: 'Mot de passe',
                  hintText: 'Entrez votre mot de passe',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 20),

              // Champ pour confirmer le mot de passe
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Confirmation du mot de passe',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                obscureText: true, // Cache le texte pour le mot de passe
                decoration: InputDecoration(
                  labelText: 'Confirmer le mot de passe',
                  hintText: 'Confirmez votre mot de passe',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 30), // Espace après les champs de saisie

              ElevatedButton(
                onPressed: () {
                  // Logique pour le bouton de création de compte
                  if (kDebugMode) {
                    print("Compte créé");
                  }
                  // Affichage de la boîte de dialogue QuickAlert
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.success,
                    text: 'Compte créé avec succès !',
                    autoCloseDuration: const Duration(seconds: 3), // Fermeture automatique après 2 secondes
                  );

                  // Rediriger vers la page d'accueil après l'alerte
                  Future.delayed(const Duration(seconds: 3), () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple, // Fond
                  foregroundColor: Colors.white, // Texte
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), // Coins arrondis
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50), // Taille du bouton
                  side: const BorderSide(color: Colors.deepPurple, width: 1), // Bordure
                ),
                child: const Text(
                  'Créer le compte',
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
                      text: 'Vous avez déjà un compte ? ',
                    ),
                    TextSpan(
                      text: 'Se connecter',
                      style: TextStyle(
                        color: Colors.deepPurple, // Couleur du lien
                        decoration: TextDecoration.underline, // Souligner le texte
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Navigation vers la page de connexion
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ConnexionPage()),
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

class ConnexionPage {
}
