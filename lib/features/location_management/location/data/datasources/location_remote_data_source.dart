import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:mobeen/features/location_management/location/data/models/location_model.dart';
import 'package:mobeen/core/errors/network_exceptions.dart';

abstract class BaseLocationRemoteDataSource {
  Future<void> addLocation(LocationModel location);

  Future<List<LocationModel>> getLocations();
}

@LazySingleton(as: BaseLocationRemoteDataSource)
class LocationRemoteDataSource implements BaseLocationRemoteDataSource {
  final SupabaseClient _supabase;

  LocationRemoteDataSource(this._supabase);

  @override
  Future<void> addLocation(LocationModel location) async {
    try {
      print('TTTTESTTTING');
      print(location );

      await _supabase.from('work_locations').insert(location.toJson());
    } catch (error) {
      print(error);
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<List<LocationModel>> getLocations() async {
    try {
      final response = await _supabase.from('work_locations').select();
      print(response);
      return (response as List).map((e) => LocationModel.fromJson(e)).toList();
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
