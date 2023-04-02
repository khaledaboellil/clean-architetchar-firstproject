import 'package:equatable/equatable.dart';

class Post extends Equatable{
   final String body;
   final String title ;
   final int id ;

  const Post({
   required this.body,
    required this.id,
    required this.title
    });

  @override
  // TODO: implement props
  List<Object?> get props => ([body,id,title]);


}