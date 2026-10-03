import 'package:flutter/material.dart';
import '../models/chore.dart';
import '../models/chore_schedule.dart';
import '../data/sample_data.dart';

class ChoreCard extends StatefulWidget {
  final Chore chore;
  final ChoreSchedule schedule;
  final VoidCallback? onCompleteChanged;

  const ChoreCard({
    Key? key,
    required this.chore,
    required this.schedule,
    this.onCompleteChanged,
  }) : super(key: key);

  @override
  State<ChoreCard> createState() => _ChoreCardState();
}

class _ChoreCardState extends State<ChoreCard> {
  @override
  Widget build(BuildContext context) {
    final memberName = SampleData.getMemberName(widget.schedule.memberId);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.chore.name,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      if (widget.chore.description != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          widget.chore.description!,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ],
                  ),
                ),
                if (widget.chore.isCompleted)
                  Icon(
                    Icons.check_circle,
                    color: Theme.of(context).colorScheme.primary,
                    size: 28,
                  ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      memberName,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${widget.schedule.dayOfWeek} · ${widget.schedule.dueTime}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.chore.isCompleted = !widget.chore.isCompleted;
                    });
                    widget.onCompleteChanged?.call();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.chore.isCompleted
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.surface,
                    foregroundColor: widget.chore.isCompleted
                        ? Colors.white
                        : Theme.of(context).colorScheme.primary,
                  ),
                  child: Text(
                    widget.chore.isCompleted ? '✓ Done' : 'Mark Done',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
