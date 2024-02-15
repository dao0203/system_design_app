import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:system_design_app/data/location_repository.dart';
import 'package:system_design_app/data/location_repository_Impl.dart';

final locationRepositoryProvider = Provider<LocationRepository>((ref) {
  return LocationRepositoryImpl();
});
