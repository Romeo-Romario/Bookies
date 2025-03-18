class PickedAuthor {
  final int? id;
  final String author;
  bool get existedInDatabase => id != null;

  PickedAuthor({this.id, required this.author});
}
