import 'package:partyspot/utils/classes/base_controller.dart';

class ExploreController extends BaseController {
  List<String> areaList = [
    'Ratanada',
    'Sardarpura',
    'Shastri Nagar',
    'Pratap Nagar',
  ];

  List<String> themeList = [
    'Night Club',
    'Karaoke Night',
    'Rooftop',
    'Cocktail',
  ];

  List<String> priceList = [
    '₹1000 - ₹10000',
    '₹20000 - ₹20000',
    'More than ₹25000',
  ];
  List<String> months = [
    'Alll Months',
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  List<String> selectedPrice = [];
  List<String> selectedTheme = [];
  List<String> selectedArea = [];
}
