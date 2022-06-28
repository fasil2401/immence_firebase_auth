

import 'package:get/get.dart';

class PasswordController extends GetxController {
  
  var status = true.obs;
  

  check(){
    if(status.value == true){
      status.value = false;
      
    }else{
      status.value = true;
      
    }
  }
}