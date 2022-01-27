import 'package:dio/dio.dart';
import 'package:getxtest/env.dart';
import 'package:getxtest/exp/exp_models.dart';

class UsersProvider{
  final String _url = "$url/users";

  getAll() async {
    try{
      final res = await dio.get(_url);

      List<dynamic> records = res.data;

      return records.map((json) => User.fromJson(json)).toList();

    } on DioError catch (e){

      switch (e.response!.statusCode.toString()){
        default:
          break;
      }

      return "Error";
    }
  }

  get(String id) async {
    try{
      final res = await dio.get("$_url/$id");

      Map<String, dynamic> record = res.data;

      return User.fromJson(record);

    } on DioError catch (e){

      switch (e.response!.statusCode.toString()){
        default:
          break;
      }

      return "Error";
    }
  }
}