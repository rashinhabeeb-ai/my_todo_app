import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  int _selectedBottomNavIndex = 1; // "Calendar" active
  int _selectedDay = 24;

  final List<Map<String, dynamic>> _tasks = [
    {
      'title': 'Client Presentation Deck',
      'subtitle': 'Review finalized slides for the Q4 strategy meeting.',
      'time': '09:00 AM',
      'tag': 'Work',
      'tagBgColor': const Color(0xFFFFEDD5),
      'tagTextColor': const Color(0xFFC2410C),
      'isCompleted': false,
    },
    {
      'title': 'Weekly Team Standup',
      'subtitle': 'Status updates on sprint #42 and blocker removal.',
      'time': '11:30 AM',
      'tag': 'Meeting',
      'tagBgColor': const Color(0xFFDBEAFE),
      'tagTextColor': const Color(0xFF1D4ED8),
      'isCompleted': false,
    },
    {
      'title': 'Review Q3 Financials',
      'subtitle': '',
      'time': '08:00 AM',
      'tag': 'Finance',
      'tagBgColor': const Color(0xFFE2E8F0),
      'tagTextColor': const Color(0xFF475569),
      'isCompleted': true,
    },
  ];

  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFF8FAFC),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 90),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                       CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?w=100&auto=format&fit=crop&q=80',
                        ),
                      ),
                       SizedBox(width: 12),
                       Text(
                        'Good morning',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 0, height: 20),

                  /// Calendar Card
                  Container(
                    child: TableCalendar(
                      locale: "en_US",
                      rowHeight: 40,
                      headerStyle: HeaderStyle(
                        titleTextStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                        formatButtonVisible: false,
                        titleCentered: true,
                      ),
                      availableGestures: AvailableGestures.all,
                      focusedDay: today,
                      calendarStyle: CalendarStyle(
                      ),
                      firstDay: DateTime.utc(2010, 8, 6),
                      lastDay: DateTime.utc(2030, 3, 14),
                      selectedDayPredicate: (day) => isSameDay(day, today),
                      onDaySelected: _onDaySelected,
                    ),
                  ),
                  SizedBox(height: 24),

                  /// Selected Date Title
                  Text(
                    "${today.toString().split(" ")[0]}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Selected Date',
                    style: TextStyle(fontSize: 13, color: Color(0xFF64748B)),
                  ),
                  SizedBox(height: 16),

                  /// Tasks List
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _tasks.length,
                    separatorBuilder: (_, __) =>  SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final task = _tasks[index];
                      return _buildTaskCard(task);
                    },
                  ),
                ],
              ),
            ),

            /// Floating Action Button
            Positioned(
              right: 20,
              bottom: 20,
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor:  Color(0xFF0066CC),
                elevation: 4,
                shape:  CircleBorder(),
                child:  Icon(Icons.add, color: Colors.white, size: 28),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Individual Task Card Widget
  Widget _buildTaskCard(Map<String, dynamic> task) {
    final bool isCompleted = task['isCompleted'];

    return Container(
      padding:  EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color:  Color(0xFFF1F5F9)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Status Checkbox / Icon
          GestureDetector(
            onTap: () {
              setState(() {
                task['isCompleted'] = !task['isCompleted'];
              });
            },
            child: Container(
              margin:  EdgeInsets.only(top: 2),
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isCompleted
                    ?  Color(0xFF047857)
                    : Colors.transparent,
                border: isCompleted
                    ? null
                    : Border.all(color:  Color(0xFF94A3B8), width: 1.5),
              ),
              child: isCompleted
                  ?  Icon(Icons.check, size: 14, color: Colors.white)
                  : null,
            ),
          ),
           SizedBox(width: 12),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task['title'],
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color:  Color(0xFF0F172A),
                    decoration: isCompleted ? TextDecoration.lineThrough : null,
                  ),
                ),
                if ((task['subtitle'] as String).isNotEmpty) ...[
                   SizedBox(height: 4),
                  Text(
                    task['subtitle'],
                    style:  TextStyle(
                      fontSize: 12,
                      color: Color(0xFF64748B),
                      height: 1.3,
                    ),
                  ),
                ],
                 SizedBox(height: 10),
                Row(
                  children: [
                     Icon(
                      Icons.access_time_rounded,
                      size: 13,
                      color: Color(0xFF0066CC),
                    ),
                     SizedBox(width: 4),
                    Text(
                      task['time'],
                      style:  TextStyle(
                        fontSize: 11,
                        color: Color(0xFF0066CC),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                     SizedBox(width: 12),
                    Container(
                      padding:  EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: task['tagBgColor'],
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        task['tag'],
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: task['tagTextColor'],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class _WeekdayText extends StatelessWidget {
//   final String text;
//   const _WeekdayText(this.text, {Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 28,
//       child: Text(
//         text,
//         textAlign: TextAlign.center,
//         style: const TextStyle(
//           fontSize: 11,
//           fontWeight: FontWeight.w600,
//           color: Color(0xFF94A3B8),
//         ),
//       ),
//     );
//   }
// }
