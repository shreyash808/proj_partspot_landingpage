import 'package:get/get.dart';
import 'package:partyspot/module/home/data/models/events_meta.dart';
import 'package:partyspot/module/home/domain/repositories/home_repository.dart';
import 'package:partyspot/networking/model/error_response_model.dart';
import 'package:partyspot/utils/classes/base_controller.dart';
import 'package:partyspot/utils/constants/service_const.dart';
import 'package:partyspot/utils/constants/string_consts.dart';

class HomeController extends BaseController{
  final HomeRepository _homeRepository = locator<HomeRepository>();

  final Rxn<EventsMetaDataResponse?> _eventMetaData = Rxn<EventsMetaDataResponse?>();
  EventsMetaDataResponse? get eventMetaData => _eventMetaData.value;
  set eventMetaData(EventsMetaDataResponse? busy) {
    _eventMetaData.value = busy;
  }

  @override
  void onInit() {
    super.onInit();
    getMetaData();
  }

  Future<void> getMetaData({void Function()? onSuccess}) async {
    try {
      setBusy(true);
      update();
      eventMetaData = await _homeRepository.getEventMetaData();
      onSuccess?.call();
    } on ErrorResponse catch (e) {
      setErrorMessage(e.message);
    } catch (e) {
      setErrorMessage(StringConsts.unExpectedError);
    } finally{
      setBusy(false);
      update();
    }
  }

}