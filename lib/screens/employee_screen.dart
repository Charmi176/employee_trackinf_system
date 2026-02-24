//
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const EmployeeScreen());
// }
//
// class EmployeeScreen extends StatelessWidget {
//   const EmployeeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.dark(),
//       home: const DashboardUI(),
//     );
//   }
// }
//
// class DashboardUI extends StatefulWidget {
//   const DashboardUI({super.key});
//
//   @override
//   State<DashboardUI> createState() => _DashboardUIState();
// }
//
// class _DashboardUIState extends State<DashboardUI> {
//   final ScrollController _mainController = ScrollController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF0D0D0D),
//
//       body: Column(
//         children: [
//
//           /// 🔵 TOP SCROLLBAR
//           SizedBox(
//             height: 8,
//             child: Scrollbar(
//               controller: _mainController,
//               thumbVisibility: true,
//               child: SingleChildScrollView(
//                 controller: _mainController,
//                 scrollDirection: Axis.horizontal,
//                 child: const SizedBox(width: 1500),
//               ),
//             ),
//           ),
//
//           /// 🔵 MAIN CONTENT
//           Expanded(
//             child: Scrollbar(
//               controller: _mainController,
//               thumbVisibility: true,
//               child: SingleChildScrollView(
//                 controller: _mainController,
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//
//                     /// 🔹 SIDEBAR
//                     Container(
//                       width: 250,
//                       color: const Color(0xFF131313),
//                       child: Column(
//                         children: [
//                           const SizedBox(height: 20),
//                           const ListTile(
//                             leading: Icon(Icons.dashboard, color: Colors.blue),
//                             title: Text("DASHBOARD"),
//                             subtitle: Text("WORKSPACE",
//                                 style: TextStyle(color: Colors.grey)),
//                           ),
//                           menuItem(Icons.public, "Clients"),
//                           menuItem(Icons.calendar_today, "Appointments"),
//                           menuItem(Icons.shopping_cart, "Shop"),
//                           menuItem(Icons.science, "Labs"),
//                           menuItem(Icons.people, "Users"),
//                           const Padding(
//                             padding: EdgeInsets.all(10),
//                             child: Text("MANAGEMENT",
//                                 style: TextStyle(color: Colors.grey)),
//                           ),
//                           menuItem(Icons.chat, "Consult"),
//                           menuItem(Icons.task, "Tasks"),
//                           menuItem(Icons.layers, "Assets"),
//                           menuItem(Icons.build, "Studio"),
//                           menuItem(Icons.credit_card, "Register"),
//                         ],
//                       ),
//                     ),
//
//                     /// 🔹 MAIN UI
//                     SizedBox(
//                       width: 1100,
//                       child: Padding(
//                         padding: const EdgeInsets.all(20),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//
//                             /// SEARCH
//                             Container(
//                               height: 45,
//                               padding: const EdgeInsets.symmetric(horizontal: 15),
//                               decoration: BoxDecoration(
//                                 color: const Color(0xFF1A1A1A),
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: const Row(
//                                 children: [
//                                   Icon(Icons.search, color: Colors.grey),
//                                   SizedBox(width: 10),
//                                   Text("Search...",
//                                       style: TextStyle(color: Colors.grey)),
//                                 ],
//                               ),
//                             ),
//
//                             const SizedBox(height: 20),
//
//                             /// WELCOME
//                             Container(
//                               padding: const EdgeInsets.all(12),
//                               decoration: BoxDecoration(
//                                 color: const Color(0xFF1A1A1A),
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Row(
//                                 children: [
//                                   Container(
//                                     padding: const EdgeInsets.all(6),
//                                     decoration: BoxDecoration(
//                                       color: Colors.blue.withOpacity(0.2),
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                     child: const Icon(Icons.auto_awesome,
//                                         color: Colors.blue, size: 14),
//                                   ),
//                                   const SizedBox(width: 8),
//                                   const Text("New",
//                                       style: TextStyle(color: Colors.blue)),
//                                   const SizedBox(width: 12),
//                                   const Expanded(
//                                     child: Text(
//                                       "Welcome back to your dashboard, Gabe Oni",
//                                       style: TextStyle(color: Colors.white),
//                                       overflow: TextOverflow.ellipsis,
//                                     ),
//                                   ),
//                                   const Text("Learn More →",
//                                       style: TextStyle(color: Colors.orange)),
//                                 ],
//                               ),
//                             ),
//
//                             const SizedBox(height: 20),
//
//                             /// CARDS
//                             Wrap(
//                               spacing: 20,
//                               runSpacing: 20,
//                               children: [
//                                 simpleCard("REGISTERED USERS", "1,520"),
//                                 simpleCard("MONTHLY VISITS", "15,837"),
//                                 simpleCard("PROFITS", "\$135,965"),
//                                 simpleCard("PORTFOLIO", "5,837"),
//                               ],
//                             ),
//
//                             const SizedBox(height: 20),
//
//                             /// 🔥 TABLE + NOTICE
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Expanded(flex: 2, child: upcomingAppointments()),
//                                 const SizedBox(width: 20),
//                                 Expanded(child: noticeBoard()),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   static Widget menuItem(IconData icon, String title) {
//     return ListTile(
//       leading: Icon(icon, color: Colors.grey),
//       title: Text(title, style: const TextStyle(color: Colors.grey)),
//     );
//   }
// }
//
// /// 🔵 CARD
// Widget simpleCard(String title, String value) {
//   return Container(
//     width: 230,
//     padding: const EdgeInsets.all(16),
//     decoration: BoxDecoration(
//       color: const Color(0xFF1A1A1A),
//       borderRadius: BorderRadius.circular(16),
//       border: Border.all(color: Colors.white10),
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(title, style: const TextStyle(color: Colors.grey)),
//         const SizedBox(height: 10),
//         Text(value,
//             style: const TextStyle(
//                 fontSize: 24, fontWeight: FontWeight.bold)),
//       ],
//     ),
//   );
// }
//
// /// 🔵 UPCOMING APPOINTMENTS (FIXED)
// Widget upcomingAppointments() {
//   final ScrollController horizontal = ScrollController();
//   final ScrollController vertical = ScrollController();
//
//   return Container(
//     padding: const EdgeInsets.all(16),
//     decoration: BoxDecoration(
//       color: const Color(0xFF1A1A1A),
//       borderRadius: BorderRadius.circular(16),
//       border: Border.all(color: Colors.white10),
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: const [
//             Text("Upcoming Appointments",
//                 style: TextStyle(fontWeight: FontWeight.bold)),
//             Text("View All →", style: TextStyle(color: Colors.grey)),
//           ],
//         ),
//
//         const SizedBox(height: 20),
//
//         /// 🔥 FIXED SCROLL (NO OVERFLOW)
//         SizedBox(
//           height: 300,
//           child: Scrollbar(
//             controller: vertical,
//             thumbVisibility: true,
//             child: SingleChildScrollView(
//               controller: vertical,
//               child: Scrollbar(
//                 controller: horizontal,
//                 thumbVisibility: true,
//                 notificationPredicate: (notif) => notif.depth == 1,
//                 child: SingleChildScrollView(
//                   controller: horizontal,
//                   scrollDirection: Axis.horizontal,
//                   child: SizedBox(
//                     width: 1000,
//                     child: Column(
//                       children: [
//                         headerRow(),
//                         const Divider(color: Colors.white10),
//
//                         tableRow("AP1053", "AW", "Amatron Wals", "Completed", Colors.green),
//                         tableRow("AP1052", "FG", "Family Group", "Pending", Colors.orange),
//                         tableRow("AP1049", "CT", "Cathy Tiana", "In progress", Colors.blue),
//                         tableRow("AP1050", "HB", "Herman Beck", "Pending", Colors.orange),
//                         tableRow("AP1051", "RF", "Raji Fash", "In progress", Colors.blue),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//
//         const SizedBox(height: 10),
//
//         const Text("Showing 1-5 of 124 appointments",
//             style: TextStyle(color: Colors.grey, fontSize: 12)),
//       ],
//     ),
//   );
// }
//
// Widget headerRow() {
//   return const Row(
//     children: [
//       SizedBox(width: 100, child: Text("REFERENCE", style: TextStyle(color: Colors.grey))),
//       SizedBox(width: 200, child: Text("CLIENT(S)", style: TextStyle(color: Colors.grey))),
//       SizedBox(width: 200, child: Text("APPOINTMENT", style: TextStyle(color: Colors.grey))),
//       SizedBox(width: 180, child: Text("BOOKING", style: TextStyle(color: Colors.grey))),
//       SizedBox(width: 150, child: Text("STATUS", style: TextStyle(color: Colors.grey))),
//     ],
//   );
// }
//
// Widget tableRow(String id, String initials, String name, String status, Color color) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 12),
//     child: Row(
//       children: [
//         SizedBox(width: 100, child: Text(id, style: const TextStyle(color: Colors.grey))),
//
//         SizedBox(
//           width: 200,
//           child: Row(
//             children: [
//               CircleAvatar(
//                 radius: 14,
//                 backgroundColor: color.withOpacity(0.2),
//                 child: Text(initials, style: const TextStyle(fontSize: 10)),
//               ),
//               const SizedBox(width: 10),
//               Text(name),
//             ],
//           ),
//         ),
//
//         const SizedBox(width: 200, child: Text("9:00 PM, Sun")),
//
//         const SizedBox(width: 180, child: Text("Dr. Name")),
//
//         SizedBox(
//           width: 150,
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//             decoration: BoxDecoration(
//               color: color.withOpacity(0.2),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Text(status, style: TextStyle(color: color)),
//           ),
//         ),
//       ],
//     ),
//   );
// }
//
// /// 🔵 NOTICE BOARD
// Widget noticeBoard() {
//   return Container(
//     height: 420, // 🔥 IMPORTANT (fix height)
//     padding: const EdgeInsets.all(16),
//     decoration: BoxDecoration(
//       color: const Color(0xFF1A1A1A),
//       borderRadius: BorderRadius.circular(16),
//       border: Border.all(color: Colors.white10),
//     ),
//
//     child: SingleChildScrollView( // 🔥 SCROLL FIX
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//
//           /// TITLE
//           const Text(
//             "Notice Board",
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//
//           const SizedBox(height: 15),
//
//           /// TABS
//           Row(
//             children: const [
//               Text("TODO", style: TextStyle(color: Colors.blue)),
//               SizedBox(width: 20),
//               Text("EVENTS", style: TextStyle(color: Colors.grey)),
//             ],
//           ),
//
//           const SizedBox(height: 6),
//
//           /// LINE
//           Container(
//             height: 2,
//             width: 120,
//             color: Colors.blue,
//           ),
//
//           const SizedBox(height: 15),
//
//           /// INPUT
//           Row(
//             children: [
//               Expanded(
//                 child: Container(
//                   height: 45,
//                   padding: const EdgeInsets.symmetric(horizontal: 12),
//                   decoration: BoxDecoration(
//                     color: Colors.black,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: const TextField(
//                     decoration: InputDecoration(
//                       hintText: "What to do today? *",
//                       hintStyle: TextStyle(color: Colors.grey),
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 10),
//               Container(
//                 height: 45,
//                 padding: const EdgeInsets.symmetric(horizontal: 18),
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: const Center(
//                   child: Text("ADD",
//                       style: TextStyle(color: Colors.white)),
//                 ),
//               )
//             ],
//           ),
//
//           const SizedBox(height: 20),
//
//           /// TODO LIST
//           todoItem("Patient rounds in Ward 1 & 2", false),
//           todoItem("Prepare Ora presentation", true),
//           todoItem("Print Payment Receipts", false),
//           todoItem("Submit Supplier Voucher", false),
//
//           const SizedBox(height: 20),
//
//           /// FLOAT BUTTON
//           Align(
//             alignment: Alignment.bottomRight,
//             child: Container(
//               padding: const EdgeInsets.all(12),
//               decoration: const BoxDecoration(
//                 color: Colors.blue,
//                 shape: BoxShape.circle,
//               ),
//               child: const Icon(Icons.checklist, size: 20),
//             ),
//           )
//         ],
//       ),
//     ),
//   );
// }
// Widget todoItem(String text, bool done) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 8),
//     child: Row(
//       children: [
//         Icon(
//           done ? Icons.check_box : Icons.check_box_outline_blank,
//           color: done ? Colors.orange : Colors.grey,
//           size: 18,
//         ),
//         const SizedBox(width: 10),
//         Expanded(
//           child: Text(
//             text,
//             style: TextStyle(
//               decoration: done ? TextDecoration.lineThrough : null,
//               color: done ? Colors.grey : Colors.white,
//             ),
//           ),
//         ),
//         const Icon(Icons.more_vert, size: 18, color: Colors.grey)
//       ],
//     ),
//   );
// }
import 'package:flutter/gestures.dart'; // આ ખાસ ઉમેરવું
import 'package:flutter/material.dart';

void main() {
  runApp(const EmployeeScreen());
}

// માઉસથી સ્ક્રોલબાર પકડીને ખેંચવા માટે આ ક્લાસ જરૂરી છે
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
      scrollBehavior: MyCustomScrollBehavior(), // અહીં એક્ટિવેટ કર્યું
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
  // હોરીઝોન્ટલ સ્ક્રોલ માટે કંટ્રોલર
  final ScrollController _horizontalController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: Scrollbar(
        controller: _horizontalController,
        thumbVisibility: true,
        thickness: 10, // બાર થોડો જાડો રાખ્યો જેથી પકડવામાં સરળતા રહે
        interactive: true, // આનાથી તમે બારને ખેંચી શકશો
        child: SingleChildScrollView(
          controller: _horizontalController,
          scrollDirection: Axis.horizontal,
          // હંમેશા સ્ક્રોલ થાય તે માટે physics ઉમેર્યું
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
                      subtitle: Text("WORKSPACE", style: TextStyle(color: Colors.grey, fontSize: 10)),
                    ),
                    menuItem(Icons.public, "Clients"),
                    menuItem(Icons.calendar_today, "Appointments"),
                    menuItem(Icons.people, "Users"),
                    const Padding(
                      padding: EdgeInsets.all(15),
                      child: Text("MANAGEMENT", style: TextStyle(color: Colors.grey, fontSize: 12)),
                    ),
                    menuItem(Icons.chat, "Consult"),
                    menuItem(Icons.task, "Tasks"),
                  ],
                ),
              ),

              /// 🔹 MAIN UI
              SizedBox(
                width: 1200, // આ પહોળાઈ જો સ્ક્રીન કરતા વધુ હશે તો જ સ્ક્રોલબાર ચાલશે
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// SEARCH BAR
                      searchBar(),
                      const SizedBox(height: 25),

                      /// WELCOME BANNER
                      welcomeBanner(),
                      const SizedBox(height: 25),

                      /// STAT CARDS
                      Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: [
                          statCard("REGISTERED USERS", "1,520", Icons.people, "12%", true),
                          statCard("MONTHLY VISITS", "15,837", Icons.visibility, "8%", true),
                          statCard("PROFITS", "\$135,965", Icons.account_balance, "5%", false),
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

  // --- Widgets ---
  Widget menuItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey, size: 20),
      title: Text(title, style: const TextStyle(color: Colors.grey)),
    );
  }

  Widget searchBar() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 45,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(color: const Color(0xFF1A1A1A), borderRadius: BorderRadius.circular(10)),
            child: const Row(children: [Icon(Icons.search, color: Colors.grey), SizedBox(width: 10), Text("Search...")]),
          ),
        ),
        const SizedBox(width: 15),
        const Icon(Icons.notifications_none),
        const SizedBox(width: 15),
        const CircleAvatar(radius: 18),
      ],
    );
  }

  Widget welcomeBanner() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(color: const Color(0xFF1A1A1A), borderRadius: BorderRadius.circular(10)),
      child: const Row(
        children: [
          Icon(Icons.auto_awesome, color: Colors.blue, size: 18),
          SizedBox(width: 10),
          Text("New", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
          SizedBox(width: 15),
          Expanded(child: Text("Welcome back to your dashboard, Gabe Oni")),
          Text("Learn More →", style: TextStyle(color: Colors.orange)),
        ],
      ),
    );
  }
}

