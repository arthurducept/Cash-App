import 'package:flutter/material.dart';
import 'package:front/style/themes.dart';

class SelectableChip extends StatefulWidget {
  const SelectableChip({Key? key, this.title, this.onTap}) : super(key: key);

  final String? title;
  final Function(bool)? onTap;

  @override
  State<SelectableChip> createState() => _SelectableChipState();
}
class _SelectableChipState extends State<SelectableChip> {
  bool _state = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _state = !_state;
        });
        if(widget.onTap != null) {
          widget.onTap!(_state);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: MyDarkTheme.chip,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7.0),
              child: Text(widget.title ?? '', style: MyDarkTheme.listSubtitle.copyWith(
                color: MyDarkTheme.primaryText,
              )),
            ),
            AnimatedRotation(
              turns: _state ? 1/8 : 0,
              duration: const Duration(milliseconds: 300),
              child: const CircleAvatar(
                radius: 10,
                backgroundColor: MyDarkTheme.secondaryText,
                child: Icon(Icons.close, color: MyDarkTheme.primaryText, size: 16,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}