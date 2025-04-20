// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:device_info_plus/device_info_plus.dart' as _i833;
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/auth/data/datasources/auth_remote_data_source.dart'
    as _i107;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/use_cases/authenticate_with_qr.dart'
    as _i125;
import '../../features/auth/domain/use_cases/check_auth_status.dart' as _i790;
import '../../features/auth/domain/use_cases/logout.dart' as _i999;
import '../../features/auth/domain/use_cases/refresh_token.dart' as _i182;
import '../../features/auth/domain/use_cases/register_device.dart' as _i37;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i797;
import '../../features/settings/presentation/bloc/settings_bloc.dart' as _i585;
import '../network/network_info.dart' as _i932;
import '../router/app_router.dart' as _i81;
import '../services/device_service.dart' as _i738;
import '../services/network_service.dart' as _i463;
import '../services/qr_code_service.dart' as _i878;
import 'app_module.dart' as _i460;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  await gh.factoryAsync<_i460.SharedPreferences>(
    () => appModule.prefs,
    preResolve: true,
  );
  gh.factory<_i585.SettingsBloc>(() => _i585.SettingsBloc());
  gh.singleton<_i361.Dio>(() => appModule.dio);
  gh.singleton<_i558.FlutterSecureStorage>(() => appModule.secureStorage);
  gh.singleton<_i833.DeviceInfoPlugin>(() => appModule.deviceInfoPlugin);
  gh.lazySingleton<_i81.AppRouter>(() => _i81.AppRouter());
  gh.factory<_i932.NetworkInfo>(
      () => _i932.NetworkInfoImpl(gh<_i895.Connectivity>()));
  gh.factory<_i463.NetworkService>(() => _i463.NetworkService(
        gh<_i361.Dio>(),
        gh<_i460.SharedPreferences>(),
      ));
  gh.lazySingleton<_i878.QRCodeService>(
      () => _i878.QRCodeService(gh<_i463.NetworkService>()));
  gh.factory<_i107.AuthRemoteDataSource>(
      () => _i107.AuthRemoteDataSource(gh<_i463.NetworkService>()));
  gh.factory<_i787.AuthRepository>(() => _i153.AuthRepositoryImpl(
        gh<_i463.NetworkService>(),
        gh<_i558.FlutterSecureStorage>(),
        gh<_i833.DeviceInfoPlugin>(),
      ));
  gh.lazySingleton<_i738.DeviceService>(() => _i738.DeviceService(
        gh<_i463.NetworkService>(),
        gh<_i460.SharedPreferences>(),
      ));
  gh.factory<_i37.RegisterDevice>(
      () => _i37.RegisterDevice(gh<_i787.AuthRepository>()));
  gh.factory<_i790.CheckAuthStatus>(
      () => _i790.CheckAuthStatus(gh<_i787.AuthRepository>()));
  gh.factory<_i999.Logout>(() => _i999.Logout(gh<_i787.AuthRepository>()));
  gh.factory<_i125.AuthenticateWithQR>(
      () => _i125.AuthenticateWithQR(gh<_i787.AuthRepository>()));
  gh.factory<_i182.RefreshToken>(
      () => _i182.RefreshToken(gh<_i787.AuthRepository>()));
  gh.factory<_i797.AuthBloc>(() => _i797.AuthBloc(gh<_i787.AuthRepository>()));
  return getIt;
}

class _$AppModule extends _i460.AppModule {}
