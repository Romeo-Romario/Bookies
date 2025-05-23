class FolderEntity {
  int? parentFolderId;
  int? booksFolderId;
  String booksFolderName;
  String fontStyle;

  FolderEntity(
      {this.parentFolderId,
      this.booksFolderId,
      required this.booksFolderName,
      required this.fontStyle});
}
