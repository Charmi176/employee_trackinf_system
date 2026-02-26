import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  // 🔵 Controllers
  final TextEditingController companyController =
  TextEditingController(text: "Global Tech Solutions");

  final TextEditingController graceController =
  TextEditingController(text: "15");

  final TextEditingController breakController =
  TextEditingController(text: "60");

  final TextEditingController annualController =
  TextEditingController(text: "21");

  final TextEditingController sickController =
  TextEditingController(text: "12");

  TimeOfDay startTime = const TimeOfDay(hour: 9, minute: 0);
  TimeOfDay endTime = const TimeOfDay(hour: 18, minute: 0);

  bool gps = false;
  bool face = false;
  bool late = false;

  bool autoBreak = false;
  bool halfDay = false;

  String timeZone = "IST";

  bool pushNotification = false;
  bool emailNotification = false;
  bool attendanceAlert = false;

  bool tracking = false;
  bool screenshot = false;

  /////////////////////////////////////////////////////////

  String formatTime(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? "AM" : "PM";
    return "$hour:$minute $period";
  }

  /////////////////////////////////////////////////////////

  Future pickTime(bool isStart) async {
    TimeOfDay initial = isStart ? startTime : endTime;

    final picked = await showTimePicker(
      context: context,
      initialTime: initial,
    );

    if (picked != null) {
      setState(() {
        if (isStart) {
          startTime = picked;
        } else {
          endTime = picked;
        }
      });
    }
  }

  /////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [

              // 🔵 HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Text("Settings",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Icon(Icons.help_outline),
                ],
              ),

              const SizedBox(height: 10),

              /////////////////////////////////////////////////////////
              // 🔵 GENERAL SETTINGS
              /////////////////////////////////////////////////////////

              _card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    _title(Icons.business, "General Settings"),

                    const SizedBox(height: 10),

                    // 🔵 Company Name (same design)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Company Name",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        const SizedBox(height: 5),

                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEDEDED),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: companyController,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    isDense: true,
                                  ),
                                ),
                              ),
                              const Icon(Icons.business, size: 18, color: Colors.grey),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // 🔵 TIME ROW
                    Row(
                      children: [

                        Expanded(
                          child: GestureDetector(
                            onTap: () => pickTime(true),
                            child: _timeBoxNew("Start Time", startTime),
                          ),
                        ),

                        const SizedBox(width: 10),

                        Expanded(
                          child: GestureDetector(
                            onTap: () => pickTime(false),
                            child: _timeBoxNew("End Time", endTime),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // 🔵 Time Zone
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEDEDED),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: timeZone,
                          isExpanded: true,
                          items: ["Time Zone", "IST", "UTC", "EST"]
                              .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                              .toList(),
                          onChanged: (val) {
                            setState(() {
                              timeZone = val!;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              /////////////////////////////////////////////////////////
              // 🔵 ATTENDANCE SETTINGS
              /////////////////////////////////////////////////////////

              _card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    _title(Icons.location_on, "Attendance Settings"),

                    const SizedBox(height: 10),

                    _switchTile("GPS Tracking",
                        "Track employee location", gps,
                            (v) => setState(() => gps = v)),

                    _divider(),

                    _switchTile("Face Recognition",
                        "Verify identity", face,
                            (v) => setState(() => face = v)),

                    _divider(),

                    _switchTile("Allow Late Entry",
                        "", late,
                            (v) => setState(() => late = v)),

                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Grace Time (Minutes)"),
                        SizedBox(
                          width: 80,
                          child: TextField(
                            controller: graceController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              suffixText: "min",
                              border: InputBorder.none,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              /////////////////////////////////////////////////////////
              // 🔵 BREAK SETTINGS
              /////////////////////////////////////////////////////////

              _card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    _title(Icons.coffee, "Break Settings"),

                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        const Text(
                          "Total Break Time Allowed",
                          style: TextStyle(fontSize: 14),
                        ),

                        Container(
                          width: 90,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [

                              // 🔵 Editable Value
                              Expanded(
                                child: TextField(
                                  controller: breakController,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  onChanged: (val) {
                                    if (val.isEmpty) {
                                      breakController.text = "0";
                                    }
                                  },
                                ),
                              ),

                              const Text(
                                " min",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    _switchTile(
                      "Auto Break Deduction",
                      "Automatically deduct 1 hour after 5 hours",
                      autoBreak,
                          (v) => setState(() => autoBreak = v),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              /////////////////////////////////////////////////////////
              // 🔵 LEAVE SETTINGS
              /////////////////////////////////////////////////////////

              _card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    _title(Icons.event_note, "Leave Settings"),

                    const SizedBox(height: 10),

                    Row(
                      children: [
                        Expanded(
                          child: _leaveBox("Annual Limit", annualController),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _leaveBox("Sick Limit", sickController),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    _switchTile(
                      "Allow Half Day Leave",
                      "",
                      halfDay,
                          (v) => setState(() => halfDay = v),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),

// 🔵 NOTIFICATION SETTINGS
              _card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    _title(Icons.notifications_none, "Notification Settings"),

                    const SizedBox(height: 12),

                    _switchTile(
                      "Push Notifications",
                      "",
                      pushNotification,
                          (v) => setState(() => pushNotification = v),
                    ),

                    _divider(),

                    _switchTile(
                      "Email Notifications",
                      "",
                      emailNotification,
                          (v) => setState(() => emailNotification = v),
                    ),

                    _divider(),

                    _switchTile(
                      "Attendance Alerts",
                      "Notify HR on late arrivals",
                      attendanceAlert,
                          (v) => setState(() => attendanceAlert = v),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

// 🔵 SECURITY SETTINGS
              _card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    _title(Icons.security, "Security Settings"),

                    const SizedBox(height: 12),

                    _switchTile(
                      "Continuous Tracking",
                      "Periodic location pings during work hours",
                      tracking,
                          (v) => setState(() => tracking = v),
                    ),

                    _divider(),

                    _switchTile(
                      "Screenshot Restriction",
                      "Prevent screen capture in the app",
                      screenshot,
                          (v) => setState(() => screenshot = v),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

// 🔵 SAVE BUTTON
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Settings Saved")),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.save, color: Colors.white, size: 18),
                      SizedBox(width: 8),
                      Text(
                        "Save Settings",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),

// 🔵 LAST SYNCED
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.check_circle_outline, size: 16, color: Colors.green),
                  SizedBox(width: 6),
                  Text(
                    "Last synced: Today at 10:45 AM",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  /////////////////////////////////////////////////////////

  Widget _card({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: child,
    );
  }

  Widget _title(IconData icon, String text) {
    return Row(
      children: [

        // 🔵 Icon Background Box (important)
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: const Color(0xFFEDEDED),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(
            icon,
            size: 16,
            color: Colors.black87,
          ),
        ),

        const SizedBox(width: 10),

        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget _timeBoxNew(String label, TimeOfDay time) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFEDEDED),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            label,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),

          const SizedBox(height: 6),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                formatTime(time),
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              const Icon(Icons.access_time, size: 16, color: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }

  Widget _switchTile(String title, String sub, bool value,
      Function(bool) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Switch(value: value, onChanged: onChanged),
          ],
        ),
        if (sub.isNotEmpty)
          Text(sub, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }

  Widget _leaveBox(String title, TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(fontSize: 12, color: Colors.grey)),
          const SizedBox(height: 5),
          TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return const Divider(height: 20);
  }
}
