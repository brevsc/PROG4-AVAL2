class Apod {
	final String title;
	final String date;
	final String explanation;
	final String imageUrl;
	final String? copyright;

	Apod({
		required this.title,
		required this.date,
		required this.explanation,
		required this.imageUrl,
		this.copyright,
	});

	factory Apod.fromJson(Map<String, dynamic> json) {
		return Apod(
			title: json['title'],
			date: json['date'],
			explanation: json['explanation'],
			imageUrl: json['url'],
			copyright: json['copyright'],
		);
	}
}