import 'package:flutter/material.dart';

class DismissibleWidget extends StatelessWidget {
  const DismissibleWidget({
    super.key,
    required this.valueKey,
    required this.child,
    required this.onDismissed,
  });
  final UniqueKey valueKey;
  final Widget child;
  final Function(DismissDirection direction) onDismissed;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: const ColoredBox(
        color: Colors.redAccent,
        child: Icon(
          Icons.delete,
          color: Colors.white60,
        ),
      ),
      direction: DismissDirection.startToEnd,
      onDismissed: onDismissed,
      key: valueKey,
      child: child,
    );
  }
}
