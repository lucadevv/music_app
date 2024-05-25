class ArtistResponseDbModel {
  final int id;
  final String name;
  final String link;
  final String share;
  final String picture;
  final String pictureSmall;
  final String pictureMedium;
  final String pictureBig;
  final String pictureXl;
  final int nbAlbum;
  final int nbFan;
  final bool radio;
  final String tracklist;
  final String type;

  ArtistResponseDbModel({
    required this.id,
    required this.name,
    required this.link,
    required this.share,
    required this.picture,
    required this.pictureSmall,
    required this.pictureMedium,
    required this.pictureBig,
    required this.pictureXl,
    required this.nbAlbum,
    required this.nbFan,
    required this.radio,
    required this.tracklist,
    required this.type,
  });

  ArtistResponseDbModel copyWith({
    int? id,
    String? name,
    String? link,
    String? share,
    String? picture,
    String? pictureSmall,
    String? pictureMedium,
    String? pictureBig,
    String? pictureXl,
    int? nbAlbum,
    int? nbFan,
    bool? radio,
    String? tracklist,
    String? type,
  }) =>
      ArtistResponseDbModel(
        id: id ?? this.id,
        name: name ?? this.name,
        link: link ?? this.link,
        share: share ?? this.share,
        picture: picture ?? this.picture,
        pictureSmall: pictureSmall ?? this.pictureSmall,
        pictureMedium: pictureMedium ?? this.pictureMedium,
        pictureBig: pictureBig ?? this.pictureBig,
        pictureXl: pictureXl ?? this.pictureXl,
        nbAlbum: nbAlbum ?? this.nbAlbum,
        nbFan: nbFan ?? this.nbFan,
        radio: radio ?? this.radio,
        tracklist: tracklist ?? this.tracklist,
        type: type ?? this.type,
      );

  factory ArtistResponseDbModel.fromJson(Map<String, dynamic> json) {
    return ArtistResponseDbModel(
      id: json["id"] ?? 0,
      name: json["name"] ?? "no-name",
      link: json["link"] ?? "no-link",
      share: json["share"] ?? "no-share",
      picture: json["picture"] ?? "no-picture",
      pictureSmall: json["picture_small"] ?? "no-picruresm",
      pictureMedium: json["picture_medium"] ?? "no-picture-m",
      pictureBig: json["picture_big"] ?? "no-picture-bg",
      pictureXl: json["picture_xl"] ?? "no-picture-xl",
      nbAlbum: json["nb_album"] as int? ?? 0,
      nbFan: json["nb_fan"] as int? ?? 0,
      radio: json["radio"] as bool? ?? false,
      tracklist: json["tracklist"] ?? "no-tracklist",
      type: json["type"] ?? "no-type",
    );
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "link": link,
        "share": share,
        "picture": picture,
        "picture_small": pictureSmall,
        "picture_medium": pictureMedium,
        "picture_big": pictureBig,
        "picture_xl": pictureXl,
        "nb_album": nbAlbum,
        "nb_fan": nbFan,
        "radio": radio,
        "tracklist": tracklist,
        "type": type,
      };
}
