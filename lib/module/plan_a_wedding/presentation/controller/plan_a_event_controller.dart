import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:partyspot/module/home/data/models/events_meta.dart';
import 'package:partyspot/module/plan_a_wedding/data/models/plan_event_request.dart';
import 'package:partyspot/module/plan_a_wedding/domain/plan_event_repository.dart';
import 'package:partyspot/networking/model/error_response_model.dart';
import 'package:partyspot/utils/classes/base_controller.dart';
import 'package:partyspot/utils/constants/service_const.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/loader.dart';
import 'package:partyspot/utils/widgets/snackbars.dart';

class PlanAEventController extends BaseController{

  final List<EventSubType?>? subTypes;
  final List<Venue?>? venueTypes;
  final List<FoodPref?>? foodPreferences;
  final EventType? eventType;

  PlanAEventController({required this.subTypes,required this.venueTypes,required this.foodPreferences,required this.eventType});

  final PlanEventRepository _planEventRepository = locator<PlanEventRepository>();

  final Rxn<DateTime?> _selectedDate = Rxn<DateTime?>();
  DateTime? get selectedDate => _selectedDate.value;
  set selectedDate(DateTime? val) => _selectedDate.value = val;

  final Rx<int?> _noOfGuest = Rxn<int>(100);
  int? get noOfGuest => _noOfGuest.value;
  set noOfGuest(int? val) => _noOfGuest.value = val;

  final RxList<Venue?> _selectedVenueTypes = <Venue?>[].obs;
  List<Venue?> get selectedVenueTypes => _selectedVenueTypes.toList();
  set selectedVenueTypes(List<Venue?> value) => _selectedVenueTypes.assignAll(value);

  final RxList<Name?> _selectedSubTypes = <Name?>[].obs;
  List<Name?> get selectedSubTypes => _selectedSubTypes.toList();
  set selectedSubTypes(List<Name?> value) => _selectedSubTypes.assignAll(value);

  final RxList<FoodPref?> _selectedFoodPreferences = <FoodPref?>[].obs;
  List<FoodPref?> get selectedFoodPreferences => _selectedFoodPreferences.toList();
  set selectedFoodPreferences(List<FoodPref?> value) => _selectedFoodPreferences.assignAll(value);

  final Rxn<File?> _file = Rxn<File?>();
  File? get file => _file.value;
  set file(File? val) => _file.value = val;

  final Rxn<String?> _specialReqUrl = Rxn<String?>();
  String? get specialReqUrl => _specialReqUrl.value;
  set specialReqUrl(String? val) => _specialReqUrl.value = val;



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


  Future<void> uploadPdf() async {
    file = await pickOnlyPdfFile();
    if(file != null){
      try {
        FullScreenLoading.show();
        final res = await _planEventRepository.uploadFile(file: file);
        specialReqUrl = res?.data?.url ?? '';
      } on ErrorResponse catch (e) {
        setErrorMessage(e.message);
      } catch (e) {
        setErrorMessage(StringConsts.unExpectedError,error: e);
      } finally {
        FullScreenLoading.hide();
      }
    }

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
      try {
        FullScreenLoading.show();

        final PlanEventRequest planEventRequest = PlanEventRequest(
          foodPreferences:  List.generate(foodPreferences?.length ?? 0, (index) => Name(name: foodPreferences?[index]?.name,id: foodPreferences?[index]?.id)),
          venueType: List.generate(venueTypes?.length ?? 0, (index) => Name(name: venueTypes?[index]?.name,id: venueTypes?[index]?.id)),
          startDate: selectedDate,
          numberOfGuests: noOfGuest,
          specialRequirements: specialReqUrl,
          subType: List.generate(subTypes?.length ?? 0, (index) => Name(name: subTypes?[index]?.name,id: subTypes?[index]?.id)),
          name: Name(name: eventType?.name,id: eventType?.id)
        );

        await _planEventRepository.postEventRequest(planEventRequest: planEventRequest);
      } on ErrorResponse catch (e) {
        setErrorMessage(e.message);
      } catch (e) {
        setErrorMessage(StringConsts.unExpectedError,error: e);
      } finally {
        FullScreenLoading.hide();
      }
    }
  }
}