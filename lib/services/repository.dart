import 'package:getxtest/services/provider.dart';

class UsersRepository {
  static UsersProvider _provider = UsersProvider();

  static getAll() {
    var records = _provider.getAll();
    return records;
  }

  static get(id) {
    var record = _provider.get(id);
    return record;
  }

}