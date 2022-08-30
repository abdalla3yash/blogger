import 'dart:convert';

import 'package:blogger/core/error/exception.dart';
import 'package:blogger/core/error/failure.dart';
import 'package:blogger/featuers/posts/data/models/post_model.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  Future<List<PostModel>> getCachedPosts();
  Future<Unit> cachePosts(List<PostModel> postsModel);
}

class LocalDataSourceImplement implements LocalDataSource {
  final SharedPreferences sharedPreferences;
  LocalDataSourceImplement({required this.sharedPreferences});

  @override
  Future<Unit> cachePosts(List<PostModel> postsModels) {
    List postModelToJson = postsModels
        .map<Map<String, dynamic>>((postModel) => postModel.toJson())
        .toList();
    sharedPreferences.setString("CHACED_POSTS", json.encode(postModelToJson));
    return Future.value(unit);
  }

  @override
  Future<List<PostModel>> getCachedPosts() {
    final jsonString = sharedPreferences.getString("CHACED_POSTS");
    if (jsonString != null) {
      List decodeJsonDate = json.decode(jsonString);
      List<PostModel> jsonToPostModel = decodeJsonDate
          .map<PostModel>((jsonPostModel) => PostModel.fromJson(jsonPostModel))
          .toList();
      return Future.value(jsonToPostModel);
    } else {
      throw EmptyCacheException();
    }
  }
}
