class ApodModel {
  final String copyright;
  final String imageUrl;
  final String title;
  final String summary;
  final String mediaType;

  const ApodModel({
    required this.title,
    required this.summary,
    required this.imageUrl,
    required this.copyright,
    required this.mediaType,
  });
}
