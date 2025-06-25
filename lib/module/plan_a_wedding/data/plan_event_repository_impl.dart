import 'dart:io';

import 'package:dio/dio.dart';
import 'package:partyspot/module/login/data/models/file_upload_response.dart';
import 'package:partyspot/module/plan_a_wedding/data/models/plan_event_request.dart';
import 'package:partyspot/module/plan_a_wedding/data/models/plan_event_response.dart';
import 'package:partyspot/module/plan_a_wedding/domain/plan_event_repository.dart';
import 'package:partyspot/networking/api_urls.dart';
import 'package:partyspot/utils/services/part_spot_api_service.dart';

class PlanEventRepositoryImpl extends PartySportApiService implements PlanEventRepository {

  @override
  Future<PlanEventResponse?> postEventRequest({required PlanEventRequest? planEventRequest})async {
    final response = await postRequest(ApiUrl.createEventRequest, data: planEventRequest?.toJson());
    return PlanEventResponse.fromJson(response.data);
  }

  @override
  Future<FileUploadResponse?> uploadFile({File? file})async {
    final response = await postRequestWithFormData(ApiUrl.fileUpload, formBody: {'file': await MultipartFile.fromFile(
      file?.path ?? '',
    )});
    return FileUploadResponse.fromJson(response.data);
  }
}
