/// 标签
class TagResponseEntity {
  TagResponseEntity({
    this.tag,
  });

  String tag;

  factory TagResponseEntity.fromJson(Map<String, dynamic> json) =>
      TagResponseEntity(
        tag: json["tag"],
      );

  Map<String, dynamic> toJson() => {
        "tag": tag,
      };
}
