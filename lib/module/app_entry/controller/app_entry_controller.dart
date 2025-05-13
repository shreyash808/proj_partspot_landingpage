import 'package:partyspot/utils/classes/base_controller.dart';

class AppEntryController extends BaseController{
  int selectedIndex = 0;

  updateIndex(int val){
    selectedIndex = val;
    update();
  }

}