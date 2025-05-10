import 'package:flutter/material.dart';

class SortStylePopupMenu extends StatefulWidget {
  const SortStylePopupMenu({super.key, this.func});
  final func;

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
            value: "From new to old",
            child: Card(
                child: ListTile(
              leading: Icon(Icons.date_range),
              title: Text("From new to old"),
            )),
          ),
          PopupMenuItem(
            value: "From old to new",
            child: Card(
                child: ListTile(
              leading: Icon(Icons.date_range_outlined),
              title: Text("From old to new"),
            )),
          ),
          PopupMenuItem(
            value: "From A to Z",
            child: Card(
                child: ListTile(
              leading: Icon(Icons.sort_by_alpha_outlined),
              title: Text("From A to Z"),
            )),
          ),
          PopupMenuItem(
            value: "From Z to A",
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
