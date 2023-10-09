class Data {
  String id;
  String type;

  Data({required this.id, required this.type});

  factory Data.fromJson(Map<String, Object?> json) =>
      Data(id: json["id"] as String, type: json["type"] as String);
}

class Chapters {
  List<Data> data;

  Chapters({required this.data});

  factory Chapters.fromJson(Map<String, Object?> json) => Chapters(
      data: (json['data'] as List)
          .map((e) => Data.fromJson(e as Map<String, Object?>))
          .toList());
}

class Relationship {
  Chapters chapters;

  Relationship({required this.chapters});

  factory Relationship.fromJson(Map<String, Object?> json) => Relationship(
      chapters: Chapters.fromJson(json["chapters"] as Map<String, Object?>));
}

class Attributes {
  String slug;
  String title;
  String summary;
  String author;
  String releaseData;
  String dedication;
  int pages;
  int? order;
  String cover;
  String wiki;

  Attributes({
    required this.slug,
    required this.title,
    required this.summary,
    required this.author,
    required this.releaseData,
    required this.dedication,
    required this.pages,
    required this.cover,
    required this.wiki,
    this.order,
  });

  factory Attributes.fromJson(Map<String, Object?> json) => Attributes(
        slug: json["slug"] as String,
        title: json["title"] as String,
        summary: json["summary"] as String,
        author: json["author"] as String,
        releaseData: json["release_date"] as String,
        dedication: json["dedication"] as String,
        pages: json["pages"] as int,
        order: json["order"] as int?,
        cover: json["cover"] as String,
        wiki: json["wiki"] as String,
      );
}

class Book {
  String id;
  String type;
  Attributes attributes;
  Relationship relationship;

  Book(
      {required this.id,
      required this.type,
      required this.relationship,
      required this.attributes});

  factory Book.fromJson(Map<String, Object?> json) => Book(
        id: json["id"] as String,
        type: json["type"] as String,
        relationship: Relationship.fromJson(
            json["relationships"] as Map<String, Object?>),
        attributes: Attributes.fromJson(
          json["attributes"] as Map<String, Object?>,
        ),
      );
}
