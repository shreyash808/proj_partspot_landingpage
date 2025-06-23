import 'package:partyspot/module/home/data/models/events_meta.dart';
import 'package:partyspot/module/home/domain/repositories/home_repository.dart';
import 'package:partyspot/networking/api_urls.dart';
import 'package:partyspot/utils/services/part_spot_api_service.dart';

class HomeRepositoryImpl extends PartySportApiService implements HomeRepository {
  @override
  Future<EventsMetaDataResponse?> getEventMetaData() async{
    final response = await getRequest(ApiUrl.eventsMetaData);
    return EventsMetaDataResponse.fromJson(response.data);
  }
}