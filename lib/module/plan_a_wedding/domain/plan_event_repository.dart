import 'dart:io';

import 'package:partyspot/module/login/data/models/file_upload_response.dart';
import 'package:partyspot/module/plan_a_wedding/data/models/plan_event_request.dart';

abstract class PlanEventRepository {
  Future postEventRequest({required PlanEventRequest? planEventRequest});
  Future<FileUploadResponse?> uploadFile({File? file});
}