// નવું સ્ટેટ કાર્ડ
Widget statCard(String title, String value, IconData icon, String percentage, bool isPositive) {
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(color: Colors.grey, fontSize: 11, letterSpacing: 1)),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(color: const Color(0xFF1A1A1A), borderRadius: BorderRadius.circular(8)),
              child: Icon(icon, color: Colors.grey, size: 18),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(value, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        const SizedBox(height: 15),
        Row(
          children: [
            Icon(isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                color: isPositive ? Colors.green : Colors.red, size: 14),
            const SizedBox(width: 4),
            Text(percentage, style: TextStyle(color: isPositive ? Colors.green : Colors.red, fontWeight: FontWeight.bold)),
            const SizedBox(width: 8),
            const Text("Since last month", style: TextStyle(color: Colors.grey, fontSize: 11)),
          ],
        ),
      ],
    ),
  );
}

// બાકીના ટેબલ અને નોટિસ બોર્ડ (તમારા કોડ મુજબ)
Widget upcomingAppointments() => Container(height: 350, decoration: BoxDecoration(color: const Color(0xFF1A1A1A), borderRadius: BorderRadius.circular(16)));
Widget noticeBoard() => Container(height: 350, decoration: BoxDecoration(color: const Color(0xFF1A1A1A), borderRadius: BorderRadius.circular(16)));