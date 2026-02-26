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
      drawer: const Drawer(
        child: SidebarWidget(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const TopBarWidget(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Employees > Profile", style: TextStyle(color: Colors.grey, fontSize: 12)),
                    const SizedBox(height: 8),
                    Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        const Text("Employee Profile", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            OutlinedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.ios_share, size: 16),
                              label: const Text("Export"),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.edit, size: 16, color: Colors.white),
                              label: const Text("Edit", style: TextStyle(color: Colors.white)),
                              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF27AE60)),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    const ProfileHeaderWidget(), // Overflow Fixed Here
                    const SizedBox(height: 24),
                    const DashboardGrid(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardGrid extends StatelessWidget {
  const DashboardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CardWidget(
          title: "Work Performance",
          child: PerformanceChart(),
        ),
        const SizedBox(height: 20),
        const CardWidget(
          title: "Attendance Summary",
          child: AttendanceSummaryWidget(),
        ),
        const SizedBox(height: 20),
        CardWidget(
          title: "Active Projects",
          trailing: const Text(
            "View All",
            style: TextStyle(color: Colors.green, fontSize: 12, fontWeight: FontWeight.bold),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: 500,
              child: const ActiveProjectsTable(),
            ),
          ),
        ),
        const SizedBox(height: 20),
        const CardWidget(
          title: "Team Members",
          child: TeamMembersWidget(),
        ),
        const SizedBox(height: 20),
        const CardWidget(
          title: "Upcoming Time Off",
          trailing: Text(
            "+ Request",
            style: TextStyle(color: Colors.green, fontSize: 12),
          ),
          child: UpcomingTimeOffWidget(),
        ),
      ],
    );
  }
}

class PerformanceChart extends StatelessWidget {
  const PerformanceChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _dot(Colors.green, "Productivity"),
                const SizedBox(width: 10),
                _dot(Colors.orange, "Attendance"),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Text("Last 6 months ▾", style: TextStyle(fontSize: 10)),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(height: 180, child: CustomPaint(painter: GraphPainter(), child: Container())),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Jan", style: TextStyle(fontSize: 10, color: Colors.grey)),
              Text("Jun", style: TextStyle(fontSize: 10, color: Colors.grey))
            ],
          ),
        ),
      ],
    );
  }

  Widget _dot(Color c, String t) => Row(mainAxisSize: MainAxisSize.min, children: [
    CircleAvatar(radius: 4, backgroundColor: c),
    const SizedBox(width: 4),
    Text(t, style: const TextStyle(fontSize: 10, color: Colors.grey))
  ]);
}

class AttendanceSummaryWidget extends StatelessWidget {
  const AttendanceSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SizedBox(
            width: 140,
            height: 140,
            child: CustomPaint(
              painter: DonutPainter(),
              child: const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("121", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    Text("Total Days", style: TextStyle(fontSize: 10, color: Colors.grey)),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: 2.5,
          children: [
            _stat("On Time", "92%", Colors.green),
            _stat("Late", "5%", Colors.orange),
            _stat("Absent", "3%", Colors.red),
            _stat("Leave", "2 Days", Colors.blue),
          ],
        )
      ],
    );
  }

  Widget _stat(String l, String v, Color c) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(radius: 3, backgroundColor: c),
            const SizedBox(width: 4),
            Text(l, style: const TextStyle(fontSize: 10, color: Colors.grey)),
          ],
        ),
        Text(v, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class DonutPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const strokeWidth = 14.0;
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    double startAngle = -90 * 3.14 / 180;

    void drawArc(double percent, Color color) {
      final sweep = 2 * 3.14 * percent;
      final paint = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;
      canvas.drawArc(rect, startAngle, sweep, false, paint);
      startAngle += sweep;
    }

    drawArc(0.92, Colors.green);
    drawArc(0.05, Colors.orange);
    drawArc(0.03, Colors.red);
    drawArc(0.02, Colors.blue);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class ActiveProjectsTable extends StatelessWidget {
  const ActiveProjectsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Expanded(flex: 3, child: Text("Project Name", style: TextStyle(color: Colors.grey, fontSize: 11))),
            Expanded(flex: 2, child: Text("Role", style: TextStyle(color: Colors.grey, fontSize: 11))),
            Expanded(flex: 2, child: Text("Status", style: TextStyle(color: Colors.grey, fontSize: 11))),
            Expanded(flex: 2, child: Text("Progress", style: TextStyle(color: Colors.grey, fontSize: 11))),
          ],
        ),
        const Divider(),
        _row("Humanline Dashboard", "Lead", "In Progress", Colors.green, 0.75),
        _row("Mobile App UI Kit", "Designer", "Review", Colors.orange, 0.90),
      ],
    );
  }

  Widget _row(String n, String r, String s, Color c, double p) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(flex: 3, child: Text(n, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold))),
          Expanded(flex: 2, child: Text(r, style: const TextStyle(fontSize: 12))),
          Expanded(flex: 2, child: Text(s, style: TextStyle(color: c, fontSize: 11, fontWeight: FontWeight.bold))),
          Expanded(flex: 2, child: LinearProgressIndicator(value: p, color: c, backgroundColor: Colors.grey[100]))
        ],
      ));
}

