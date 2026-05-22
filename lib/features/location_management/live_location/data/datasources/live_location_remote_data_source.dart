import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:mobeen/core/services/user_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:mobeen/features/location_management/live_location/data/models/live_location_model.dart';

abstract class BaseLiveLocationRemoteDataSource {
  Future<void> updateLiveLocation(LiveLocationModel model);
  Stream<List<LiveLocationModel>> streamLiveLocations();
}

@LazySingleton(as: BaseLiveLocationRemoteDataSource)
class LiveLocationRemoteDataSource implements BaseLiveLocationRemoteDataSource {
  final SupabaseClient _supabase;
  final UserService _userService;

  LiveLocationRemoteDataSource(this._userService, this._supabase);

  @override
  Future<void> updateLiveLocation(LiveLocationModel model) async {
    await _supabase.from('users_locations').upsert({
      'user_id': model.userId,
      'latitude': model.latitude,
      'longitude': model.longitude,
      'updated_at': DateTime.now().toIso8601String(),
    }, onConflict: 'user_id');
  }

@override
Stream<List<LiveLocationModel>> streamLiveLocations() {
  final user = _userService.getUser;

  return _supabase
      .from('supervisor_live_locations')
      .stream(primaryKey: ['user_id'])
      .eq('supervisor_id', user!.id) 
      .map((data) {
        return data
            .map((e) => LiveLocationModel.fromJson(e))
            .toList();
      });
}
}
