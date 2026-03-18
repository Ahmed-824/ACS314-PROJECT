import 'package:get/state_manager.dart' ;

class LogincController extends GetxController {

var username = ''.obs;
var passwordVisible = false.obs;
login(user, pass){
  username.value=user;
  password.value=pass;
  if (username=="admin" && password.value=="123") {
    return true;
    
  }
  else{
    return false;
  }

}
togglePassword(){
  passwordVisible.value =!passwordVisible.value;
}

}