class TeamMembersWidget extends StatelessWidget {
  const TeamMembersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _member("Robert Fox", "Product Manager"),
        _member("Jane Cooper", "UI Designer"),
        const SizedBox(height: 10),
        SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () {}, child: const Text("View All Members", style: TextStyle(fontSize: 12)))),
      ],
    );
  }

  Widget _member(String n, String p) => ListTile(
    dense: true,
    contentPadding: EdgeInsets.zero,
    leading: const CircleAvatar(
      radius: 15,
      backgroundImage: AssetImage('assets/images/f3.jpg'), // Asset Image 3
    ),
    title: Text(n, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
    subtitle: Text(p, style: const TextStyle(fontSize: 11)),
    trailing: const Icon(Icons.mail_outline, size: 18),
  );
}

class UpcomingTimeOffWidget extends StatelessWidget {
  const UpcomingTimeOffWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _timeOff("Annual Leave", "Apr 15 - Apr 18, 2024", "Pending", Colors.orange),
        const SizedBox(height: 10),
        _timeOff("Remote Work", "Mar 28, 2024", "Approved", Colors.blue),
      ],
    );
  }

  Widget _timeOff(String t, String d, String s, Color c) => Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: c.withOpacity(0.05),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: c.withOpacity(0.1))),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(t, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
          Text(d, style: const TextStyle(fontSize: 10, color: Colors.grey))
        ]),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
            child: Text(s, style: TextStyle(color: c, fontSize: 10, fontWeight: FontWeight.bold)))
      ]));
}

class CardWidget extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget? trailing;
  const CardWidget({super.key, required this.title, required this.child, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10)]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          if (trailing != null) trailing!
        ]),
        const SizedBox(height: 15),
        child,
      ]),
    );
  }
}

