import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDocs extends StatelessWidget {
  const MyDocs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove back button
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Guide',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF4A2A82), width: 2),
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/img/logo_epsi.jpg',
                width: 40,
                height: 40,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const CircleAvatar(
                    backgroundColor: Color(0xFF4A2A82),
                    radius: 20,
                    child: Icon(Icons.person, color: Colors.white),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Documents essentiels section
              const Text(
                'Documents essentiels',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              
              _buildGuideCard(
                title: 'Assurance maladie & Sécurité sociale',
                description: 'Informations sur la carte vitale, l\'affiliation à la sécurité sociale et les démarches à suivre pour les étudiants français et internationaux.',
                imageUrl: 'assets/img/securite_sociale.jpg',
                onTap: () async {
                  final Uri url = Uri.parse('https://www.ameli.fr/assure/droits-demarches/etudes-stages/etudiant');
                  if (!await launchUrl(
                    url,
                    mode: LaunchMode.externalApplication,
                  )) {
                    throw Exception('Could not launch $url');
                  }
                },
              ),
              const SizedBox(height: 16),
              
              _buildGuideCard(
                title: 'CVEC & Mutuelles étudiantes',
                description: 'Tout savoir sur la Contribution Vie Étudiante et Campus (CVEC) et les complémentaires santé adaptées aux besoins des étudiants.',
                imageUrl: 'assets/img/cvec.jpg',
                onTap: () async {
                  final Uri url = Uri.parse('https://cvec.etudiant.gouv.fr/');
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
              ),
              const SizedBox(height: 16),
              
              _buildGuideCard(
                title: 'Guide pour étudiants internationaux',
                description: 'Documents nécessaires, démarches administratives et conseils pratiques pour faciliter votre installation en France en tant qu\'étudiant étranger.',
                imageUrl: 'assets/img/guide.jpg',
                onTap: () async {
                  final Uri url = Uri.parse('https://www.smeno.com/blog/partir-etudier-a-letranger/etudiants-etrangers-arrivant-en-france-guide-pratique/');
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
              ),
              
              const SizedBox(height: 32),
              
              // Guide cards section title
              const Text(
                'Guides pratiques',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              
              // Guide cards
              _buildGuideCard(
                title: 'Le logement',
                description: 'Besoin d\'un coup de pouce pour votre logement? Que vous soyez étudiant français ou étranger, plusieurs aides peuvent alléger vos dépenses. Le CROUS propose des logements à tarif réduit pour les étudiants.',
                imageUrl: 'assets/img/logement.jpg',
                onTap: () async {
                  final Uri url = Uri.parse('https://trouverunlogement.lescrous.fr/');
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
              ),
              
              // Rest of the existing guide cards...
              const SizedBox(height: 16),
              
              _buildGuideCard(
                title: 'Les Transports',
                description: 'Simplifiez vos trajets vers le campus! Explorez les réductions étudiantes, les abonnements transports et les aides pour faciliter vos déplacements, même si vous venez de l\'étranger.',
                imageUrl: 'assets/img/transport.jpg',
                onTap: () async {
                  final Uri url = Uri.parse('https://www.iledefrance-mobilites.fr/titres-et-tarifs/detail/forfait-imagine-r-etudiant');
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
              ),
              const SizedBox(height: 16),
              
              _buildGuideCard(
                title: 'La restauration',
                description: 'Besoin d\'un coup de pouce pour votre budget repas? Que vous soyez étudiant français ou étranger, plusieurs aides peuvent alléger vos dépenses. Upcohésia vous propose des réductions pour vos repas.',
                imageUrl: 'assets/img/restauration.jpg',
                onTap: () async {
                  final Uri url = Uri.parse('https://up.coop/upcohesia/');
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
              ),
              const SizedBox(height: 16),
              
              _buildGuideCard(
                title: 'Aides aux logements',
                description: '"Vous pouvez accéder aux informations sur l\'Aide au Logement, ce qui vous dirigera vers le site de la CAF pour consulter les conditions et faire une demande."',
                imageUrl: 'assets/img/finance.jpg',
                onTap: () async {
                  final Uri url = Uri.parse('https://www.caf.fr/allocataires/aides-et-demarches/droits-et-prestations/logement/les-aides-personnelles-au-logement');
                  if (!await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildGuideCard({
    required String title,
    required String description,
    required String imageUrl,
    required VoidCallback onTap,
  }) {
    // Create a state variable to track if the card is expanded
    bool isExpanded = false;
    
    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, bottom: 16.0, right: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            description,
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                            ),
                            maxLines: isExpanded ? 10 : 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 12),
                          
                          // Show "En savoir plus" button if not expanded
                          if (!isExpanded)
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isExpanded = true;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF4A2A82),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Text(
                                  'En savoir plus',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          
                          // Show "Accéder au guide complet" button if expanded
                          if (isExpanded) ...[
                            const SizedBox(height: 8),
                            Text(
                              "Pour plus d'informations détaillées, consultez notre guide complet.",
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontStyle: FontStyle.italic,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 12),
                            GestureDetector(
                              onTap: onTap,
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF4A2A82),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Text(
                                      'Accéder au guide complet',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 4),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      size: 14,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                      child: Image.asset(
                        imageUrl,
                        height: isExpanded ? 150 : 120,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: isExpanded ? 150 : 120,
                            color: Colors.grey[300],
                            child: const Icon(Icons.image_not_supported),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }
    );
  }
}