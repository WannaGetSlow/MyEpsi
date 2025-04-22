import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Actualités',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildNewsItem(
                title: 'Nouveau campus à Paris',
                date: '15 septembre 2023',
                location: 'Paris',
                image: 'assets/img/nv_campus.jpg',
                description: 'L\'EPSI Paris inaugure son nouveau campus à Courbevoie, offrant des espaces modernes et adaptés aux nouvelles méthodes pédagogiques.',
              ),
              const SizedBox(height: 24),
              
              _buildNewsItem(
                title: 'Élections BDE',
                date: '10 octobre 2023',
                location: 'Paris',
                image: 'assets/img/elections_bde.jpg',
                description: 'Les élections du Bureau Des Étudiants auront lieu le mois prochain. Préparez vos listes et vos programmes!',
              ),
              const SizedBox(height: 24),
              
              _buildNewsItem(
                title: 'Hackathon Intelligence Artificielle',
                date: '5 novembre 2023',
                location: 'Paris',
                image: 'assets/img/logo_epsi.jpg',
                description: 'Participez au grand hackathon sur l\'IA organisé en partenariat avec des entreprises du secteur. Inscriptions ouvertes!',
              ),
              const SizedBox(height: 24),
              
              _buildNewsItem(
                title: 'Conférence Cybersécurité',
                date: '20 novembre 2023',
                location: 'Paris',
                image: 'assets/img/logo_epsi.jpg',
                description: 'Des experts en cybersécurité viendront partager leur expérience et les dernières tendances du secteur.',
              ),
              const SizedBox(height: 24),
              
              _buildNewsItem(
                title: 'Journée Portes Ouvertes',
                date: '15 décembre 2023',
                location: 'Paris',
                image: 'assets/img/logo_epsi.jpg',
                description: 'Venez découvrir l\'école et ses formations lors de notre journée portes ouvertes. Ateliers et démonstrations au programme.',
              ),
              const SizedBox(height: 24),
              
              _buildNewsItem(
                title: 'Partenariat avec Microsoft',
                date: '10 janvier 2024',
                location: 'Paris',
                image: 'assets/img/logo_epsi.jpg',
                description: 'L\'EPSI renforce son partenariat avec Microsoft pour offrir de nouvelles opportunités aux étudiants.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNewsItem({
    required String title,
    required String date,
    required String location,
    required String image,
    required String description,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              image,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 180,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.image_not_supported),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      date,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Icon(Icons.location_on, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      location,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(50, 30),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    alignment: Alignment.centerLeft,
                  ),
                  child: const Text(
                    'Lire la suite',
                    style: TextStyle(
                      color: Color(0xFF4A2A82),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}