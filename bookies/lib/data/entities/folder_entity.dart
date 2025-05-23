class FolderEntity {
  int? parentFolderId;
  int? booksFolderId;
  String booksFolderName;
  String fontStyle;
  String? color;

  FolderEntity(
      {this.parentFolderId,
      this.booksFolderId,
      required this.booksFolderName,
      required this.fontStyle,
      this.color});
}
