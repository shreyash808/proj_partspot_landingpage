import 'package:partyspot/utils/constants/image_consts.dart';

class DataModel {
  final int id;
  final String image;
  final String text;
  bool selected;
  final Function(String)? onClick;

  DataModel(
      {this.id = -1, this.image = AppImages.placeholderImage, this.text = '', this.selected = false, this.onClick});
}
