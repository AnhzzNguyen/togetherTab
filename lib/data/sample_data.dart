import '../models/household_member.dart';
import '../models/chore.dart';
import '../models/chore_schedule.dart';

class SampleData {
  static final List<HouseholdMember> members = [
    HouseholdMember(id: '1', name: 'Alex', email: 'alex@example.com'),
    HouseholdMember(id: '2', name: 'Jamie', email: 'jamie@example.com'),
    HouseholdMember(id: '3', name: 'Sam', email: 'sam@example.com'),
    HouseholdMember(id: '4', name: 'Taylor', email: 'taylor@example.com'),
  ];

  static final List<Chore> chores = [
    Chore(id: '1', name: 'Take out trash', description: 'Remove and replace bin liners'),
    Chore(id: '2', name: 'Wash dishes', description: 'Clean all dishes in the sink'),
    Chore(id: '3', name: 'Vacuum living room', description: 'Vacuum carpets and hardwood'),
    Chore(id: '4', name: 'Clean bathroom', description: 'Scrub toilet, sink, and tiles'),
    Chore(id: '5', name: 'Do laundry', description: 'Wash and fold household laundry'),
  ];

  static final List<ChoreSchedule> schedules = [
    ChoreSchedule(
      id: '1',
      choreId: '1',
      memberId: '1',
      dayOfWeek: 'Monday',
      dueTime: '7:00 PM',
    ),
    ChoreSchedule(
      id: '2',
      choreId: '2',
      memberId: '2',
      dayOfWeek: 'Tuesday',
      dueTime: '8:00 PM',
    ),
    ChoreSchedule(
      id: '3',
      choreId: '3',
      memberId: '3',
      dayOfWeek: 'Saturday',
      dueTime: '10:00 AM',
    ),
    ChoreSchedule(
      id: '4',
      choreId: '4',
      memberId: '4',
      dayOfWeek: 'Wednesday',
      dueTime: '6:00 PM',
    ),
    ChoreSchedule(
      id: '5',
      choreId: '5',
      memberId: '1',
      dayOfWeek: 'Thursday',
      dueTime: '7:00 PM',
    ),
  ];

  static String getMemberName(String memberId) {
    return members.firstWhere((m) => m.id == memberId).name;
  }

  static Chore? getChoreName(String choreId) {
    try {
      return chores.firstWhere((c) => c.id == choreId);
    } catch (e) {
      return null;
    }
  }
}
