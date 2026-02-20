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
      drawer: const SideMenu(),
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
                        Builder(
                          builder: (context) {
                            return CircleIcon(
                              icon: Icons.menu,
                              isSelected: selectedIndex == 2,
                              isSquare: true,
                              onTap: () {
                                Scaffold.of(context).openDrawer();
                              },
                            );
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

                const SizedBox(height: 20),

                // RecruitmentCard(isDark: isDark),
                //
                // const SizedBox(height: 20),
                //
                // PayrollChartCard(isDark: isDark),
                //
                // const SizedBox(height: 20),
                //
                // AttendanceCard(isDark: isDark),
                //
                // const SizedBox(height: 20),
                //
                // BirthdayCard(isDark: isDark),
                //
                // const SizedBox(height: 20),






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
              shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
              borderRadius: isSquare ? BorderRadius.circular(12) : null,
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.08),
                )
              ],
            ),
            child: Icon(
              icon,
              size: 24,
              color: isSelected ? Colors.blue : Colors.black,
            ),
          ),

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
            color: Colors.black.withOpacity(0.05),
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
                      color: color.withOpacity(0.15),
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
        ],
      ),
    );
  }
}
class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 260,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: 30),

                Row(
                  children: const [
                    Icon(Icons.rocket_launch, color: Colors.blue),
                    SizedBox(width: 10),
                    Text("Excelhr",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),

                const SizedBox(height: 25),

                _menuItem(Icons.grid_view, "Dashboard", 0),
                _menuItem(Icons.group, "Employee", 1),
                _menuItem(Icons.person, "Profile", 2),
                _menuItem(Icons.settings, "Settings", 3),
                _menuItem(Icons.logout, "Log out", 4),

                const SizedBox(height: 20),

                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE9EEF8),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.flash_on, color: Colors.blue),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Upgrade your plan",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "Your trial plan ends in 13 days. Upgrade for full potential.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text("See plans",
                              style: TextStyle(color: Colors.white)),
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _menuItem(IconData icon, String text, int index) {
    bool selected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),

          // 🔥 Different styles
          gradient: selected && index == 0
              ? const LinearGradient(
            colors: [Color(0xFF1E63E9), Color(0xFF2E86FF)],
          )
              : null,

          color: selected && index != 0
              ? const Color(0xFFE7EEF9) // Light blue
              : Colors.transparent,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: selected
                  ? (index == 0 ? Colors.white : Colors.blue)
                  : Colors.grey,
            ),

            const SizedBox(width: 12),

            Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: selected
                    ? (index == 0 ? Colors.white : Colors.blue)
                    : Colors.grey,
                fontWeight:
                selected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
  }