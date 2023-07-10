import 'package:flutter/material.dart';
import 'package:to_do_app/data/models/task_priority.dart';

class DropdownPriorityPicker extends StatefulWidget {
  DropdownPriorityPicker({
    super.key,
    required this.priorityNotifier,
    this.initialDropdownValue,
  });

  final ValueNotifier priorityNotifier;
  TaskPriority? initialDropdownValue;

  @override
  State<DropdownPriorityPicker> createState() => _DropdownPriorityPickerState();
}

class _DropdownPriorityPickerState extends State<DropdownPriorityPicker> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      onChanged: (value) {
        if (value == null) return;
        setState(() => widget.initialDropdownValue = value);
        widget.priorityNotifier.value =
            widget.initialDropdownValue ?? TaskPriority.high;
      },
      value: widget.initialDropdownValue ?? TaskPriority.high,
      items: TaskPriority.values
          .map(
            (element) => DropdownMenuItem(
              value: element,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(element.text),
                    const SizedBox(width: 5),
                    element.icon,
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
