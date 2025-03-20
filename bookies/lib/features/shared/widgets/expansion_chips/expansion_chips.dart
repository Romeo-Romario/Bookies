import 'package:bookies/features/book/add/widgets/labeled_container.dart';
import 'package:bookies/features/shared/theme/tile_style.dart';
import 'package:flutter/material.dart';

class ExpansionChips<T> extends StatelessWidget {
  final int length;

  final String title;

  final bool initiallyExpanded;

  final void Function(int index) onTap;
  final void Function() onAddTap;

  final Widget Function(int index) chipLabelBuilder;

  bool get isNotEmpty => length > 0;

  const ExpansionChips({
    super.key,
    required this.length,
    required this.title,
    this.initiallyExpanded = false,
    required this.onTap,
    required this.onAddTap,
    required this.chipLabelBuilder,
  });

  static Widget outlined<T>({
    required String title,
    required int length,
    required void Function(int index) onTap,
    required void Function() onAddTap,
    required Widget Function(int index) labelBuilder,
  }) {
    return Card.outlined(
      clipBehavior: Clip.antiAlias,
      child: ExpansionChips<T>(
        length: length,
        title: title,
        onTap: onTap,
        onAddTap: onAddTap,
        chipLabelBuilder: labelBuilder,
        initiallyExpanded: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const spacing = 4.0;
    const padding = 16.0;

    return ExpansionTile(
      initiallyExpanded: initiallyExpanded,
      title: Text(
        title,
        style: TileStyle.title(context, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        length.toString(),
        style: TileStyle.subtitle(context),
      ),
      childrenPadding: const EdgeInsets.all(padding),
      children: [
        if (isNotEmpty)
          Align(
            alignment: Alignment.topLeft,
            child: Wrap(
              runSpacing: spacing,
              spacing: spacing,
              children: List.generate(length, _chip),
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: LabeledContainer(
            label: "",
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                side: BorderSide(color: Colors.deepPurple, width: 1),
              ),
              onPressed: onAddTap,
              label: Text("Select Author"),
              icon: Icon(Icons.account_circle_outlined),
            ),
          ),
        ),
      ],
    );
  }

  Widget _chip(int index) {
    return InputChip(
      label: chipLabelBuilder(index),
      onPressed: () => onTap(index),
    );
  }
}
