import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:system_design_app/data/di/repository_provider.dart';
import 'package:system_design_app/model/location.dart';

part 'location_state.g.dart';

@riverpod
class LocationState extends _$LocationState {
  @override
  Stream<Location> build() {
    return ref.watch(locationRepositoryProvider).getLocation();
  }
}
