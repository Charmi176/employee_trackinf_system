import 'package:flutter/material.dart';

void main() {
  runApp(const EmployeeScreen());
}

class EmployeeScreen extends StatelessWidget {
  const EmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardUI(),
    );
  }
}

class DashboardUI extends StatefulWidget {
  const DashboardUI({super.key});

  @override
  State<DashboardUI> createState() => _DashboardUIState();
}

class _DashboardUIState extends State<DashboardUI> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),

      body: MediaQuery.removePadding( // 🔥 GAP FIX
        context: context,
        removeTop: true,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start, // 🔥 ALIGN TOP
            children: [

              /// 🔹 SIDEBAR
              Container(
                width: 250,
                color: const Color(0xFF131313),
                child: Column(
                  children: [

                    /// LOGO (gap remove)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF4FACFE), Color(0xFF00F2FE)],
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(Icons.view_in_ar, color: Colors.white),
                          ),
                          const SizedBox(width: 10),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("DASHBOARD"),
                              Text("WORKSPACE",
                                  style: TextStyle(color: Colors.grey, fontSize: 10)),
                            ],
                          )
                        ],
                      ),
                    ),

                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero, // 🔥 remove top gap
                        children: [
                          menuItem(Icons.public_outlined, "Clients", 0),
                          menuItem(Icons.calendar_today_outlined, "Appointments", 1),
                          menuItem(Icons.shopping_cart_outlined, "Shop", 2),
                          menuItem(Icons.science_outlined, "Labs", 3),
                          menuItem(Icons.people_outline, "Users", 4),

                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text("MANAGEMENT",
                                style: TextStyle(color: Colors.grey)),
                          ),

                          menuItem(Icons.chat_bubble_outline, "Consult", 5),
                          menuItem(Icons.task_alt, "Tasks", 6),
                          menuItem(Icons.inventory_2_outlined, "Assets", 7),
                          menuItem(Icons.video_settings, "Studio", 8),
                          menuItem(Icons.app_registration, "Register", 9),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              /// 🔹 MAIN UI
              SizedBox(
                width: 1100,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 20), // 🔥 TOP FIX
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      /// TOP BAR
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 45,
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1A1A1A),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Row(
                                children: [
                                  Icon(Icons.search, color: Colors.grey),
                                  SizedBox(width: 10),
                                  Text("Search...",
                                      style: TextStyle(color: Colors.grey)),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          const Icon(Icons.notifications),
                          const SizedBox(width: 15),
                          const CircleAvatar(),
                        ],
                      ),

                      const SizedBox(height: 15),

                      /// WELCOME
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1A1A),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: const [
                            Text("New", style: TextStyle(color: Colors.blue)),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                "Welcome back to your dashboard, Gabe Oni",
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text("Learn More →",
                                style: TextStyle(color: Colors.orange)),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      /// CARDS
                      Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: [
                          statCard("REGISTERED USERS", "1,520"),
                          statCard("MONTHLY VISITS", "15,837"),
                          statCard("PROFITS", "\$135,965"),
                          statCard("PORTFOLIO", "5,837"),
                        ],
                      ),

                      const SizedBox(height: 20),

                      /// TABLE + NOTICE
                      Row(
                        children: [
                          Expanded(child: appointmentsTable()),
                          const SizedBox(width: 20),
                          Expanded(child: noticeBoard()),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// MENU
  Widget menuItem(IconData icon, String title, int index) {
    bool isSelected = selectedIndex == index;

    return ListTile(
      leading: Icon(icon, color: isSelected ? Colors.blue : Colors.grey),
      title: Text(title,
          style: TextStyle(color: isSelected ? Colors.white : Colors.grey)),
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
    );
  }

  /// CARD
  Widget statCard(String title, String value) {
    return Container(
      width: 230,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 10),
          Text(value, style: const TextStyle(fontSize: 22)),
        ],
      ),
    );
  }

  Widget appointmentsTable() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Text("Upcoming Appointments"),
    );
  }

  Widget noticeBoard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Text("Notice Board"),
    );
  }
}