class FolderEntity {
  int? parentFolderId;
  int booksFolderId;
  String booksFolderName;
  String? fontStyle;
  String? color;

  FolderEntity(
      {this.parentFolderId,
      required this.booksFolderId,
      required this.booksFolderName,
      this.fontStyle,
      this.color});
}
