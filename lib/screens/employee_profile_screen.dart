import 'package:flutter/material.dart';

class EmployeeProfileScreen extends StatelessWidget {
  const EmployeeProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      body: SafeArea(
        child: Row(
          children: [

            // 🔵 LEFT SIDEBAR
            Container(
              width: 220,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(height: 30),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Humanline",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  ),

                  const SizedBox(height: 20),

                  _menuItem(Icons.dashboard, "Dashboard", true),
                  _menuItem(Icons.people, "Employees", false),
                  _menuItem(Icons.check_box, "Checklist", false),
                  _menuItem(Icons.access_time, "Time Off", false),
                  _menuItem(Icons.bar_chart, "Payroll", false),
                  _menuItem(Icons.trending_up, "Performance", false),

                  const Spacer(),

                  _menuItem(Icons.settings, "Settings", false),
                  const SizedBox(height: 20),
                ],
              ),
            ),

            // 🔵 RIGHT CONTENT
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // 🔵 HEADER
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Employee Profile",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        Icon(Icons.notifications_none)
                      ],
                    ),

                    const SizedBox(height: 20),

                    // 🔥 PROFILE CARD (FIXED)
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [

                          const CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.grey,
                          ),

                          const SizedBox(width: 12),

                          // 🔥 TEXT FIX
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Jane Maria",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Senior Product Designer",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 10),

                          // 🔥 INFO FIX (WRAP)
                          Flexible(
                            child: Wrap(
                              spacing: 15,
                              runSpacing: 8,
                              children: const [
                                _InfoBox(title: "Projects", value: "12"),
                                _InfoBox(title: "Experience", value: "5.4"),
                                _InfoBox(title: "Rating", value: "4.8"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // 🔵 WORK PERFORMANCE
                    _card(
                      title: "Work Performance",
                      child: Container(
                        height: 150,
                        alignment: Alignment.center,
                        child: const Text("Graph Here"),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // 🔵 ACTIVE PROJECTS
                    _card(
                      title: "Active Projects",
                      child: Column(
                        children: const [
                          ListTile(title: Text("Dashboard UI"), trailing: Text("75%")),
                          ListTile(title: Text("Mobile App"), trailing: Text("50%")),
                          ListTile(title: Text("Website"), trailing: Text("30%")),
                        ],
                      ),
                    ),
                  ],
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }

  //////////////////////////////////////////////////////////

  static Widget _menuItem(IconData icon, String text, bool active) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: active ? Colors.green : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: active ? Colors.white : Colors.grey),
          const SizedBox(width: 10),
          Text(text,
              style: TextStyle(
                  color: active ? Colors.white : Colors.grey)),
        ],
      ),
    );
  }

  //////////////////////////////////////////////////////////

  static Widget _card({required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}

//////////////////////////////////////////////////////////

// 🔥 INFO BOX WIDGET (FIXED)
class _InfoBox extends StatelessWidget {
  final String title;
  final String value;

  const _InfoBox({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(value,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14)),
        Text(title,
            style: const TextStyle(
                fontSize: 11,
                color: Colors.grey),
            overflow: TextOverflow.ellipsis),
      ],
    );
  }
}