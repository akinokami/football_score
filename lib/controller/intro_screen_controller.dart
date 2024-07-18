
import 'package:get/get.dart';

import '../model/sport_icon_model.dart';

class IntroScreenController extends GetxController {
RxList<SportIconModel> sportIconList = <SportIconModel>[].obs;
RxList<int> selectedSportIndex = <int>[].obs;
  @override
  void onInit() {
   sportIconList=[
     SportIconModel(icon: 'assets/images/mls.webp',name: 'MLS'),
     SportIconModel(icon: 'assets/images/saudi.webp',name: 'Saudi Pro League'),
     SportIconModel(icon: 'assets/images/k1.webp',name: 'K1 League'),
     SportIconModel(icon: 'assets/images/jone.webp',name: 'j1 League'),
     SportIconModel(icon: 'assets/images/aleague.webp',name: 'A League'),
     SportIconModel(icon: 'assets/images/j2.webp',name: 'J2 League'),


   ].obs;
    super.onInit();
  }
void selectSport(int index){
  if(selectedSportIndex.contains(index)){
    selectedSportIndex.remove(index);
  }else{
    selectedSportIndex.add(index);
  }
  update();
}
  @override
  void dispose() {
    //
    super.dispose();
  }
}