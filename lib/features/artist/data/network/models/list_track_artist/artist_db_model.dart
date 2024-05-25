class ArtistDbModel {
  final int id;
  final String name;
  final String tracklist;

  ArtistDbModel({
    required this.id,
    required this.name,
    required this.tracklist,
  });

  ArtistDbModel copyWith({
    int? id,
    String? name,
    String? tracklist,
  }) =>
      ArtistDbModel(
        id: id ?? this.id,
        name: name ?? this.name,
        tracklist: tracklist ?? this.tracklist,
      );

  factory ArtistDbModel.fromJson(Map<String, dynamic> json) => ArtistDbModel(
        id: json["id"],
        name: json["name"],
        tracklist: json["tracklist"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "tracklist": tracklist,
      };
}
