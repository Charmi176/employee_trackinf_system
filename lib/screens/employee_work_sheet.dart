import 'package:flutter/material.dart';

class WorkLogScreen extends StatelessWidget {
  const WorkLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Work Logs",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Track your daily productivity",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.black,
                    child: Text("JD", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// STAT CARDS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  StatCard(icon: Icons.access_time, value: "164h", label: "This Month"),
                  StatCard(icon: Icons.check_circle, value: "12", label: "Tasks Done", color: Colors.green),
                  StatCard(icon: Icons.coffee, value: "45m", label: "Avg Break", color: Colors.brown),
                ],
              ),

              const SizedBox(height: 20),

              /// WEEKLY CHART
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Weekly Productivity",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        BarItem(100, "M"),
                        BarItem(80, "T"),
                        BarItem(110, "W"),
                        BarItem(95, "T"),
                        BarItem(70, "F"),
                        BarItem(0, "S"),
                        BarItem(0, "S"),
                      ],
                    )
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// RECENT LOGS TITLE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Recent Logs",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "View All",
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              /// MONDAY CARD
              const WorkLogCard(
                date: "15 Dec 2025",
                day: "Monday",
                status: "Completed",
                statusColor: Colors.green,
                checkIn: "10:00 AM",
                checkOut: "07:00 PM",
                lunch: "01:00 - 02:30",
                hours: "8.0 hrs",
                taskTitle: "Task: User Management",
                taskDesc: "Basic dart programming and implementation of user authentication flows.",
              ),

              const SizedBox(height: 15),

              /// SUNDAY
              const WorkLogCard(
                date: "14 Dec 2025",
                day: "Sunday",
                status: "Weekend",
                statusColor: Colors.brown,
                checkIn: "--:--",
                checkOut: "--:--",
                lunch: "--:--",
                hours: "0.0 hrs",
                taskTitle: "Task: N/A",
                taskDesc: "No tasks assigned for the weekend.",
              ),
              const SizedBox(height: 15),

              /// SATURDAY
              const WorkLogCard(
                date: "13 Dec 2025",
                day: "Saturday",
                status: "Completed",
                statusColor: Colors.green,
                checkIn: "09:30 AM",
                checkOut: "05:30 PM",
                lunch: "01:00 - 02:00",
                hours: "7.0 hrs",
                taskTitle: "Task: Database Schema",
                taskDesc: "Optimizing Supabase RLS policies and table relationships.",
              ),

              const SizedBox(height: 25),

              /// BUTTON
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text("Log Today"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// ================= WIDGETS =================

class StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const StatCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, color: color),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class BarItem extends StatelessWidget {
  final double height;
  final String label;

  const BarItem(this.height, this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: height,
          width: 21,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(color: Colors.black54),
        ),
      ],
    );
  }
}

class WorkLogCard extends StatelessWidget {
  final String date, day, status, checkIn, checkOut, lunch, hours, taskTitle, taskDesc;
  final Color statusColor;

  const WorkLogCard({
    super.key,
    required this.date,
    required this.day,
    required this.status,
    required this.statusColor,
    required this.checkIn,
    required this.checkOut,
    required this.lunch,
    required this.hours,
    required this.taskTitle,
    required this.taskDesc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date,
                style: const TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 5),

          Text(
            day,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          const Divider(color: Colors.black12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              info("Check In", checkIn),
              info("Check Out", checkOut),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              info("Lunch Break", lunch),
              info("Working Hours", hours),
            ],
          ),

          const SizedBox(height: 15),

          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskTitle,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  taskDesc,
                  style: const TextStyle(
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget info(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 12,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}