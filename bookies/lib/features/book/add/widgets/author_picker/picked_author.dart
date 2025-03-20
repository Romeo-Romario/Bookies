class PickedAuthor {
  final int? id;
  final String author;
  bool get existedInDatabase => id != null;

  PickedAuthor({this.id, required this.author});

  @override
  bool operator ==(covariant PickedAuthor other) {
    if (id == other.id && author == other.author) {
      return true;
    }
    return false;
  }
}
