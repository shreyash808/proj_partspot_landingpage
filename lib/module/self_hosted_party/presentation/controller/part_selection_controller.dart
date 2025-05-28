import 'package:get/get.dart';
import 'package:partyspot/utils/classes/base_controller.dart';

class PartyTypeSelectionController extends BaseController {
  final bool isMultiSelect;

  PartyTypeSelectionController({this.isMultiSelect = true});

  final selectedItems = <String>[].obs;

  void toggleSelection(String item) {
    if (isMultiSelect) {
      if (selectedItems.contains(item)) {
        selectedItems.remove(item);
      } else {
        selectedItems.add(item);
      }
    } else {
      selectedItems.value = [item];
    }
  }

  bool isSelected(String item) => selectedItems.contains(item);
}