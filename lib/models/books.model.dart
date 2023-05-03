class BookModel {
  final int id;
  final String title;
  final String? image;
  final String pdfUrl;

  BookModel({
    required this.id,
    required this.title,
    this.image,
    required this.pdfUrl,
  });
}
