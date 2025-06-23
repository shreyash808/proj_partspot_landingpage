import 'package:get/get.dart';
import 'package:partyspot/module/login/domain/repositories/auth_repository.dart';
import 'package:partyspot/networking/model/error_response_model.dart';
import 'package:partyspot/utils/classes/base_controller.dart';
import 'package:partyspot/utils/classes/value_controller.dart';
import 'package:partyspot/utils/constants/service_const.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/loader.dart';
import 'package:partyspot/utils/widgets/snackbars.dart';

class UserDetailController extends BaseController {

  final AuthRepository _loginRepository = locator<AuthRepository>();

  String? fullName;
  String? email;
  String? profilePic;
  int? phoneNumber;
  final ValueController<String?> gender = ValueController<String?>();
  final ValueController<DateTime?> selectedDate = ValueController<DateTime?>();
  final ValueController<String?> countryFlagController = ValueController<String?>("91");

  final Rx<bool> _isTncAccepted = Rx<bool>(false);
  bool get isTncAccepted => _isTncAccepted.value;
  set isTncAccepted(bool val) => _isTncAccepted.value = val;

  @override
  void onInit() {
    super.onInit();

    onGetUserDetail();

    ever<String>(errorMessageRx, (String msg) {
      Future.microtask((){
        if (msg.isNotEmpty) {
          showSnackBar(text: errorMessage, isError: true);
          setErrorMessage('');
        }
      });
    });

    ever<String>(successMessageRX, (String msg) {
      Future.microtask((){
        if (msg.isNotEmpty) {
          showSnackBar(text: successMessage);
          setErrorMessage('');
        }
      });
    });
  }

  Future<void> onUpdateProfile({void Function()? onSuccess}) async {
    try {
      FullScreenLoading.show();
      await _loginRepository.updateProfile(
        fullName: fullName,
        gender: gender.value,
        profilePicture: profilePic,
        dob: selectedDate.value?.toIso8601String(),
        email: email
      );
      onSuccess?.call();
    } on ErrorResponse catch (e) {
      setErrorMessage(e.message);
    } catch (e) {
      setErrorMessage(StringConsts.unExpectedError);
    } finally{
      FullScreenLoading.hide();
    }
  }

  Future<void> onGetUserDetail() async {
    try {
      setBusy(true);
      final res = await _loginRepository.userDetail();
      fullName = res?.data?.user?.fullName;
      email = res?.data?.user?.email;
      selectedDate.updateValue(res?.data?.user?.dob);
      countryFlagController.updateValue(res?.data?.user?.code);
      gender.updateValue(res?.data?.user?.gender);
      phoneNumber = res?.data?.user?.phone;
    } on ErrorResponse catch (e) {
      setErrorMessage(e.message);
    } catch (e) {
      setErrorMessage(StringConsts.unExpectedError);
    }
    setBusy(false);
  }


}
