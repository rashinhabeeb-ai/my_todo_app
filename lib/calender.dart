import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF8FAFC),
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 90),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Header Section
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?w=100&auto=format&fit=crop&q=80',
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Good morning',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 0, height: 20),

                    /// Calendar Card
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.02),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          // Month Header
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'October 2024',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF0F172A),
                                ),
                              ),
                              Row(
                                children: const [
                                  Icon(Icons.chevron_left, size: 20, color: Color(0xFF64748B)),
                                  SizedBox(width: 12),
                                  Icon(Icons.chevron_right, size: 20, color: Color(0xFF64748B)),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),

                          // Weekdays Header
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              _WeekdayText('MO'),
                              _WeekdayText('TU'),
                              _WeekdayText('WE'),
                              _WeekdayText('TH'),
                              _WeekdayText('FR'),
                              _WeekdayText('SA'),
                              _WeekdayText('SU'),
                            ],
                          ),
                          const SizedBox(height: 12),

                          // Calendar Days Grid
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 35, // 4 offset blank days + 31 days
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 7,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                            ),
                            itemBuilder: (context, index) {
                              final dayNumber = index - 3; // October 1st starts on Tuesday
                              if (dayNumber < 1 || dayNumber > 31) {
                                return const SizedBox.shrink();
                              }

                              final isSelected = dayNumber == _selectedDay;

                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedDay = dayNumber;
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: isSelected ? const Color(0xFF0066CC) : Colors.transparent,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    '$dayNumber',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                                      color: isSelected ? Colors.white : const Color(0xFF334155),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    /// Selected Date Title
                    const Text(
                      'Thursday, Oct 24',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Selected Date',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF64748B),
                      ),
                    ),
                    const SizedBox(height: 16),

                    /// Tasks List
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _tasks.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
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
                  backgroundColor: const Color(0xFF0066CC),
                  elevation: 4,
                  shape: const CircleBorder(),
                  child: const Icon(Icons.add, color: Colors.white, size: 28),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Individual Task Card Widget
  Widget _buildTaskCard(Map<String, dynamic> task) {
    final bool isCompleted = task['isCompleted'];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9)),
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
              margin: const EdgeInsets.only(top: 2),
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isCompleted ? const Color(0xFF047857) : Colors.transparent,
                border: isCompleted
                    ? null
                    : Border.all(color: const Color(0xFF94A3B8), width: 1.5),
              ),
              child: isCompleted
                  ? const Icon(Icons.check, size: 14, color: Colors.white)
                  : null,
            ),
          ),
          const SizedBox(width: 12),

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
                    color: const Color(0xFF0F172A),
                    decoration: isCompleted ? TextDecoration.lineThrough : null,
                  ),
                ),
                if ((task['subtitle'] as String).isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    task['subtitle'],
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF64748B),
                      height: 1.3,
                    ),
                  ),
                ],
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time_rounded,
                      size: 13,
                      color: Color(0xFF0066CC),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      task['time'],
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF0066CC),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Tag / Category
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
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

class _WeekdayText extends StatelessWidget {
  final String text;
  const _WeekdayText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 28,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: Color(0xFF94A3B8),
        ),
      ),
    );
  }
}