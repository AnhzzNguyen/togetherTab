import 'package:flutter/material.dart';
import '../data/sample_data.dart';
import '../models/chore.dart';
import '../models/chore_schedule.dart';
import '../widgets/chore_card.dart';

class ChoresPage extends StatefulWidget {
  const ChoresPage({Key? key}) : super(key: key);

  @override
  State<ChoresPage> createState() => _ChoresPageState();
}

class _ChoresPageState extends State<ChoresPage> {
  late List<Chore> _chores;
  late List<ChoreSchedule> _schedules;

  @override
  void initState() {
    super.initState();
    _chores = List.from(SampleData.chores);
    _schedules = List.from(SampleData.schedules);
  }

  void _showAddChoreDialog() {
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();
    String? selectedMemberId = SampleData.members.first.id;
    String? selectedDay = 'Monday';
    String? selectedTime = '7:00 PM';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Chore'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Chore name',
                  hintText: 'e.g., Wash dishes',
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description (optional)',
                  hintText: 'e.g., Clean all dishes',
                ),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: selectedMemberId,
                decoration: const InputDecoration(labelText: 'Assign to'),
                items: SampleData.members.map((member) {
                  return DropdownMenuItem(
                    value: member.id,
                    child: Text(member.name),
                  );
                }).toList(),
                onChanged: (value) {
                  selectedMemberId = value;
                },
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: selectedDay,
                decoration: const InputDecoration(labelText: 'Day of week'),
                items: const [
                  'Monday',
                  'Tuesday',
                  'Wednesday',
                  'Thursday',
                  'Friday',
                  'Saturday',
                  'Sunday',
                ].map((day) {
                  return DropdownMenuItem(
                    value: day,
                    child: Text(day),
                  );
                }).toList(),
                onChanged: (value) {
                  selectedDay = value;
                },
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: selectedTime,
                decoration: const InputDecoration(labelText: 'Due time'),
                items: const [
                  '7:00 AM',
                  '8:00 AM',
                  '9:00 AM',
                  '10:00 AM',
                  '6:00 PM',
                  '7:00 PM',
                  '8:00 PM',
                  '9:00 PM',
                ].map((time) {
                  return DropdownMenuItem(
                    value: time,
                    child: Text(time),
                  );
                }).toList(),
                onChanged: (value) {
                  selectedTime = value;
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isNotEmpty &&
                  selectedMemberId != null &&
                  selectedDay != null &&
                  selectedTime != null) {
                setState(() {
                  final newChore = Chore(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    name: nameController.text,
                    description: descriptionController.text.isNotEmpty
                        ? descriptionController.text
                        : null,
                  );
                  _chores.add(newChore);

                  final newSchedule = ChoreSchedule(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    choreId: newChore.id,
                    memberId: selectedMemberId!,
                    dayOfWeek: selectedDay!,
                    dueTime: selectedTime!,
                  );
                  _schedules.add(newSchedule);
                });
                Navigator.pop(context);
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Chores',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  ElevatedButton.icon(
                    onPressed: _showAddChoreDialog,
                    icon: const Icon(Icons.add),
                    label: const Text('Add Chore'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            if (_schedules.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'No chores yet. Add one to get started!',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              )
            else
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                itemCount: _schedules.length,
                itemBuilder: (context, index) {
                  final schedule = _schedules[index];
                  final chore =
                      _chores.firstWhere((c) => c.id == schedule.choreId);

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: ChoreCard(
                      chore: chore,
                      schedule: schedule,
                      onCompleteChanged: () {
                        setState(() {});
                      },
                    ),
                  );
                },
              ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
