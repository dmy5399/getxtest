import 'dart:developer';
import 'package:getxtest/env.dart';
import 'package:getxtest/exp/exp_models.dart';
import 'package:getxtest/services/provider.dart';
import 'package:getxtest/utils/exceptions.dart';

class UsersRepository {
  static final UsersProvider _provider = UsersProvider();

  static getAll() async {
    try{
      var records = await _provider.getAll();

      return records;
    } catch (e){
      if(db.get('users') != null){
        return db.get('users');
      } else {
        throw InternetConnectionException();
      }
    }

  }

  static get(id) {
    var record = _provider.get(id);
    return record;
  }

}