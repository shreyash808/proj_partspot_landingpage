import 'package:get/get.dart';
import 'package:partyspot/utils/classes/base_controller.dart';

class PartyTypeSelectionController<T> extends BaseController {
  final bool isMultiSelect;

  PartyTypeSelectionController({this.isMultiSelect = true});

  final RxList<T?> selectedItems = <T?>[].obs;

  void toggleSelection(T? item) {
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

  bool isSelected(T? item) => selectedItems.contains(item);
}
