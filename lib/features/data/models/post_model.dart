import 'package:posts/features/domain/entites/posts.dart';

class PostModel extends Post {
  const PostModel({
    required super.body,
    required super.id,
    required super.title
});
  Map<String,dynamic>toMap(){
    return{
      "body":body,
      "id":id,
      "title":title,
    };
  }

  factory PostModel.fromJson(Map<String,dynamic>json)=>PostModel(body: json["body"], id: json["id"], title: json["title"]) ;

}