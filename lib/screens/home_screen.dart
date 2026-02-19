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
                        CircleIcon(
                          icon: Icons.menu,
                          isSelected: selectedIndex == 2,
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

                const SizedBox(height: 20),

                RecruitmentCard(isDark: isDark),

                const SizedBox(height: 20),

                PayrollChartCard(isDark: isDark),

                const SizedBox(height: 20),

                AttendanceCard(isDark: isDark),

                const SizedBox(height: 20),

                BirthdayCard(isDark: isDark),


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

//////////////////////////////////////////////////////////

class RecruitmentCard extends StatelessWidget {
  final bool isDark;

  const RecruitmentCard({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[900] : Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("Recruitment Overview",
              style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 20),

          RecruitmentItem("Product Designer", "56", "30", "27", "3"),
          SizedBox(height: 15),

          RecruitmentItem("Software Engineer", "17", "15", "13", "2"),
          SizedBox(height: 15),

          RecruitmentItem("Web Developer", "41", "35", "31", "4"),
          SizedBox(height: 15),

          RecruitmentItem("UI Designer", "24", "23", "18", "5"),
        ],
      ),
    );
  }
}

class RecruitmentItem extends StatelessWidget {
  final String title, inbox, interview, rejected, hired;

  const RecruitmentItem(
      this.title, this.inbox, this.interview, this.rejected, this.hired,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            Row(
              children: [
                Text("$inbox Inbox   "),
                Text("$interview Interviewed   "),
                Text("$interview Interviewed   "),
                Text("$rejected Rejected"),
              ],
            )
          ],
        ),
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(6)),
          child: Text("$hired Hired",
              style: const TextStyle(color: Colors.blue)),
        )


      ],
    );
  }
}
class PayrollChartCard extends StatelessWidget {
  final bool isDark;

  const PayrollChartCard({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[900] : Colors.white,
        borderRadius: BorderRadius.circular(25), // Rounded Corners
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            color: Colors.black.withValues(alpha: 0.05),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔵 Header Text (Monthly Payroll & Overtime)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildHeaderInfo("MONTHLY PAYROLL", "\$3,230,250.00", isDark),
              _buildHeaderInfo("OVERTIME", "\$150,00.00", isDark),
            ],
          ),
          const SizedBox(height: 20),

          // 🔵 Legend (Monthly, Overtime, Bonuses)
           Row(
            children: [
              LegendItem(color: Colors.blue, text: "Monthly"),
              SizedBox(width: 15),
              LegendItem(color: Colors.purpleAccent, text: "Overtime"),
              SizedBox(width: 15),
              LegendItem(color: Colors.pinkAccent, text: "Bonuses"),
            ],
          ),
          const SizedBox(height: 30),

          // 🔵 Bar Chart
          SizedBox(
            height: 200,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 250,
                barTouchData: BarTouchData(enabled: false),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) => Text(
                        "\$${value.toInt()}",
                        style: const TextStyle(color: Colors.grey, fontSize: 10),
                      ),
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const months = ['Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
                        return Text(
                          months[value.toInt() % months.length],
                          style: const TextStyle(color: Colors.grey, fontSize: 10),
                        );
                      },
                    ),
                  ),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                gridData: const FlGridData(show: true, drawVerticalLine: false),
                borderData: FlBorderData(show: false),
                barGroups: _generateBarGroups(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderInfo(String title, String value, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: Colors.blueGrey, fontSize: 12, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDark ? Colors.white : Colors.black)),
      ],
    );
  }

  List<BarChartGroupData> _generateBarGroups() {
    // આ ડેટા તમે તમારા મુજબ બદલી શકો છો
    final List<List<double>> data = [
      [100, 50, 20], [150, 70, 30], [130, 60, 25], [170, 80, 35],
      [140, 65, 30], [200, 90, 40], [180, 85, 38], [220, 100, 45], [250, 110, 50]
    ];

    return List.generate(data.length, (i) {
      return BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(toY: data[i][0], color: Colors.blue, width: 6, borderRadius: BorderRadius.circular(2)),
          BarChartRodData(toY: data[i][1], color: Colors.purpleAccent.withValues(alpha: 0.6), width: 6, borderRadius: BorderRadius.circular(2)),
          BarChartRodData(toY: data[i][2], color: Colors.pinkAccent.withValues(alpha: 0.6), width: 6, borderRadius: BorderRadius.circular(2)),
        ],
      );
    });
  }
}
class LegendItem extends StatelessWidget {
  final Color color;
  final String text;

