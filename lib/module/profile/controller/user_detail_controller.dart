import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';
import 'package:partyspot/module/login/domain/repositories/auth_repository.dart';
import 'package:partyspot/networking/model/error_response_model.dart';
import 'package:partyspot/utils/classes/base_controller.dart';
import 'package:partyspot/utils/constants/service_const.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/loader.dart';
import 'package:partyspot/utils/widgets/snackbars.dart';

class UserDetailController extends BaseController {

  final AuthRepository _loginRepository = locator<AuthRepository>();

  String? fullName;
  String? gender;
  String? dob;
  String? email;
  String? profilePic;
  int? phoneNumber;
  String? code;

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
      await _loginRepository.updateProfile(fullName: fullName,gender: gender,profilePicture: profilePic);
      onSuccess?.call();
    } on ErrorResponse catch (e) {
      setErrorMessage(e.message);
    } catch (e) {
      setErrorMessage(StringConsts.unExpectedError);
    }
    FullScreenLoading.hide();
  }

  Future<void> onGetUserDetail() async {
    try {
      setBusy(true);
      final res = await _loginRepository.userDetail();
      fullName = res?.data?.fullName;
      email = res?.data?.email;
      dob = res?.data?.dob != null ? DateFormat('dd/MM/yyyy').format(res?.data?.dob ?? DateTime.now()) : null;
      code = res?.data?.code;
      phoneNumber = res?.data?.phone;
    } on ErrorResponse catch (e) {
      setErrorMessage(e.message);
    } catch (e) {
      setErrorMessage(StringConsts.unExpectedError);
    }
    setBusy(false);
  }

}
