import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Welcome,", style: TextStyle(color: Colors.grey)),
                        SizedBox(height: 4),
                        Text("Eleza Patel",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text("30 November, 2024",
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),

                    Row(
                      children: const [
                        CircleIcon(Icons.notifications_none),
                        SizedBox(width: 10),
                        CircleIcon(Icons.dark_mode_outlined),
                        SizedBox(width: 10),
                        CircleIcon(Icons.menu),
                      ],
                    )
                  ],
                ),

                const SizedBox(height: 20),

                /// CARDS
                StatCard(
                  title: "TOTAL EMPLOYEE",
                  value: "475",
                  icon: Icons.group,
                  change: "+7%",
                  color: Colors.green,
                ),

                const SizedBox(height: 15),

                StatCard(
                  title: "PENDING LEAVE REQUEST",
                  value: "15",
                  icon: Icons.description,
                  change: "+5",
                  color: Colors.blue,
                ),

                const SizedBox(height: 15),

                StatCard(
                  title: "ACTIVE RECRUITMENT POSITION",
                  value: "35",
                  icon: Icons.person_add,
                  change: "+12%",
                  color: Colors.pink,
                ),

                const SizedBox(height: 15),

                StatCard(
                  title: "PAYROLL PROCESSING STATUS",
                  value: "11",
                  icon: Icons.payments,
                  change: "+3",
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


/// ICON BUTTON
class CircleIcon extends StatelessWidget {
  final IconData icon;
  const CircleIcon(this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: Colors.black.withOpacity(0.05),
          )
        ],
      ),
      child: Icon(icon),
    );
  }
}

/// CARD
class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final String change;
  final Color color;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.change,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Colors.grey)),

              const SizedBox(height: 8),

              Text(value,
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold)),

              const SizedBox(height: 8),

              Row(
                children: [
                  Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.arrow_upward,
                            size: 14, color: color),
                        Text(change,
                            style: TextStyle(
                                color: color,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Text("vs last month",
                      style: TextStyle(color: Colors.grey)),
                ],
              )
            ],
          ),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color),
          )
        ],
      ),
    );
  }
}
