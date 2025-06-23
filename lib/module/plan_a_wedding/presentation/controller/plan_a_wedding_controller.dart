import 'dart:io';
import 'package:partyspot/module/home/data/models/events_meta.dart';
import 'package:partyspot/utils/classes/base_controller.dart';


class PlanAWeddingController extends BaseController{

  final List<EventSubType?>? subTypes;
  final List<Venue?>? venueTypes;
  final List<FoodPref?>? foodPreferences;

  PlanAWeddingController({required this.subTypes,required this.venueTypes,required this.foodPreferences});

  List<String?> selectedSubTypes = [];
  DateTime? date;
  int noOfGuest = 1;
  List<String?> selectedVenueTypes = [];
  List<String?> selectedFoodPreferences = [];
  File? file;


  @override
  void onInit() {
    super.onInit();
  }

}