class SidebarWidget extends StatelessWidget {
  const SidebarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 280,
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: const [
                  Icon(Icons.star, color: Colors.green),
                  SizedBox(width: 8),
                  Text("Humanline", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            _item(Icons.grid_view, "Dashboard", true),
            _item(Icons.people, "Employees", false),
            _item(Icons.checklist, "Checklist", false),
            _item(Icons.access_time, "Time Off", false),
          ],
        ));
  }

  Widget _item(IconData i, String t, bool a) => Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(color: a ? Colors.green : Colors.transparent, borderRadius: BorderRadius.circular(8)),
      child: ListTile(
          dense: true,
          leading: Icon(i, color: a ? Colors.white : Colors.grey),
          title: Text(t, style: TextStyle(color: a ? Colors.white : Colors.black87))));
}

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(8)),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Search...",
                    prefixIcon: Icon(Icons.search, size: 20),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 8, bottom: 8),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            const CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage('assets/images/f1.jpg'), // Asset Image 1
            )
          ],
        ));
  }
}

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Container(
            height: 100,
            decoration: const BoxDecoration(
              color: Color(0xFF2C3E50),
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Wrap( // Changed to Wrap to fix mobile overflow
              spacing: 20,
              runSpacing: 20,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/f2.png'), // Asset Image 2
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text("Jane Maria", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(color: Colors.green.withOpacity(0.1), borderRadius: BorderRadius.circular(6)),
                              child: const Text("Active", style: TextStyle(fontSize: 10, color: Colors.green, fontWeight: FontWeight.bold)),
                            )
                          ],
                        ),
                        const SizedBox(height: 4),
                        const Text("Senior Product Designer • Product Team", style: TextStyle(fontSize: 12, color: Colors.grey)),
                        const SizedBox(height: 8),
                        const Wrap(
                          spacing: 10,
                          runSpacing: 5,
                          children: [
                            Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.location_on, size: 14, color: Colors.grey), SizedBox(width: 4), Text("San Francisco, CA", style: TextStyle(fontSize: 11))]),
                            Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.email, size: 14, color: Colors.grey), SizedBox(width: 4), Text("jane@humanline.com", style: TextStyle(fontSize: 11))]),
                          ],
                        ),
                        const SizedBox(height: 4),
                        const Row(children: [Icon(Icons.phone, size: 14, color: Colors.grey), SizedBox(width: 4), Text("+1 (555) 000 1234", style: TextStyle(fontSize: 11))]),
                      ],
                    ),
                  ],
                ),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    _statBox("PROJECTS", "12", "2 Active"),
                    _statBox("EXPERIENCE", "5.4", "Years"),
                    _ratingBox(),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _statBox(String title, String value, String sub) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 80,
      decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Text(title, style: const TextStyle(fontSize: 9, color: Colors.grey)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(sub, style: const TextStyle(fontSize: 9, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _ratingBox() {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 80,
      decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          const Text("RATING", style: TextStyle(fontSize: 9, color: Colors.grey)),
          const SizedBox(height: 4),
          const Text("4.8", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.star, size: 10, color: Colors.orange),
              Icon(Icons.star, size: 10, color: Colors.orange),
              Icon(Icons.star, size: 10, color: Colors.orange),
              Icon(Icons.star, size: 10, color: Colors.orange),
              Icon(Icons.star_half, size: 10, color: Colors.orange),
            ],
          )
        ],
      ),
    );
  }
}

class GraphPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final grid = Paint()..color = Colors.grey.withOpacity(0.15)..strokeWidth = 1;
    for (int i = 1; i <= 4; i++) {
      double y = size.height * i / 5;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), grid);
    }

    final greenPaint = Paint()..color = Colors.green..strokeWidth = 3..style = PaintingStyle.stroke..strokeCap = StrokeCap.round;
    final greenPath = Path();
    greenPath.moveTo(0, size.height * 0.75);
    greenPath.cubicTo(size.width * 0.2, size.height * 0.6, size.width * 0.4, size.height * 0.65, size.width * 0.6, size.height * 0.5);
    greenPath.cubicTo(size.width * 0.8, size.height * 0.35, size.width, size.height * 0.4, size.width, size.height * 0.4);
    canvas.drawPath(greenPath, greenPaint);

    final fillPaint = Paint()..color = Colors.green.withOpacity(0.12)..style = PaintingStyle.fill;
    final fillPath = Path.from(greenPath)..lineTo(size.width, size.height)..lineTo(0, size.height)..close();
    canvas.drawPath(fillPath, fillPaint);

    final orangePaint = Paint()..color = Colors.orange..strokeWidth = 3..style = PaintingStyle.stroke..strokeCap = StrokeCap.round;
    final orangePath = Path();
    orangePath.moveTo(0, size.height * 0.85);
    orangePath.cubicTo(size.width * 0.2, size.height * 0.8, size.width * 0.4, size.height * 0.75, size.width * 0.6, size.height * 0.78);
    orangePath.cubicTo(size.width * 0.8, size.height * 0.65, size.width, size.height * 0.6, size.width, size.height * 0.6);
    canvas.drawPath(orangePath, orangePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}