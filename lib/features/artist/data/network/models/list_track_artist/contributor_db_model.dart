class ContributorDbModel {
  final int id;
  final String name;
  final String link;
  final String share;
  final String picture;
  final String pictureSmall;
  final String pictureMedium;
  final String pictureBig;
  final String pictureXl;
  final bool radio;
  final String tracklist;

  ContributorDbModel({
    required this.id,
    required this.name,
    required this.link,
    required this.share,
    required this.picture,
    required this.pictureSmall,
    required this.pictureMedium,
    required this.pictureBig,
    required this.pictureXl,
    required this.radio,
    required this.tracklist,
  });

  ContributorDbModel copyWith({
    int? id,
    String? name,
    String? link,
    String? share,
    String? picture,
    String? pictureSmall,
    String? pictureMedium,
    String? pictureBig,
    String? pictureXl,
    bool? radio,
    String? tracklist,
  }) =>
      ContributorDbModel(
        id: id ?? this.id,
        name: name ?? this.name,
        link: link ?? this.link,
        share: share ?? this.share,
        picture: picture ?? this.picture,
        pictureSmall: pictureSmall ?? this.pictureSmall,
        pictureMedium: pictureMedium ?? this.pictureMedium,
        pictureBig: pictureBig ?? this.pictureBig,
        pictureXl: pictureXl ?? this.pictureXl,
        radio: radio ?? this.radio,
        tracklist: tracklist ?? this.tracklist,
      );

  factory ContributorDbModel.fromJson(Map<String, dynamic> json) =>
      ContributorDbModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? 'no-name',
        link: json["link"] ?? 'no-link',
        share: json["share"] ?? "no-share",
        picture: json["picture"] ?? "no-picture",
        pictureSmall: json["picture_small"] ?? "no-picturesmall",
        pictureMedium: json["picture_medium"] ?? "no-picturemedium",
        pictureBig: json["picture_big"] ?? "no-picture-big",
        pictureXl: json["picture_xl"] ?? "no-picture-xl",
        radio: json["radio"] ?? false,
        tracklist: json["tracklist"] ?? "no-tracklist",
      );

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
        "radio": radio,
        "tracklist": tracklist,
      };
}
