class ReadingUpdateEntity {
  int updateId;
  int bookId;
  DateTime updateTime;
  int numberOfPages;

  ReadingUpdateEntity(
      {required this.updateId,
      required this.bookId,
      required this.updateTime,
      required this.numberOfPages});
}
