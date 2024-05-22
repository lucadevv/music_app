import 'package:music_app/features/home/data/network/model/search_model/data_model_db.dart';

class SearchModelDb {
  final List<Data> data;
  final int total;
  final String next;

  SearchModelDb({
    required this.data,
    required this.total,
    required this.next,
  });

  SearchModelDb copyWith({
    List<Data>? data,
    int? total,
    String? next,
  }) =>
      SearchModelDb(
        data: data ?? this.data,
        total: total ?? this.total,
        next: next ?? this.next,
      );

  factory SearchModelDb.fromJson(Map<String, dynamic> json) => SearchModelDb(
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
        total: json["total"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "total": total,
        "next": next,
      };
}
