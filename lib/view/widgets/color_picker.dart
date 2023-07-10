import 'package:flutter/material.dart';
import 'package:to_do_app/data/models/task.dart';
import 'package:to_do_app/ulits/colors.dart';
import 'package:to_do_app/ulits/extensions.dart';
import 'package:to_do_app/view/widgets/color_picker_item.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({super.key, required this.colorNotifier, this.task});

  final ValueNotifier<Color> colorNotifier;
  final Task? task;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  @override
  void initState() {
    super.initState();
    final color = widget.task?.color;
    if (color != null) {
      colors.toggleColor(color);
    } else {
      colors.setAllFalse();
    }
    widget.colorNotifier.value = color ?? Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: colors.entries
          .map(
            (e) => GestureDetector(
              onTap: () {
                setState(
                  () => colors.updateAll((key, value) {
                    if (key != e.key) {
                      return value = false;
                    }
                    widget.colorNotifier.value = key;
                    return value = true;
                  }),
                );
              },
              child: ColorPickerItem(color: e.key, isChecked: e.value),
            ),
          )
          .toList(),
    );
  }
}
