
import 'package:partyspot/module/home/data/models/events_meta.dart';

abstract class HomeRepository {
  Future<EventsMetaDataResponse?> getEventMetaData();
}
