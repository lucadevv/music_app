class Creator {
  final int id;
  final String name;
  final String tracklist;
  final String link;

  Creator({
    required this.id,
    required this.name,
    required this.tracklist,
    required this.link,
  });

  Creator copyWith({
    int? id,
    String? name,
    String? tracklist,
    String? link,
  }) =>
      Creator(
        id: id ?? this.id,
        name: name ?? this.name,
        tracklist: tracklist ?? this.tracklist,
        link: link ?? this.link,
      );

  factory Creator.fromJson(Map<String, dynamic> json) => Creator(
        id: json["id"],
        name: json["name"],
        tracklist: json["tracklist"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "tracklist": tracklist,
        "link": link,
      };
}
