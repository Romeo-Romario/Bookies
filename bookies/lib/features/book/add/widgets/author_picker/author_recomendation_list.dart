import 'package:bookies/data/entities/author_entity.dart';
import 'package:bookies/features/book/add/widgets/author_picker/picked_author.dart';

import 'package:flutter/material.dart';

class AuthorRecomendationList extends StatelessWidget {
  final Future<List<AuthorEntity>> futureAuthors;

  final void Function(PickedAuthor author) onAddAuthor;

  const AuthorRecomendationList({
    super.key,
    required this.futureAuthors,
    required this.onAddAuthor,
  });

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
            final item = data[index];

            return Card(
              clipBehavior: Clip.antiAlias,
              child: ListTile(
                title: Text(item.fullName),
                onTap: () => onAddAuthor(
                  PickedAuthor(
                    id: item.id,
                    author: item.fullName,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class AuthorSelectedList extends StatelessWidget {
  final List<PickedAuthor> authors;
  const AuthorSelectedList({super.key, required this.authors});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Wrap(
        direction: Axis.horizontal,
        spacing: 10,
        runSpacing: 10,
        children: List.generate(
          authors.length,
          (index) {
            final author = authors[index];

            return Chip(
              clipBehavior: Clip.antiAlias,
              label: Text(author.author),
              onDeleted: () {},
            );
          },
        ),
      ),
    );
  }
}
