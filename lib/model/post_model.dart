class Post
{
  String hindi;
  String created;
  String updated;
  String id;
  String title;
  String english;
  String postType;
  int v;

  Post({this.hindi,this.created,this.updated,this.id,this.title,this.english,this.postType,this.v});

  factory Post.fromJson(Map<String,dynamic> json)
  {
    return Post(
      hindi: json["hindi"],
      created: json["created"],
      updated: json["updated"],
      id: json["_id"],
      title: json["title"],
      english: json["english"],
      postType: json["postType"],
      v: json["__v"]
    );
  }

}

