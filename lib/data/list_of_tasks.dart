import 'package:flutter/material.dart';
import 'package:to_do_app/data/models/task.dart';
import 'package:to_do_app/data/models/task_priority.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

List<Task> listOfTask = [
  Task(
    id: uuid.v4(),
    title: 'first task',
    color: Colors.yellow,
    taskPriority: TaskPriority.low,
  ),
];
