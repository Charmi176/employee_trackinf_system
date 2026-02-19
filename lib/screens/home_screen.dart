import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = -1;
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark ? Colors.black : const Color(0xFFF3F4F6),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // 🔵 HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    // LEFT TEXT
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Welcome",
                            style: TextStyle(
                                color: isDark ? Colors.white70 : Colors.grey)),

                        const SizedBox(height: 4),

                        Text("Eleza Patel",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: isDark ? Colors.white : Colors.black)),

                        const SizedBox(height: 4),

                        Text("30 November, 2024",
                            style: TextStyle(
                                color: isDark ? Colors.white60 : Colors.grey)),
                      ],
                    ),

                    // RIGHT ICONS
                    Row(
                      children: [

                        // 🔔 Notification
                        CircleIcon(
                          icon: Icons.notifications_none,
                          isSelected: selectedIndex == 0,
                          showBadge: true,
                          onTap: () {
                            setState(() {
                              selectedIndex =
                              (selectedIndex == 0) ? -1 : 0;
                            });
                          },
                        ),

                        const SizedBox(width: 10),

                        // 🌙 Dark Mode
                        CircleIcon(
                          icon: isDark
                              ? Icons.light_mode
                              : Icons.dark_mode_outlined,
                          isSelected: false,
                          onTap: () {
                            setState(() {
                              isDark = !isDark;
                              selectedIndex = -1;
                            });
                          },
                        ),

                        const SizedBox(width: 10),

                        // ☰ Menu (Square)
                        CircleIcon(
                          icon: Icons.menu,
                          isSelected:selectedIndex == 2,
                          isSquare: true,
                          onTap: () {
                            setState(() {
                              selectedIndex =
                              (selectedIndex == 2) ? -1 : 2;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),

                const SizedBox(height: 20),

                // 🔵 CARDS
                StatCard(
                  title: "TOTAL EMPLOYEE",
                  value: "475",
                  icon: Icons.people,
                  change: "+7%",
                  color: Colors.green,
                  isDark: isDark,
                ),

                const SizedBox(height: 15),

                StatCard(
                  title: "PENDING LEAVE REQUEST",
                  value: "15",
                  icon: Icons.description,
                  change: "+5",
                  color: Colors.purple,
                  isDark: isDark,
                ),

                const SizedBox(height: 15),

                StatCard(
                  title: "ACTIVE REQUIREMENT POSITION",
                  value: "35",
                  icon: Icons.person_add,
                  change: "+12",
                  color: Colors.pink,
                  isDark: isDark,
                ),

                const SizedBox(height: 15),

                StatCard(
                  title: "PAYROLL PROCESSING SYSTEM",
                  value: "11",
                  icon: Icons.payments,
                  change: "+3",
                  color: Colors.green,
                  isDark: isDark,
                ),

                const SizedBox(height: 20),

                // 🔵 CHART
                EmployeeChartCard(isDark: isDark),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////

class CircleIcon extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;
  final bool showBadge;
  final bool isSquare;

  const CircleIcon({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.onTap,
    this.showBadge = false,
    this.isSquare = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,

              // 🔥 FIX: ONLY ONE shape allowed
              shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
              borderRadius:
              isSquare ? BorderRadius.circular(15) : null,

              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black.withValues(alpha: 0.08),
                )
              ],
            ),

            child: Icon(
              icon,
              size: 24,
              color: isSelected ? Colors.blue : Colors.black,
            ),
          ),

          // 🔴 Notification dot
          if (showBadge)
            Positioned(
              right: 3,
              top: 3,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

//////////////////////////////////////////////////////////

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final String change;
  final Color color;
  final bool isDark;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.change,
    required this.color,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: isDark ? Colors.grey[900] : Colors.white,
        borderRadius: BorderRadius.circular(18),

        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black.withValues(alpha: 0.05),
          )
        ],
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(
                      color: isDark ? Colors.white70 : Colors.grey)),

              const SizedBox(height: 8),

              Text(value,
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black)),

              const SizedBox(height: 8),

              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4),

                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),

                    child: Row(
                      children: [
                        Icon(Icons.arrow_upward,
                            size: 14, color: color),
                        const SizedBox(width: 4),
                        Text(change,
                            style: TextStyle(
                                color: color,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),

                  const SizedBox(width: 6),

                  Text("vs last month",
                      style: TextStyle(
                          color: isDark ? Colors.white60 : Colors.grey)),
                ],
              )
            ],
          ),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color),
          )
        ],
      ),
    );
  }
}

//////////////////////////////////////////////////////////

class EmployeeChartCard extends StatelessWidget {
  final bool isDark;

  const EmployeeChartCard({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[900] : Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black.withValues(alpha: 0.05),
          )
        ],
      ),
      child: Column(
        children: [
          Text("Total Employees",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.black)),

          const SizedBox(height: 20),

          SizedBox(
            height: 160,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PieChart(
                  PieChartData(
                    centerSpaceRadius: 50,
                    sections: [
                      PieChartSectionData(
                        value: 65,
                        color: Colors.blue,
                        showTitle: false,
                      ),
                      PieChartSectionData(
                        value: 35,
                        color: Colors.pink,
                        showTitle: false,
                      ),
                    ],
                  ),
                ),

                Text("475",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : Colors.black))
              ],
            ),
          ),

          const SizedBox(height: 10),

          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LegendItem(color: Colors.blue, text: "Male"),
              SizedBox(width: 15),
              LegendItem(color: Colors.pink, text: "Female"),
            ],
          )
        ],
      ),
    );
  }
}

//////////////////////////////////////////////////////////

class LegendItem extends StatelessWidget {
  final Color color;
  final String text;

  const LegendItem({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 5),
        Text(text),
      ],
    );
  }
}
