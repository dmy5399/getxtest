import 'package:get/get.dart';
import 'package:getxtest/models/user.dart';
import 'package:getxtest/services/repository.dart';

class UsersController extends GetxController{
  final List<User> records = <User>[].obs;
  RxBool loading = false.obs;
  RxBool error = false.obs;
  RxString errorDesc = "".obs;

  _getUsers() async {
    loading(true);

    try{
      // Get users from repository
      var users = await UsersRepository.getAll();

      // Add users to obs variable
      for(var user in users){
        records.add(user);
      }
    } catch(e) {
      error(true);
      errorDesc("No connection");
    }

    loading(false);

  }

  @override
  void onInit(){
    _getUsers();
    super.onInit;
  }

}