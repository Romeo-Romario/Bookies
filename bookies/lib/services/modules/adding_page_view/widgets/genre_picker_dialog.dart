import 'package:bookies/services/shared/db/data.dart';
import 'package:flutter/material.dart';

class GenrePickerDialog extends StatefulWidget {
  const GenrePickerDialog({super.key});

  @override
  State<GenrePickerDialog> createState() => _GenrePickerDialogState();
  static Future<PickedGenre?> showAsDialog({required BuildContext context}) {
    return showDialog(
      context: context,
      builder: (context) {
        return GenrePickerDialog();
      },
    );
  }
}

class _GenrePickerDialogState extends State<GenrePickerDialog> {
  final db = Database();
  late final Future<List<GenresInfoTableData>> futureGenres;
  final _controller = TextEditingController();
  String selected = "Select";

  @override
  void initState() {
    super.initState();
    futureGenres = db.select(db.genresInfoTable).get();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 450,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            spacing: 20,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SegmentedButton<String>(
                segments: const [
                  ButtonSegment(
                      value: "Select",
                      label: Text("Select"),
                      icon: Icon(Icons.subtitles_outlined)),
                  ButtonSegment(
                      value: "Add new",
                      label: Text("Add New"),
                      icon: Icon(Icons.add)),
                ],
                selected: {selected},
                onSelectionChanged: (newSelection) {
                  setState(() {
                    selected = newSelection.first;
                  });
                },
                multiSelectionEnabled: false,
              ),
              if (selected == "Select")
                Container(
                  height: 190,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepPurple, width: 1.2),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FutureBuilder(
                      future: futureGenres,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                                ConnectionState.waiting ||
                            snapshot.connectionState ==
                                ConnectionState.active) {
                          return Center(child: CircularProgressIndicator());
                        }
                        final data = snapshot.data ?? const [];
                        return SingleChildScrollView(
                          child: Wrap(
                            alignment: WrapAlignment.start,
                            runAlignment: WrapAlignment.start,
                            spacing: 8.0,
                            runSpacing: 3.0,
                            children: List.generate(
                              data.length,
                              (index) {
                                return ActionChip(
                                  onPressed: () {
                                    Navigator.pop(
                                        context,
                                        PickedGenre(
                                          genreName: data[index].genre_name,
                                          id: data[index].genre_id,
                                        ));
                                  },
                                  label: Text(data[index].genre_name),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              if (selected == "Add new")
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.deepPurple, width: 1.2),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Row(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: TextFormField(
                          controller: _controller,
                          decoration: InputDecoration(
                            labelText: "Enter new genre",
                          ),
                        )),
                        FloatingActionButton(
                          onPressed: () {
                            Navigator.pop(
                              context,
                              PickedGenre(genreName: _controller.text),
                            );
                          },
                          shape: CircleBorder(),
                          mini: true,
                          child: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class PickedGenre {
  final int? id;
  final String genreName;
  bool get existedInDatabase => id != null;

  PickedGenre({this.id, required this.genreName});
}
