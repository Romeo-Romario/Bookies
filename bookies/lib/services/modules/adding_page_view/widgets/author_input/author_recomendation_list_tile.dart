import 'package:bookies/services/modules/adding_page_view/widgets/author_picker_dialog.dart';
import 'package:bookies/services/shared/db/data.dart';
import 'package:flutter/material.dart';

class AuthorRecomendationList extends StatelessWidget {
  final Future<List<AuthorsInfoTableData>> futureAuthors;
  const AuthorRecomendationList({super.key, required this.futureAuthors});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureAuthors,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting ||
            snapshot.connectionState == ConnectionState.active) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text("Error"));
        }

        final data = snapshot.data ?? const [];

        if (data.isEmpty) {
          return Center(
            child: Text("No authors with such name"),
          );
        }

        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Card(
              clipBehavior: Clip.antiAlias,
              child: ListTile(
                title: Text(data[index].author_fullname),
                onTap: () {
                  Navigator.pop(
                      context,
                      PickedAuthor(
                        id: data[index].author_id,
                        author: data[index].author_fullname,
                      ));
                },
              ),
            );
          },
        );
      },
    );
  }
}
