part of televerse;

/// This class helps to create multipart request
class _MultipartHelper {
  /// The file to be uploaded
  final InputFile file;

  /// The field name of the file
  final String field;

  /// Creates a new multipart helper
  const _MultipartHelper(this.file, this.field);

  /// The InputFile Type
  InputFileType get type => file.type;

  /// The file name
  String get name => file.file?.filename ?? field;
}
