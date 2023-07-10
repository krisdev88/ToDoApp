import 'package:flutter/material.dart';
import 'package:to_do_app/data/controllers/list_notifier.dart';
import 'package:to_do_app/data/models/task.dart';
import 'package:to_do_app/view/edit_task_page.dart';

class MyListTitle extends StatefulWidget {
  const MyListTitle({
    super.key,
    required this.task,
    required this.listNotifier,
    this.disableOnTap = false,
  });

  final Task task;
  final ListNotifier listNotifier;
  final bool disableOnTap;

  @override
  State<MyListTitle> createState() => _MyListTitleState();
}

class _MyListTitleState extends State<MyListTitle> {
  @override
  Widget build(BuildContext context) {
    final checkboxValue = widget.task.isDone;

    return Column(
      children: [
        ColoredBox(
          color:
              !checkboxValue ? widget.task.color ?? Colors.white : Colors.grey,
          child: ListTile(
            leading: Checkbox(
              onChanged: (value) => setState(() {
                widget.listNotifier.toggleDone(widget.task);
              }),
              value: checkboxValue,
            ),
            title: Text(widget.task.title),
            subtitle: Text(widget.task.subtitle ?? ''),
            trailing: widget.task.taskPriority.icon,
            style: ListTileStyle.list,
            onTap: () => widget.disableOnTap
                ? null
                : Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditTaskPage(
                        listNotifier: widget.listNotifier,
                        task: widget.task,
                      ),
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
