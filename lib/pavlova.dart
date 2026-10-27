import 'package:flutter/material.dart';

void main() => runApp(const PavlovaApp());


class PavlovaApp extends StatelessWidget {
  const PavlovaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, fontFamily: 'Roboto'),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Pavlova_Pajaron'),
          backgroundColor: Colors.white,
        ),
        body: const SafeArea(
          child: SingleChildScrollView(child: RecipeCard()),
        ),
      ),
    );
  }
}
class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key});

  static const Color cardColor = Color(0xFFFDF4FF);
  static const Color accent = Color(0xFFFFD600);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: cardColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Image.asset(
            'assets/pavlova.jpg',
            width: double.infinity,
            height: 330,
            fit: BoxFit.cover,
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                const Text(
                  'Strawberry Pavlova',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF212121),
                  ),
                ),
                const SizedBox(height: 10),

                // Description
                const Text(
                  'Pavlova is a meringue-based dessert named after the '
                  'Russian ballerina Anna Pavlova. Pavlova features a crisp '
                  'crust and soft, light inside, topped with fruit and '
                  'whipped cream.',
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.45,
                    color: Color(0xFF424242),
                  ),
                ),
                const SizedBox(height: 16),

                // Rating row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                      5,
                      (i) => Icon(
                        i < 3 ? Icons.star : Icons.star_border,
                        color: accent,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      '90 Reviews',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Info row
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InfoColumn(
                      icon: Icons.timer_outlined,
                      label: 'PREP',
                      value: '25 min',
                    ),
                    InfoColumn(
                      icon: Icons.restaurant,
                      label: 'COOK',
                      value: '1 gr',
                    ),
                    InfoColumn(
                      icon: Icons.people_alt_outlined,
                      label: 'FEEDS',
                      value: '4-6 hrs',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InfoColumn extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoColumn({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: RecipeCard.accent, size: 28),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        Text(value, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}