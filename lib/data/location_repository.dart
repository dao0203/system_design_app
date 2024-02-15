import 'package:system_design_app/model/location.dart';

abstract interface class LocationRepository {
  Future<Location> getLocation();
}
