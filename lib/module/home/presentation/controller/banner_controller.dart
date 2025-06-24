import 'package:get/get.dart';
import 'package:partyspot/module/home/data/models/banner_response_model.dart';
import 'package:partyspot/module/home/domain/repositories/home_repository.dart';
import 'package:partyspot/networking/model/error_response_model.dart';
import 'package:partyspot/utils/classes/base_controller.dart';
import 'package:partyspot/utils/constants/service_const.dart';
import 'package:partyspot/utils/constants/string_consts.dart';

class BannerController extends BaseController{
  final HomeRepository _homeRepository = locator<HomeRepository>();

  final Rxn<BannerResponse?> _bannerData = Rxn<BannerResponse?>();
  BannerResponse? get bannerData => _bannerData.value;
  set bannerData(BannerResponse? busy) {
    _bannerData.value = busy;
  }

  @override
  void onInit() {
    super.onInit();
    fetchBanners();
  }

  Future<void> fetchBanners({void Function()? onSuccess}) async {
    try {
      setBusy(true);
      update();
      bannerData = await _homeRepository.getBannerData();
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