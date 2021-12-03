class NASAImage {
  String date = "";
  String explanation = "";
  String hdImageUrl = "";
  String title = "";
  String imageUrl = "";

  NASAImage.initializeNull();

  NASAImage(
      {required this.date,
      required this.explanation,
      required this.hdImageUrl,
      required this.title,
      required this.imageUrl});
}
