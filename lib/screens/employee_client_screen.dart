import 'package:flutter/material.dart';

class ClientScreen extends StatefulWidget {
  const ClientScreen({super.key});

  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {

  DateTime selectedDate = DateTime.now();

  List<Map<String, dynamic>> appointments = [
    {"time": TimeOfDay(hour: 9, minute: 0), "name": "Sarah Jenkins", "service": "Hair Styling", "status": "Pending"},
    {"time": TimeOfDay(hour: 10, minute: 30), "name": "Michael Chen", "service": "Consultation", "status": "Pending"},
    {"time": TimeOfDay(hour: 13, minute: 0), "name": "Emma Wilson", "service": "Manicure", "status": "Pending"},
    {"time": TimeOfDay(hour: 14, minute: 30), "name": "David Miller", "service": "Massage Therapy", "status": "Cancelled"},
    {"time": TimeOfDay(hour: 16, minute: 0), "name": "Jessica Taylor", "service": "Facial Treatment", "status": "Pending"},
    {"time": TimeOfDay(hour: 11, minute: 0), "name": "Robert Brown", "service": "Haircut", "status": "Pending"},
  ];

  // 📅 Date Picker
  Future<void> pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // ⏰ Time Picker
  Future<void> pickTime(int index) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: appointments[index]["time"],
    );

    if (picked != null) {
      setState(() {
        appointments[index]["time"] = picked;
      });
    }
  }

  String formatDate(DateTime date) {
    return "${date.day}-${date.month}-${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),

      appBar: AppBar(
        backgroundColor: const Color(0xFF131313),
        elevation: 0,
        title: const Text("Appointments"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {},
              child: const Text("Book Now"),
            ),
          ),
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [

          /// 🔹 DATE SELECT
          GestureDetector(
            onTap: pickDate,
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.calendar_today, color: Colors.grey),
                  const SizedBox(width: 10),
                  Text(formatDate(selectedDate)),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          /// 🔹 FILTER
          Row(
            children: [
              filterBtn("Upcoming", true),
              filterBtn("Complete", false),
              filterBtn("Cancelled", false),
              filterBtn("All", false),
            ],
          ),

          const SizedBox(height: 20),

          /// 🔹 LIST
          ...List.generate(appointments.length, (index) {
            return appointmentCard(index);
          }),

          const SizedBox(height: 80), // 🔥 bottom space
        ],
      ),

      /// 🔥 FLOATING BUTTON
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10, right: 5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFC98B73), // 🔥 same color
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 0,
            ),
            onPressed: () {},
            icon: const Icon(Icons.add, size: 18),
            label: const Text(
              "Book Appointment",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }

  Widget filterBtn(String text, bool isActive) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? Colors.white24 : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white12),
      ),
      child: Text(text, style: const TextStyle(fontSize: 12)),
    );
  }

  Widget appointmentCard(int index) {

    var item = appointments[index];

    Color statusColor =
    item["status"] == "Cancelled" ? Colors.red : Colors.orange;

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [

          /// 🔹 TIME CLICK
          GestureDetector(
            onTap: () => pickTime(index),
            child: Column(
              children: [
                Text(
                  item["time"].format(context),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  "${selectedDate.day}/${selectedDate.month}",
                  style: const TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ],
            ),
          ),

          const SizedBox(width: 20),

          /// 🔹 DETAILS
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item["name"], style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(item["service"], style: const TextStyle(color: Colors.grey, fontSize: 12)),
                const SizedBox(height: 5),
                Text(item["status"], style: TextStyle(color: statusColor, fontSize: 11)),
              ],
            ),
          ),

          const Icon(Icons.calendar_today, size: 16, color: Colors.grey)
        ],
      ),
    );
  }
}