  const LegendItem({
    super.key,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
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
class AttendanceCard extends StatelessWidget {
  final bool isDark;

  const AttendanceCard({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[900] : Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            blurRadius: 12,
            color: Colors.black.withOpacity(0.05),
          )
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // 🔵 Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Attendance Overview",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: const Text(
                  "View Details",
                  style: TextStyle(fontSize: 12),
                ),
              )
            ],
          ),

          const SizedBox(height: 20),

          // 🔵 Table Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Expanded(child: Text("Employee Name",
                  style: TextStyle(color: Colors.grey))),
              Expanded(child: Text("Designation",
                  style: TextStyle(color: Colors.grey))),
              Expanded(child: Text("Type",
                  style: TextStyle(color: Colors.grey))),
              Expanded(child: Text("Check In Time",
                  style: TextStyle(color: Colors.grey))),
              Text("Status",
                  style: TextStyle(color: Colors.grey)),
            ],
          ),

          const SizedBox(height: 15),

          // 🔵 List
          AttendanceItem(
            name: "Leasie Watson",
            role: "Team Lead Design",
            type: "Office",
            time: "09:27 AM",
            isLate: false,
            image: "assets/images/f1.jpg",
          ),

          AttendanceItem(
            name: "Darlene Robertson",
            role: "Web Designer",
            type: "Office",
            time: "10:15 AM",
            isLate: true,
            image: "assets/images/f4.png",
          ),

          AttendanceItem(
            name: "Jacob Jones",
            role: "Medical Assistant",
            type: "Remote",
            time: "10:24 AM",
            isLate: true,
            image: "assets/images/f3.jpg",
          ),

          AttendanceItem(
            name: "Kathryn Murphy",
            role: "Marketing Coordinator",
            type: "Office",
            time: "09:10 AM",
            isLate: false,
            image: "assets/images/f5.png",
          ),

          AttendanceItem(
            name: "Leslie Alexander",
            role: "Data Analyst",
            type: "Office",
            time: "09:15 AM",
            isLate: false,
            image: "assets/images/f2.png",
          ),

          const SizedBox(height: 15),

          // 🔵 Bottom Scroll Bar
          Container(
            height: 6,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          )
        ],
      ),
    );
  }
}
class AttendanceItem extends StatelessWidget {
  final String name;
  final String role;
  final String type;
  final String time;
  final bool isLate;
  final String image;

  const AttendanceItem({
    super.key,
    required this.name,
    required this.role,
    required this.type,
    required this.time,
    required this.isLate,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage(image),
          ),

          // 🔵 Profile + Name
          Expanded(
            child: Row(
              children: [


                const SizedBox(width: 8),

                Expanded(
                  child: Text(
                    name,
                    style: const TextStyle(fontSize: 13),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),

          // 🔵 Role
          Expanded(
            child: Text(
              role,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),

          // 🔵 Type
          Expanded(
            child: Text(
              type,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),

          // 🔵 Time
          Expanded(
            child: Text(
              time,
              style: const TextStyle(fontSize: 12),
            ),
          ),

          // 🔵 Status
          Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: isLate
                  ? Colors.red.withOpacity(0.1)
                  : Colors.green.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              isLate ? "Late" : "On Time",
              style: TextStyle(
                color: isLate ? Colors.red : Colors.green,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class BirthdayCard extends StatelessWidget {
  final bool isDark;

  const BirthdayCard({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),

        // 🔵 Gradient Background (same UI)
        gradient: LinearGradient(
          colors: isDark
              ? [Colors.grey.shade800, Colors.grey.shade900]
              : [Color(0xFFE9EDF7), Color(0xFFDDE3F2)],
        ),

        boxShadow: [
          BoxShadow(
            blurRadius: 12,
            color: Colors.black.withOpacity(0.05),
          )
        ],
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          // 👈 LEFT SIDE
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                children: [

                  // 👤 Profile Image
                  CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage("assets/images/f1.jpg"),
                  ),

                  const SizedBox(width: 10),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mehjabin Rahman",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Has Birthday Today",
                        style: TextStyle(
                          color: isDark ? Colors.white60 : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // 🔵 Wish Button
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "Wish Her",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),

          // 👉 RIGHT SIDE ICON
          Stack(
            children: [

              // 🎂 Cake Icon
              Icon(
                Icons.cake,
                size: 180,
                color: isDark
                    ? Colors.white.withOpacity(0.2)
                    : Colors.grey.withOpacity(0.4),
              ),

              // 🟡 Yellow Dot
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
