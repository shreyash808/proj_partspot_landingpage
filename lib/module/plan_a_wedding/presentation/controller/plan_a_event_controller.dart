import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:partyspot/module/home/data/models/events_meta.dart';
import 'package:partyspot/utils/classes/base_controller.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/snackbars.dart';

class PlanAEventController extends BaseController{

  final List<EventSubType?>? subTypes;
  final List<Venue?>? venueTypes;
  final List<FoodPref?>? foodPreferences;

  PlanAEventController({required this.subTypes,required this.venueTypes,required this.foodPreferences});

  List<String?> selectedSubTypes = [];

  final Rxn<DateTime?> _selectedDate = Rxn<DateTime?>();
  DateTime? get selectedDate => _selectedDate.value;
  set selectedDate(DateTime? val) => _selectedDate.value = val;

  final Rx<int?> _noOfGuest = Rxn<int>(100);
  int? get noOfGuest => _noOfGuest.value;
  set noOfGuest(int? val) => _noOfGuest.value = val;

  List<String?> selectedVenueTypes = [];
  List<String?> selectedFoodPreferences = [];

  final Rxn<File?> _file = Rxn<File?>();
  File? get file => _file.value;
  set file(File? val) => _file.value = val;

  @override
  void onInit() {
    super.onInit();
    ever<String>(errorMessageRx, (String msg) {
      Future.microtask((){
        if (msg.isNotEmpty) {
          showSnackBar(text: errorMessage, isError: true);
          setErrorMessage('');
        }
      });
    });
  }

  uploadPdf()async{
    file = await pickOnlyPdfFile();
  }

  Future<File?> pickOnlyPdfFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      withData: false, // set true if you need file bytes
    );

    if (result != null && result.files.single.path != null) {
      return File(result.files.single.path ?? '');
    }
    return null; // User canceled
  }

  Future<void> submit(Function()? onSuccess)async{
    if(selectedDate == null){
      setErrorMessage(StringConsts.pleaseSelectDate);
    }else if(selectedVenueTypes.isEmpty){
      setErrorMessage(StringConsts.pleaseSelectVenue);
    }else if(selectedFoodPreferences.isEmpty){
      setErrorMessage(StringConsts.pleaseSelectFoodPreference);
    }else if(file == null){
      setErrorMessage(StringConsts.pleaseSelectDate);
    }else{
      onSuccess?.call();
    }
  }
}