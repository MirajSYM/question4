class Photo {
  int id;
  String photoUrl;
  String thumbUrl;
  int like = 0;
  int dislike = 0;

  Photo({this.id, this.photoUrl, this.thumbUrl, this.like, this.dislike});

  // fromJson
  Photo.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            photoUrl: json['photoUrl'],
            thumbUrl: json['thumbUrl'],
            like: json['like'],
            dislike: json['dislike']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'photoUrl': photoUrl,
        'thumbUrl': thumbUrl,
        'like': like,
        'dislike': dislike
      };
}
