
import 'package:get/get.dart';

import '../model/sport_icon_model.dart';

class IntroScreenController extends GetxController {
RxList<SportIconModel> sportIconList = <SportIconModel>[].obs;
RxList<int> selectedSportIndex = <int>[].obs;
  @override
  void onInit() {
   sportIconList=[SportIconModel(icon: 'assets/images/football.webp',name: 'Football'),
     SportIconModel(icon: 'assets/images/soccer.webp',name: 'Soccer'),
     SportIconModel(icon: 'assets/images/tennis.webp',name: 'Tennis'),
     SportIconModel(icon: 'assets/images/volleyball.webp',name: 'Volleyball'),
     SportIconModel(icon: 'assets/images/cricket.webp',name: 'Cricket'),
     SportIconModel(icon: 'assets/images/basketball.webp',name: 'Basketball'),

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