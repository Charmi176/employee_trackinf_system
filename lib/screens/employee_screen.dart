import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

void main() {
  runApp(const EmployeeScreen());
}

/// 🔥 SCROLL FIX (Mouse drag support)
class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}

class EmployeeScreen extends StatelessWidget {
  const EmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData.dark(),
      home: const DashboardUI(),
    );
  }
}

class DashboardUI extends StatefulWidget {
  const DashboardUI({super.key});

  @override
  State<DashboardUI> createState() => _DashboardUIState();
}

class _DashboardUIState extends State<DashboardUI> {
  final ScrollController _horizontalController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),

      body: Scrollbar(
        controller: _horizontalController,
        thumbVisibility: true,
        interactive: true,
        thickness: 10,
        child: SingleChildScrollView(
          controller: _horizontalController,
          scrollDirection: Axis.horizontal,
          physics: const AlwaysScrollableScrollPhysics(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// 🔹 SIDEBAR
              Container(
                width: 250,
                height: MediaQuery.of(context).size.height,
                color: const Color(0xFF131313),
                child: ListView(
                  children: [
                    const SizedBox(height: 20),
                    const ListTile(
                      leading: Icon(Icons.dashboard, color: Colors.blue),
                      title: Text("DASHBOARD"),
                      subtitle: Text("WORKSPACE",
                          style: TextStyle(color: Colors.grey, fontSize: 10)),
                    ),
                    menuItem(Icons.public, "Clients"),
                    menuItem(Icons.calendar_today, "Appointments"),
                    menuItem(Icons.people, "Users"),

                    const Padding(
                      padding: EdgeInsets.all(15),
                      child: Text("MANAGEMENT",
                          style: TextStyle(color: Colors.grey)),
                    ),

                    menuItem(Icons.chat, "Consult"),
                    menuItem(Icons.task, "Tasks"),
                  ],
                ),
              ),

              /// 🔹 MAIN CONTENT
              SizedBox(
                width: 1200,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      /// 🔍 SEARCH
                      searchBar(),
                      const SizedBox(height: 25),

                      /// 👋 WELCOME
                      welcomeBanner(),
                      const SizedBox(height: 25),

                      /// 📊 CARDS
                      Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: [
                          statCard("REGISTERED USERS", "1,520",
                              Icons.people, "12%", true),
                          statCard("MONTHLY VISITS", "15,837",
                              Icons.visibility, "8%", true),
                          statCard("PROFITS", "\$135,965",
                              Icons.account_balance, "5%", false),
                        ],
                      ),

                      const SizedBox(height: 25),

                      /// TABLE + NOTICE
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(flex: 2, child: upcomingAppointments()),
                          const SizedBox(width: 20),
                          Expanded(child: noticeBoard()),
                        ],
                      ),

                      const SizedBox(height: 50),
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

  /// 🔹 Sidebar Item
  static Widget menuItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey),
      title: Text(title, style: const TextStyle(color: Colors.grey)),
    );
  }

  /// 🔍 Search Bar
  Widget searchBar() {
    return Row(
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
                Text("Search...", style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ),
        const SizedBox(width: 15),
        const Icon(Icons.notifications_none),
        const SizedBox(width: 15),
        const CircleAvatar(radius: 18),
      ],
    );
  }

  /// 👋 Welcome Banner
  Widget welcomeBanner() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Row(
        children: [
          Icon(Icons.auto_awesome, color: Colors.blue),
          SizedBox(width: 10),
          Text("New", style: TextStyle(color: Colors.blue)),
          SizedBox(width: 15),
          Expanded(
            child: Text("Welcome back to your dashboard"),
          ),
          Text("Learn More →", style: TextStyle(color: Colors.orange)),
        ],
      ),
    );
  }
}

/// 📊 CARD
Widget statCard(String title, String value, IconData icon,
    String percent, bool isUp) {
  return Container(
    width: 260,
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: const Color(0xFF131313),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.white10),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 10),
        Text(value,
            style: const TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold)),
      ],
    ),
  );
}

/// 📋 TABLE
Widget upcomingAppointments() {
  return Container(
    height: 350,
    decoration: BoxDecoration(
      color: const Color(0xFF1A1A1A),
      borderRadius: BorderRadius.circular(16),
    ),
    child: const Center(child: Text("Appointments Table")),
  );
}

/// 📌 NOTICE
Widget noticeBoard() {
  return Container(
    height: 350,
    decoration: BoxDecoration(
      color: const Color(0xFF1A1A1A),
      borderRadius: BorderRadius.circular(16),
    ),
    child: const Center(child: Text("Notice Board")),
  );
}