
import 'package:partyspot/module/home/data/models/banner_response_model.dart';
import 'package:partyspot/module/home/data/models/events_meta.dart';

abstract class HomeRepository {
  Future<EventsMetaDataResponse?> getEventMetaData();
  Future<BannerResponse?> getBannerData();
}
