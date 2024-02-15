import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:system_design_app/data/location_repository.dart';
import 'package:system_design_app/model/location.dart';

class LocationRepositoryImpl implements LocationRepository {
  final _client = Supabase.instance.client;
  @override
  Stream<Location> getLocation() {
    return _client
        .from('locations')
        .stream(primaryKey: ['id'])
        .eq('id', 'b8a58138-0728-4bab-b7e9-109a6df0af79')
        .map((event) => Location.fromJson(event.first));
  }
}
