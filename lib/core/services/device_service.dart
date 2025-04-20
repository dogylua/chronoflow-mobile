import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'network_service.dart';

@lazySingleton
class DeviceService {
  final NetworkService _networkService;
  final SharedPreferences _prefs;

  DeviceService(this._networkService, this._prefs);

  String? get deviceId => _prefs.getString('device_id');
  String? get deviceName => _prefs.getString('device_name');

  Future<void> registerDevice(String name) async {
    try {
      final response = await _networkService.post(
        '/auth/register-device',
        data: {'name': name},
      );

      await _prefs.setString('device_id', response['deviceId'] as String);
      await _prefs.setString('device_name', name);
    } catch (e) {
      throw Exception('Failed to register device');
    }
  }

  Future<void> updateDeviceInfo(String name) async {
    if (deviceId == null) {
      throw Exception('Device not registered');
    }

    try {
      await _networkService.put(
        '/auth/devices/$deviceId',
        data: {'name': name},
      );
      await _prefs.setString('device_name', name);
    } catch (e) {
      throw Exception('Failed to update device info');
    }
  }

  Future<void> unregisterDevice() async {
    if (deviceId == null) {
      throw Exception('Device not registered');
    }

    try {
      await _networkService.delete('/auth/devices/$deviceId');
      await _prefs.remove('device_id');
      await _prefs.remove('device_name');
    } catch (e) {
      throw Exception('Failed to unregister device');
    }
  }
}
