import 'package:flutter/material.dart';

class SortStylePopupMenu extends StatefulWidget {
  const SortStylePopupMenu({super.key, required this.func});
  final Function func;

  @override
  State<SortStylePopupMenu> createState() => _SortStylePopupMenuState();
}

class _SortStylePopupMenuState extends State<SortStylePopupMenu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
      child: PopupMenuButton(
        icon: Icon(Icons.sort_rounded, size: 24.0),
        onSelected: (value) => widget.func(value),
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 1,
            child: Card(
                child: ListTile(
              leading: Icon(Icons.date_range),
              title: Text("From new to old"),
            )),
          ),
          PopupMenuItem(
            value: 2,
            child: Card(
                child: ListTile(
              leading: Icon(Icons.date_range_outlined),
              title: Text("From old to new"),
            )),
          ),
          PopupMenuItem(
            value: 3,
            child: Card(
                child: ListTile(
              leading: Icon(Icons.sort_by_alpha_outlined),
              title: Text("From A to Z"),
            )),
          ),
          PopupMenuItem(
            value: 4,
            child: Card(
                child: ListTile(
              leading: Icon(Icons.sort_by_alpha_rounded),
              title: Text("From Z to A"),
            )),
          ),
        ],
      ),
    );
  }
}
