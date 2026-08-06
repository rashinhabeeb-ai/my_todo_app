import 'package:flutter/material.dart';
import 'package:mytodo/home.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String _selectedPriority = 'Medium';
  String _selectedProject = 'Work';

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  /// Color constants
  static const Color primaryBlue = Color(0xFF005AC1);
  static const Color fieldBgColor = Color(0xFFF2F5FA);
  static const Color textDark = Color(0xFF191C1E);
  static const Color textSubtle = Color(0xFF43474E);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header: Title & Close Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Add New Task',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: primaryBlue,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: textSubtle),
                      onPressed: () => Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Home(),)),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Category/Tag Label
                const Text(
                  'COGNITIVE CLARITY',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: primaryBlue,
                    letterSpacing: 1.1,
                  ),
                ),
                const SizedBox(height: 16),

                // Task Title
                _buildText('Task Title'),
                const SizedBox(height: 6),
                TextField(
                  controller: _titleController,
                  decoration: _inputDecoration('What needs to be done?'),

                ),
                const SizedBox(height: 16),

                // Description
                _buildText('Description'),
                const SizedBox(height: 6),
                TextField(
                  controller: _descriptionController,
                  maxLines: 3,
                  decoration: _inputDecoration('Add some details or notes...'),
                ),
                const SizedBox(height: 16),

                // Due Date & Due Time Row
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildText('Due Date'),
                          const SizedBox(height: 6),
                          InkWell(
                            onTap: _pickDate,
                            borderRadius: BorderRadius.circular(10),
                            child: _buildPickerContainer(
                              text: _selectedDate == null
                                  ? 'mm/dd/yyyy'
                                  : "${_selectedDate!.month}/${_selectedDate!.day}/${_selectedDate!.year}",
                              icon: Icons.calendar_today_outlined,
                              isPlaceholder: _selectedDate == null,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildText('Due Time'),
                          const SizedBox(height: 6),
                          InkWell(
                            onTap: _pickTime,
                            borderRadius: BorderRadius.circular(10),
                            child: _buildPickerContainer(
                              text: _selectedTime == null
                                  ? '--:-- --'
                                  : _selectedTime!.format(context),
                              icon: Icons.access_time_outlined,
                              isPlaceholder: _selectedTime == null,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Priority Selection
                _buildText('Priority'),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildPriorityButton('Low', Colors.green),
                    _buildPriorityButton('Medium', Colors.blue),
                    _buildPriorityButton('High', Colors.red),
                  ],
                ),
                const SizedBox(height: 16),

                // Projects Selection
                _buildText('Projects'),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(child: _buildProjectCard('Work', Icons.work_outline)),
                    const SizedBox(width: 12),
                    Expanded(child: _buildProjectCard('Personal', Icons.person_outline)),
                  ],
                ),
                const SizedBox(height: 24),

                // Create Task Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      if (_titleController.text.trim().isEmpty){
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please enter a task title'))
                        );
                        return;
                      }
                      final DateTime now = DateTime.now();
                      final DateTime dateToUse = _selectedDate ?? now;

                      // Format as Month Day, Year (e.g., Oct 25, 2026)
                      final List<String> months = [
                        'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
                      ];
                      final String formattedDate =
                          "${months[dateToUse.month - 1]} ${dateToUse.day}, ${dateToUse.year}";

                      // Format time: Use selected time or default to null/empty string
                      final String? formattedTime = _selectedTime?.format(context);
                     Navigator.pop(context,
                      TaskItem(
                          title: _titleController.text,
                          description: _descriptionController.text,
                          date:formattedDate,
                      time: formattedTime));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    icon: const Icon(Icons.add, color: Colors.white),
                    label: const Text(
                      'Create Task',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildText(String label) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: textSubtle,
      ),
    );
  }

  InputDecoration _inputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Color(0xFF9EA3AE), fontSize: 14),
      filled: true,
      fillColor: fieldBgColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
    );
  }

  Widget _buildPickerContainer({
    required String text,
    required IconData icon,
    required bool isPlaceholder,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: fieldBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              color: isPlaceholder ? const Color(0xFF9EA3AE) : textDark,
              fontSize: 14,
            ),
          ),
          Icon(icon, size: 18, color: const Color(0xFF727785)),
        ],
      ),
    );
  }

  Widget _buildPriorityButton(String label, Color dotColor) {
    final bool isSelected = _selectedPriority == label;
    return GestureDetector(
      onTap: () => setState(() => _selectedPriority = label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? primaryBlue.withOpacity(0.08) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? primaryBlue : const Color(0xFFE0E2EC),
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? primaryBlue : textDark,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectCard(String title, IconData icon) {
    final bool isSelected = _selectedProject == title;
    return GestureDetector(
      onTap: () => setState(() => _selectedProject = title),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected ? fieldBgColor : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? Colors.transparent : const Color(0xFFE0E2EC),
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFFD8E2FF) : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, size: 20, color: isSelected ? primaryBlue : textSubtle),
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: isSelected ? textDark : textSubtle,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Pickers
  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(2030),
    );
    if (picked != null) setState(() {
      _selectedDate = picked;
    },);
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) setState( () {
      _selectedTime = picked;
    },);
  }
}