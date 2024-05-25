class ArtistLocalDb {
  final int id;
  final String name;
  final int idMusic;

  ArtistLocalDb({
    required this.id,
    required this.name,
    required this.idMusic,
  });

  ArtistLocalDb copyWith({
    int? id,
    String? name,
    int? idMusic,
  }) {
    return ArtistLocalDb(
      id: id ?? this.id,
      name: name ?? this.name,
      idMusic: idMusic ?? this.idMusic,
    );
  }

  factory ArtistLocalDb.fromMap(Map<String, dynamic> map) {
    return ArtistLocalDb(
      id: map['id'],
      name: map['name'],
      idMusic: map['idMusic'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "idMusic": idMusic,
    };
  }
}
