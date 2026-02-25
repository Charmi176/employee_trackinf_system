

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: EmployeeProfileScreen(),
  ));
}

class EmployeeProfileScreen extends StatelessWidget {
  const EmployeeProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Row(
        children: [
          // 1. Sidebar (Fixed Width)
          const SidebarWidget(),

          // 2. Main Content
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: 1200, // આડા સ્ક્રોલ માટે ફિક્સ વિડ્થ
                child: Column(
                  children: [
                    const TopBarWidget(),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Employees > Profile", style: TextStyle(color: Colors.grey, fontSize: 12)),
                            const SizedBox(height: 8),
                            const Text("Employee Profile", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 20),
                            const ProfileHeaderWidget(),
                            const SizedBox(height: 24),
                            const DashboardGrid(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- DASHBOARD GRID ---
class DashboardGrid extends StatelessWidget {
  const DashboardGrid({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(children: [
            // આ કાર્ડ હવે એરર નહીં આપે
            const CardWidget(
              title: "Work Performance",
              child: PerformanceChart(),
            ),
            const SizedBox(height: 24),
            const CardWidget(title: "Active Projects", child: Center(child: Text("Projects Table"))),
          ]),
        ),
        const SizedBox(width: 24),
        const Expanded(
          child: Column(children: [
            const CardWidget(title: "Attendance Summary", child: Center(child: Text("Donut Chart"))),
            const SizedBox(height: 24),
            const CardWidget(title: "Team Members", child: Center(child: Text("Member List"))),
          ]),
        ),
      ],
    );
  }
}

// --- PERFORMANCE CHART (image_405640.png મુજબ) ---
class PerformanceChart extends StatelessWidget {
  const PerformanceChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Legend અને ડ્રોપડાઉન (image_405640.png મુજબ)
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _legend(Colors.green, "Productivity"),
            const SizedBox(width: 15),
            _legend(Colors.orangeAccent, "Attendance"),
            const SizedBox(width: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(6)),
              child: const Row(children: [Text("Last 6 months ", style: TextStyle(fontSize: 11)), Icon(Icons.calendar_today_outlined, size: 12)]),
            )
          ],
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Row(
            children: [
              // Y-Axis Labels (100 to 50)
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: ["100", "90", "80", "70", "60", "50"].map((t) => Text(t, style: const TextStyle(color: Colors.grey, fontSize: 10))).toList(),
              ),
              const SizedBox(width: 10),
              // ગ્રાફ લાઈન્સ
              Expanded(
                child: Stack(
                  children: [
                    Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: List.generate(6, (i) => Divider(height: 1, color: Colors.grey.shade100))),
                    Positioned.fill(child: CustomPaint(painter: LineChartPainter())),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        // X-Axis (Months)
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ["Jan", "Feb", "Mar", "Apr", "May", "Jun"].map((m) => Text(m, style: const TextStyle(color: Colors.grey, fontSize: 10))).toList(),
          ),
        )
      ],
    );
  }

  Widget _legend(Color c, String t) => Row(children: [Container(width: 8, height: 8, decoration: BoxDecoration(color: c, shape: BoxShape.circle)), const SizedBox(width: 5), Text(t, style: const TextStyle(fontSize: 11, color: Colors.grey))]);
}

// ગ્રાફની કર્વ લાઈન્સ દોરવા માટેનું પેઈન્ટર
class LineChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final productivityPaint = Paint()..color = Colors.green..style = PaintingStyle.stroke..strokeWidth = 2.5;
    final attendancePaint = Paint()..color = Colors.orangeAccent..style = PaintingStyle.stroke..strokeWidth = 2.5;

    final productivityPath = Path()..moveTo(0, size.height * 0.7)
      ..quadraticBezierTo(size.width * 0.2, size.height * 0.55, size.width * 0.4, size.height * 0.65)
      ..quadraticBezierTo(size.width * 0.7, size.height * 0.4, size.width, size.height * 0.3);

    final attendancePath = Path()..moveTo(0, size.height * 0.8)
      ..quadraticBezierTo(size.width * 0.4, size.height * 0.75, size.width * 0.6, size.height * 0.7)
      ..quadraticBezierTo(size.width * 0.8, size.height * 0.6, size.width, size.height * 0.5);

    canvas.drawPath(productivityPath, productivityPaint);
    canvas.drawPath(attendancePath, attendancePaint);
  }
  @override bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// --- CARD WIDGET (આ ક્લાસ ઉમેરવાથી 'isn't a class' એરર સોલ્વ થશે) ---
class CardWidget extends StatelessWidget {
  final String title;
  final Widget child;
  const CardWidget({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          // ગ્રાફ માટે ફિક્સ હાઈટ જેથી ઓવરફ્લો ન થાય
          SizedBox(height: 250, child: child),
        ],
      ),
    );
  }
}

// --- બાકીના વિજેટ્સ ---
class SidebarWidget extends StatelessWidget {
  const SidebarWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260, color: Colors.white,
      child: Column(children: [
        const Padding(padding: EdgeInsets.all(24), child: Row(children: [Icon(Icons.star, color: Colors.green), SizedBox(width: 8), Text("Humanline", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))])),
        _item(Icons.grid_view, "Dashboard", active: true),
        _item(Icons.people_outline, "Employees"),
        _item(Icons.checklist, "Checklist"),
        _item(Icons.access_time, "Time Off"),
        _item(Icons.calendar_month_outlined, "Attendance"),
      ]),
    );
  }
  Widget _item(IconData i, String t, {bool active = false}) => Container(
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    decoration: BoxDecoration(color: active ? const Color(0xFF27AE60) : Colors.transparent, borderRadius: BorderRadius.circular(8)),
    child: ListTile(leading: Icon(i, color: active ? Colors.white : Colors.grey, size: 20), title: Text(t, style: TextStyle(color: active ? Colors.white : Colors.black, fontSize: 14))),
  );
}

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(children: [
        Container(width: 250, height: 40, decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(8)), child: const TextField(decoration: InputDecoration(prefixIcon: Icon(Icons.search, size: 18), hintText: "Search anything...", border: InputBorder.none, contentPadding: EdgeInsets.only(top: 8)))),
        const Spacer(),
        const CircleAvatar(radius: 16, backgroundImage: AssetImage('assets/images/f1.jpg')),
      ]),
    );
  }
}

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(children: [
        Container(height: 140, decoration: const BoxDecoration(color: Color(0xFF2C3E50), borderRadius: BorderRadius.vertical(top: Radius.circular(16)))),
        const Padding(padding: EdgeInsets.all(24), child: Row(children: [
          CircleAvatar(radius: 40, backgroundImage: AssetImage('assets/images/f2.png')),
          SizedBox(width: 20),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("Jane Maria", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)), Text("Senior Product Designer", style: TextStyle(color: Colors.grey))]),
        ])),
      ]),
    );
  }
}