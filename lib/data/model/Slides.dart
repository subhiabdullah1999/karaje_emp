class Slide {
  final int id;
  final String company;
  final String title;
  final int price;
  final String slide;

  Slide({
    required this.id,
    required this.company,
    required this.title,
    required this.price,
    required this.slide,
  });

  factory Slide.fromJson(Map<String, dynamic> json) {
    return Slide(
      id: json['id'] as int,
      company: json['company'] as String,
      title: json['title'] as String,
      price: json['price'] as int,
      slide: json['slide'] as String,
    );
  }
}

class SlidesResponse {
  final List<Slide> slides;
  final bool status;
  final String message;
  final int code;

  SlidesResponse({
    required this.slides,
    required this.status,
    required this.message,
    required this.code,
  });

  factory SlidesResponse.fromJson(Map<String, dynamic> json) {
    final slidesJson = json['data']['Slides'] as List<dynamic>;
    final slides = slidesJson.map((slideJson) => Slide.fromJson(slideJson)).toList();

    return SlidesResponse(
      slides: slides,
      status: json['status'] as bool,
      message: json['message'] as String,
      code: json['code'] as int,
    );
  }
}
