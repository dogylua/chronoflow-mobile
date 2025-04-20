// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthStatus,
    required TResult Function() registerDevice,
    required TResult Function(String qrCode) authenticateWithQRCode,
    required TResult Function() logout,
    required TResult Function() signInWithGoogle,
    required TResult Function() signInWithApple,
    required TResult Function() signOut,
    required TResult Function(String? accessToken) authStateChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthStatus,
    TResult? Function()? registerDevice,
    TResult? Function(String qrCode)? authenticateWithQRCode,
    TResult? Function()? logout,
    TResult? Function()? signInWithGoogle,
    TResult? Function()? signInWithApple,
    TResult? Function()? signOut,
    TResult? Function(String? accessToken)? authStateChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthStatus,
    TResult Function()? registerDevice,
    TResult Function(String qrCode)? authenticateWithQRCode,
    TResult Function()? logout,
    TResult Function()? signInWithGoogle,
    TResult Function()? signInWithApple,
    TResult Function()? signOut,
    TResult Function(String? accessToken)? authStateChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuthStatus value) checkAuthStatus,
    required TResult Function(_RegisterDevice value) registerDevice,
    required TResult Function(_AuthenticateWithQRCode value)
        authenticateWithQRCode,
    required TResult Function(_Logout value) logout,
    required TResult Function(_SignInWithGoogle value) signInWithGoogle,
    required TResult Function(_SignInWithApple value) signInWithApple,
    required TResult Function(_SignOut value) signOut,
    required TResult Function(_AuthStateChanged value) authStateChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(_RegisterDevice value)? registerDevice,
    TResult? Function(_AuthenticateWithQRCode value)? authenticateWithQRCode,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult? Function(_SignInWithApple value)? signInWithApple,
    TResult? Function(_SignOut value)? signOut,
    TResult? Function(_AuthStateChanged value)? authStateChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult Function(_RegisterDevice value)? registerDevice,
    TResult Function(_AuthenticateWithQRCode value)? authenticateWithQRCode,
    TResult Function(_Logout value)? logout,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_SignInWithApple value)? signInWithApple,
    TResult Function(_SignOut value)? signOut,
    TResult Function(_AuthStateChanged value)? authStateChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CheckAuthStatusImplCopyWith<$Res> {
  factory _$$CheckAuthStatusImplCopyWith(_$CheckAuthStatusImpl value,
          $Res Function(_$CheckAuthStatusImpl) then) =
      __$$CheckAuthStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckAuthStatusImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$CheckAuthStatusImpl>
    implements _$$CheckAuthStatusImplCopyWith<$Res> {
  __$$CheckAuthStatusImplCopyWithImpl(
      _$CheckAuthStatusImpl _value, $Res Function(_$CheckAuthStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CheckAuthStatusImpl implements _CheckAuthStatus {
  const _$CheckAuthStatusImpl();

  @override
  String toString() {
    return 'AuthEvent.checkAuthStatus()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckAuthStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthStatus,
    required TResult Function() registerDevice,
    required TResult Function(String qrCode) authenticateWithQRCode,
    required TResult Function() logout,
    required TResult Function() signInWithGoogle,
    required TResult Function() signInWithApple,
    required TResult Function() signOut,
    required TResult Function(String? accessToken) authStateChanged,
  }) {
    return checkAuthStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthStatus,
    TResult? Function()? registerDevice,
    TResult? Function(String qrCode)? authenticateWithQRCode,
    TResult? Function()? logout,
    TResult? Function()? signInWithGoogle,
    TResult? Function()? signInWithApple,
    TResult? Function()? signOut,
    TResult? Function(String? accessToken)? authStateChanged,
  }) {
    return checkAuthStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthStatus,
    TResult Function()? registerDevice,
    TResult Function(String qrCode)? authenticateWithQRCode,
    TResult Function()? logout,
    TResult Function()? signInWithGoogle,
    TResult Function()? signInWithApple,
    TResult Function()? signOut,
    TResult Function(String? accessToken)? authStateChanged,
    required TResult orElse(),
  }) {
    if (checkAuthStatus != null) {
      return checkAuthStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuthStatus value) checkAuthStatus,
    required TResult Function(_RegisterDevice value) registerDevice,
    required TResult Function(_AuthenticateWithQRCode value)
        authenticateWithQRCode,
    required TResult Function(_Logout value) logout,
    required TResult Function(_SignInWithGoogle value) signInWithGoogle,
    required TResult Function(_SignInWithApple value) signInWithApple,
    required TResult Function(_SignOut value) signOut,
    required TResult Function(_AuthStateChanged value) authStateChanged,
  }) {
    return checkAuthStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(_RegisterDevice value)? registerDevice,
    TResult? Function(_AuthenticateWithQRCode value)? authenticateWithQRCode,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult? Function(_SignInWithApple value)? signInWithApple,
    TResult? Function(_SignOut value)? signOut,
    TResult? Function(_AuthStateChanged value)? authStateChanged,
  }) {
    return checkAuthStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult Function(_RegisterDevice value)? registerDevice,
    TResult Function(_AuthenticateWithQRCode value)? authenticateWithQRCode,
    TResult Function(_Logout value)? logout,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_SignInWithApple value)? signInWithApple,
    TResult Function(_SignOut value)? signOut,
    TResult Function(_AuthStateChanged value)? authStateChanged,
    required TResult orElse(),
  }) {
    if (checkAuthStatus != null) {
      return checkAuthStatus(this);
    }
    return orElse();
  }
}

abstract class _CheckAuthStatus implements AuthEvent {
  const factory _CheckAuthStatus() = _$CheckAuthStatusImpl;
}

/// @nodoc
abstract class _$$RegisterDeviceImplCopyWith<$Res> {
  factory _$$RegisterDeviceImplCopyWith(_$RegisterDeviceImpl value,
          $Res Function(_$RegisterDeviceImpl) then) =
      __$$RegisterDeviceImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegisterDeviceImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$RegisterDeviceImpl>
    implements _$$RegisterDeviceImplCopyWith<$Res> {
  __$$RegisterDeviceImplCopyWithImpl(
      _$RegisterDeviceImpl _value, $Res Function(_$RegisterDeviceImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RegisterDeviceImpl implements _RegisterDevice {
  const _$RegisterDeviceImpl();

  @override
  String toString() {
    return 'AuthEvent.registerDevice()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RegisterDeviceImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthStatus,
    required TResult Function() registerDevice,
    required TResult Function(String qrCode) authenticateWithQRCode,
    required TResult Function() logout,
    required TResult Function() signInWithGoogle,
    required TResult Function() signInWithApple,
    required TResult Function() signOut,
    required TResult Function(String? accessToken) authStateChanged,
  }) {
    return registerDevice();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthStatus,
    TResult? Function()? registerDevice,
    TResult? Function(String qrCode)? authenticateWithQRCode,
    TResult? Function()? logout,
    TResult? Function()? signInWithGoogle,
    TResult? Function()? signInWithApple,
    TResult? Function()? signOut,
    TResult? Function(String? accessToken)? authStateChanged,
  }) {
    return registerDevice?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthStatus,
    TResult Function()? registerDevice,
    TResult Function(String qrCode)? authenticateWithQRCode,
    TResult Function()? logout,
    TResult Function()? signInWithGoogle,
    TResult Function()? signInWithApple,
    TResult Function()? signOut,
    TResult Function(String? accessToken)? authStateChanged,
    required TResult orElse(),
  }) {
    if (registerDevice != null) {
      return registerDevice();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuthStatus value) checkAuthStatus,
    required TResult Function(_RegisterDevice value) registerDevice,
    required TResult Function(_AuthenticateWithQRCode value)
        authenticateWithQRCode,
    required TResult Function(_Logout value) logout,
    required TResult Function(_SignInWithGoogle value) signInWithGoogle,
    required TResult Function(_SignInWithApple value) signInWithApple,
    required TResult Function(_SignOut value) signOut,
    required TResult Function(_AuthStateChanged value) authStateChanged,
  }) {
    return registerDevice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(_RegisterDevice value)? registerDevice,
    TResult? Function(_AuthenticateWithQRCode value)? authenticateWithQRCode,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult? Function(_SignInWithApple value)? signInWithApple,
    TResult? Function(_SignOut value)? signOut,
    TResult? Function(_AuthStateChanged value)? authStateChanged,
  }) {
    return registerDevice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult Function(_RegisterDevice value)? registerDevice,
    TResult Function(_AuthenticateWithQRCode value)? authenticateWithQRCode,
    TResult Function(_Logout value)? logout,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_SignInWithApple value)? signInWithApple,
    TResult Function(_SignOut value)? signOut,
    TResult Function(_AuthStateChanged value)? authStateChanged,
    required TResult orElse(),
  }) {
    if (registerDevice != null) {
      return registerDevice(this);
    }
    return orElse();
  }
}

abstract class _RegisterDevice implements AuthEvent {
  const factory _RegisterDevice() = _$RegisterDeviceImpl;
}

/// @nodoc
abstract class _$$AuthenticateWithQRCodeImplCopyWith<$Res> {
  factory _$$AuthenticateWithQRCodeImplCopyWith(
          _$AuthenticateWithQRCodeImpl value,
          $Res Function(_$AuthenticateWithQRCodeImpl) then) =
      __$$AuthenticateWithQRCodeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String qrCode});
}

/// @nodoc
class __$$AuthenticateWithQRCodeImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthenticateWithQRCodeImpl>
    implements _$$AuthenticateWithQRCodeImplCopyWith<$Res> {
  __$$AuthenticateWithQRCodeImplCopyWithImpl(
      _$AuthenticateWithQRCodeImpl _value,
      $Res Function(_$AuthenticateWithQRCodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qrCode = null,
  }) {
    return _then(_$AuthenticateWithQRCodeImpl(
      null == qrCode
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthenticateWithQRCodeImpl implements _AuthenticateWithQRCode {
  const _$AuthenticateWithQRCodeImpl(this.qrCode);

  @override
  final String qrCode;

  @override
  String toString() {
    return 'AuthEvent.authenticateWithQRCode(qrCode: $qrCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticateWithQRCodeImpl &&
            (identical(other.qrCode, qrCode) || other.qrCode == qrCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, qrCode);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticateWithQRCodeImplCopyWith<_$AuthenticateWithQRCodeImpl>
      get copyWith => __$$AuthenticateWithQRCodeImplCopyWithImpl<
          _$AuthenticateWithQRCodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthStatus,
    required TResult Function() registerDevice,
    required TResult Function(String qrCode) authenticateWithQRCode,
    required TResult Function() logout,
    required TResult Function() signInWithGoogle,
    required TResult Function() signInWithApple,
    required TResult Function() signOut,
    required TResult Function(String? accessToken) authStateChanged,
  }) {
    return authenticateWithQRCode(qrCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthStatus,
    TResult? Function()? registerDevice,
    TResult? Function(String qrCode)? authenticateWithQRCode,
    TResult? Function()? logout,
    TResult? Function()? signInWithGoogle,
    TResult? Function()? signInWithApple,
    TResult? Function()? signOut,
    TResult? Function(String? accessToken)? authStateChanged,
  }) {
    return authenticateWithQRCode?.call(qrCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthStatus,
    TResult Function()? registerDevice,
    TResult Function(String qrCode)? authenticateWithQRCode,
    TResult Function()? logout,
    TResult Function()? signInWithGoogle,
    TResult Function()? signInWithApple,
    TResult Function()? signOut,
    TResult Function(String? accessToken)? authStateChanged,
    required TResult orElse(),
  }) {
    if (authenticateWithQRCode != null) {
      return authenticateWithQRCode(qrCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuthStatus value) checkAuthStatus,
    required TResult Function(_RegisterDevice value) registerDevice,
    required TResult Function(_AuthenticateWithQRCode value)
        authenticateWithQRCode,
    required TResult Function(_Logout value) logout,
    required TResult Function(_SignInWithGoogle value) signInWithGoogle,
    required TResult Function(_SignInWithApple value) signInWithApple,
    required TResult Function(_SignOut value) signOut,
    required TResult Function(_AuthStateChanged value) authStateChanged,
  }) {
    return authenticateWithQRCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(_RegisterDevice value)? registerDevice,
    TResult? Function(_AuthenticateWithQRCode value)? authenticateWithQRCode,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult? Function(_SignInWithApple value)? signInWithApple,
    TResult? Function(_SignOut value)? signOut,
    TResult? Function(_AuthStateChanged value)? authStateChanged,
  }) {
    return authenticateWithQRCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult Function(_RegisterDevice value)? registerDevice,
    TResult Function(_AuthenticateWithQRCode value)? authenticateWithQRCode,
    TResult Function(_Logout value)? logout,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_SignInWithApple value)? signInWithApple,
    TResult Function(_SignOut value)? signOut,
    TResult Function(_AuthStateChanged value)? authStateChanged,
    required TResult orElse(),
  }) {
    if (authenticateWithQRCode != null) {
      return authenticateWithQRCode(this);
    }
    return orElse();
  }
}

abstract class _AuthenticateWithQRCode implements AuthEvent {
  const factory _AuthenticateWithQRCode(final String qrCode) =
      _$AuthenticateWithQRCodeImpl;

  String get qrCode;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthenticateWithQRCodeImplCopyWith<_$AuthenticateWithQRCodeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogoutImplCopyWith<$Res> {
  factory _$$LogoutImplCopyWith(
          _$LogoutImpl value, $Res Function(_$LogoutImpl) then) =
      __$$LogoutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LogoutImpl>
    implements _$$LogoutImplCopyWith<$Res> {
  __$$LogoutImplCopyWithImpl(
      _$LogoutImpl _value, $Res Function(_$LogoutImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LogoutImpl implements _Logout {
  const _$LogoutImpl();

  @override
  String toString() {
    return 'AuthEvent.logout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthStatus,
    required TResult Function() registerDevice,
    required TResult Function(String qrCode) authenticateWithQRCode,
    required TResult Function() logout,
    required TResult Function() signInWithGoogle,
    required TResult Function() signInWithApple,
    required TResult Function() signOut,
    required TResult Function(String? accessToken) authStateChanged,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthStatus,
    TResult? Function()? registerDevice,
    TResult? Function(String qrCode)? authenticateWithQRCode,
    TResult? Function()? logout,
    TResult? Function()? signInWithGoogle,
    TResult? Function()? signInWithApple,
    TResult? Function()? signOut,
    TResult? Function(String? accessToken)? authStateChanged,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthStatus,
    TResult Function()? registerDevice,
    TResult Function(String qrCode)? authenticateWithQRCode,
    TResult Function()? logout,
    TResult Function()? signInWithGoogle,
    TResult Function()? signInWithApple,
    TResult Function()? signOut,
    TResult Function(String? accessToken)? authStateChanged,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuthStatus value) checkAuthStatus,
    required TResult Function(_RegisterDevice value) registerDevice,
    required TResult Function(_AuthenticateWithQRCode value)
        authenticateWithQRCode,
    required TResult Function(_Logout value) logout,
    required TResult Function(_SignInWithGoogle value) signInWithGoogle,
    required TResult Function(_SignInWithApple value) signInWithApple,
    required TResult Function(_SignOut value) signOut,
    required TResult Function(_AuthStateChanged value) authStateChanged,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(_RegisterDevice value)? registerDevice,
    TResult? Function(_AuthenticateWithQRCode value)? authenticateWithQRCode,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult? Function(_SignInWithApple value)? signInWithApple,
    TResult? Function(_SignOut value)? signOut,
    TResult? Function(_AuthStateChanged value)? authStateChanged,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult Function(_RegisterDevice value)? registerDevice,
    TResult Function(_AuthenticateWithQRCode value)? authenticateWithQRCode,
    TResult Function(_Logout value)? logout,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_SignInWithApple value)? signInWithApple,
    TResult Function(_SignOut value)? signOut,
    TResult Function(_AuthStateChanged value)? authStateChanged,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class _Logout implements AuthEvent {
  const factory _Logout() = _$LogoutImpl;
}

/// @nodoc
abstract class _$$SignInWithGoogleImplCopyWith<$Res> {
  factory _$$SignInWithGoogleImplCopyWith(_$SignInWithGoogleImpl value,
          $Res Function(_$SignInWithGoogleImpl) then) =
      __$$SignInWithGoogleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignInWithGoogleImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SignInWithGoogleImpl>
    implements _$$SignInWithGoogleImplCopyWith<$Res> {
  __$$SignInWithGoogleImplCopyWithImpl(_$SignInWithGoogleImpl _value,
      $Res Function(_$SignInWithGoogleImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SignInWithGoogleImpl implements _SignInWithGoogle {
  const _$SignInWithGoogleImpl();

  @override
  String toString() {
    return 'AuthEvent.signInWithGoogle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignInWithGoogleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthStatus,
    required TResult Function() registerDevice,
    required TResult Function(String qrCode) authenticateWithQRCode,
    required TResult Function() logout,
    required TResult Function() signInWithGoogle,
    required TResult Function() signInWithApple,
    required TResult Function() signOut,
    required TResult Function(String? accessToken) authStateChanged,
  }) {
    return signInWithGoogle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthStatus,
    TResult? Function()? registerDevice,
    TResult? Function(String qrCode)? authenticateWithQRCode,
    TResult? Function()? logout,
    TResult? Function()? signInWithGoogle,
    TResult? Function()? signInWithApple,
    TResult? Function()? signOut,
    TResult? Function(String? accessToken)? authStateChanged,
  }) {
    return signInWithGoogle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthStatus,
    TResult Function()? registerDevice,
    TResult Function(String qrCode)? authenticateWithQRCode,
    TResult Function()? logout,
    TResult Function()? signInWithGoogle,
    TResult Function()? signInWithApple,
    TResult Function()? signOut,
    TResult Function(String? accessToken)? authStateChanged,
    required TResult orElse(),
  }) {
    if (signInWithGoogle != null) {
      return signInWithGoogle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuthStatus value) checkAuthStatus,
    required TResult Function(_RegisterDevice value) registerDevice,
    required TResult Function(_AuthenticateWithQRCode value)
        authenticateWithQRCode,
    required TResult Function(_Logout value) logout,
    required TResult Function(_SignInWithGoogle value) signInWithGoogle,
    required TResult Function(_SignInWithApple value) signInWithApple,
    required TResult Function(_SignOut value) signOut,
    required TResult Function(_AuthStateChanged value) authStateChanged,
  }) {
    return signInWithGoogle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(_RegisterDevice value)? registerDevice,
    TResult? Function(_AuthenticateWithQRCode value)? authenticateWithQRCode,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult? Function(_SignInWithApple value)? signInWithApple,
    TResult? Function(_SignOut value)? signOut,
    TResult? Function(_AuthStateChanged value)? authStateChanged,
  }) {
    return signInWithGoogle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult Function(_RegisterDevice value)? registerDevice,
    TResult Function(_AuthenticateWithQRCode value)? authenticateWithQRCode,
    TResult Function(_Logout value)? logout,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_SignInWithApple value)? signInWithApple,
    TResult Function(_SignOut value)? signOut,
    TResult Function(_AuthStateChanged value)? authStateChanged,
    required TResult orElse(),
  }) {
    if (signInWithGoogle != null) {
      return signInWithGoogle(this);
    }
    return orElse();
  }
}

abstract class _SignInWithGoogle implements AuthEvent {
  const factory _SignInWithGoogle() = _$SignInWithGoogleImpl;
}

/// @nodoc
abstract class _$$SignInWithAppleImplCopyWith<$Res> {
  factory _$$SignInWithAppleImplCopyWith(_$SignInWithAppleImpl value,
          $Res Function(_$SignInWithAppleImpl) then) =
      __$$SignInWithAppleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignInWithAppleImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SignInWithAppleImpl>
    implements _$$SignInWithAppleImplCopyWith<$Res> {
  __$$SignInWithAppleImplCopyWithImpl(
      _$SignInWithAppleImpl _value, $Res Function(_$SignInWithAppleImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SignInWithAppleImpl implements _SignInWithApple {
  const _$SignInWithAppleImpl();

  @override
  String toString() {
    return 'AuthEvent.signInWithApple()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignInWithAppleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthStatus,
    required TResult Function() registerDevice,
    required TResult Function(String qrCode) authenticateWithQRCode,
    required TResult Function() logout,
    required TResult Function() signInWithGoogle,
    required TResult Function() signInWithApple,
    required TResult Function() signOut,
    required TResult Function(String? accessToken) authStateChanged,
  }) {
    return signInWithApple();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthStatus,
    TResult? Function()? registerDevice,
    TResult? Function(String qrCode)? authenticateWithQRCode,
    TResult? Function()? logout,
    TResult? Function()? signInWithGoogle,
    TResult? Function()? signInWithApple,
    TResult? Function()? signOut,
    TResult? Function(String? accessToken)? authStateChanged,
  }) {
    return signInWithApple?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthStatus,
    TResult Function()? registerDevice,
    TResult Function(String qrCode)? authenticateWithQRCode,
    TResult Function()? logout,
    TResult Function()? signInWithGoogle,
    TResult Function()? signInWithApple,
    TResult Function()? signOut,
    TResult Function(String? accessToken)? authStateChanged,
    required TResult orElse(),
  }) {
    if (signInWithApple != null) {
      return signInWithApple();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuthStatus value) checkAuthStatus,
    required TResult Function(_RegisterDevice value) registerDevice,
    required TResult Function(_AuthenticateWithQRCode value)
        authenticateWithQRCode,
    required TResult Function(_Logout value) logout,
    required TResult Function(_SignInWithGoogle value) signInWithGoogle,
    required TResult Function(_SignInWithApple value) signInWithApple,
    required TResult Function(_SignOut value) signOut,
    required TResult Function(_AuthStateChanged value) authStateChanged,
  }) {
    return signInWithApple(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(_RegisterDevice value)? registerDevice,
    TResult? Function(_AuthenticateWithQRCode value)? authenticateWithQRCode,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult? Function(_SignInWithApple value)? signInWithApple,
    TResult? Function(_SignOut value)? signOut,
    TResult? Function(_AuthStateChanged value)? authStateChanged,
  }) {
    return signInWithApple?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult Function(_RegisterDevice value)? registerDevice,
    TResult Function(_AuthenticateWithQRCode value)? authenticateWithQRCode,
    TResult Function(_Logout value)? logout,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_SignInWithApple value)? signInWithApple,
    TResult Function(_SignOut value)? signOut,
    TResult Function(_AuthStateChanged value)? authStateChanged,
    required TResult orElse(),
  }) {
    if (signInWithApple != null) {
      return signInWithApple(this);
    }
    return orElse();
  }
}

abstract class _SignInWithApple implements AuthEvent {
  const factory _SignInWithApple() = _$SignInWithAppleImpl;
}

/// @nodoc
abstract class _$$SignOutImplCopyWith<$Res> {
  factory _$$SignOutImplCopyWith(
          _$SignOutImpl value, $Res Function(_$SignOutImpl) then) =
      __$$SignOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignOutImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SignOutImpl>
    implements _$$SignOutImplCopyWith<$Res> {
  __$$SignOutImplCopyWithImpl(
      _$SignOutImpl _value, $Res Function(_$SignOutImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SignOutImpl implements _SignOut {
  const _$SignOutImpl();

  @override
  String toString() {
    return 'AuthEvent.signOut()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignOutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthStatus,
    required TResult Function() registerDevice,
    required TResult Function(String qrCode) authenticateWithQRCode,
    required TResult Function() logout,
    required TResult Function() signInWithGoogle,
    required TResult Function() signInWithApple,
    required TResult Function() signOut,
    required TResult Function(String? accessToken) authStateChanged,
  }) {
    return signOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthStatus,
    TResult? Function()? registerDevice,
    TResult? Function(String qrCode)? authenticateWithQRCode,
    TResult? Function()? logout,
    TResult? Function()? signInWithGoogle,
    TResult? Function()? signInWithApple,
    TResult? Function()? signOut,
    TResult? Function(String? accessToken)? authStateChanged,
  }) {
    return signOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthStatus,
    TResult Function()? registerDevice,
    TResult Function(String qrCode)? authenticateWithQRCode,
    TResult Function()? logout,
    TResult Function()? signInWithGoogle,
    TResult Function()? signInWithApple,
    TResult Function()? signOut,
    TResult Function(String? accessToken)? authStateChanged,
    required TResult orElse(),
  }) {
    if (signOut != null) {
      return signOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuthStatus value) checkAuthStatus,
    required TResult Function(_RegisterDevice value) registerDevice,
    required TResult Function(_AuthenticateWithQRCode value)
        authenticateWithQRCode,
    required TResult Function(_Logout value) logout,
    required TResult Function(_SignInWithGoogle value) signInWithGoogle,
    required TResult Function(_SignInWithApple value) signInWithApple,
    required TResult Function(_SignOut value) signOut,
    required TResult Function(_AuthStateChanged value) authStateChanged,
  }) {
    return signOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(_RegisterDevice value)? registerDevice,
    TResult? Function(_AuthenticateWithQRCode value)? authenticateWithQRCode,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult? Function(_SignInWithApple value)? signInWithApple,
    TResult? Function(_SignOut value)? signOut,
    TResult? Function(_AuthStateChanged value)? authStateChanged,
  }) {
    return signOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult Function(_RegisterDevice value)? registerDevice,
    TResult Function(_AuthenticateWithQRCode value)? authenticateWithQRCode,
    TResult Function(_Logout value)? logout,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_SignInWithApple value)? signInWithApple,
    TResult Function(_SignOut value)? signOut,
    TResult Function(_AuthStateChanged value)? authStateChanged,
    required TResult orElse(),
  }) {
    if (signOut != null) {
      return signOut(this);
    }
    return orElse();
  }
}

abstract class _SignOut implements AuthEvent {
  const factory _SignOut() = _$SignOutImpl;
}

/// @nodoc
abstract class _$$AuthStateChangedImplCopyWith<$Res> {
  factory _$$AuthStateChangedImplCopyWith(_$AuthStateChangedImpl value,
          $Res Function(_$AuthStateChangedImpl) then) =
      __$$AuthStateChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? accessToken});
}

/// @nodoc
class __$$AuthStateChangedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthStateChangedImpl>
    implements _$$AuthStateChangedImplCopyWith<$Res> {
  __$$AuthStateChangedImplCopyWithImpl(_$AuthStateChangedImpl _value,
      $Res Function(_$AuthStateChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = freezed,
  }) {
    return _then(_$AuthStateChangedImpl(
      freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AuthStateChangedImpl implements _AuthStateChanged {
  const _$AuthStateChangedImpl(this.accessToken);

  @override
  final String? accessToken;

  @override
  String toString() {
    return 'AuthEvent.authStateChanged(accessToken: $accessToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateChangedImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accessToken);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateChangedImplCopyWith<_$AuthStateChangedImpl> get copyWith =>
      __$$AuthStateChangedImplCopyWithImpl<_$AuthStateChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkAuthStatus,
    required TResult Function() registerDevice,
    required TResult Function(String qrCode) authenticateWithQRCode,
    required TResult Function() logout,
    required TResult Function() signInWithGoogle,
    required TResult Function() signInWithApple,
    required TResult Function() signOut,
    required TResult Function(String? accessToken) authStateChanged,
  }) {
    return authStateChanged(accessToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? checkAuthStatus,
    TResult? Function()? registerDevice,
    TResult? Function(String qrCode)? authenticateWithQRCode,
    TResult? Function()? logout,
    TResult? Function()? signInWithGoogle,
    TResult? Function()? signInWithApple,
    TResult? Function()? signOut,
    TResult? Function(String? accessToken)? authStateChanged,
  }) {
    return authStateChanged?.call(accessToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkAuthStatus,
    TResult Function()? registerDevice,
    TResult Function(String qrCode)? authenticateWithQRCode,
    TResult Function()? logout,
    TResult Function()? signInWithGoogle,
    TResult Function()? signInWithApple,
    TResult Function()? signOut,
    TResult Function(String? accessToken)? authStateChanged,
    required TResult orElse(),
  }) {
    if (authStateChanged != null) {
      return authStateChanged(accessToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckAuthStatus value) checkAuthStatus,
    required TResult Function(_RegisterDevice value) registerDevice,
    required TResult Function(_AuthenticateWithQRCode value)
        authenticateWithQRCode,
    required TResult Function(_Logout value) logout,
    required TResult Function(_SignInWithGoogle value) signInWithGoogle,
    required TResult Function(_SignInWithApple value) signInWithApple,
    required TResult Function(_SignOut value) signOut,
    required TResult Function(_AuthStateChanged value) authStateChanged,
  }) {
    return authStateChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(_RegisterDevice value)? registerDevice,
    TResult? Function(_AuthenticateWithQRCode value)? authenticateWithQRCode,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult? Function(_SignInWithApple value)? signInWithApple,
    TResult? Function(_SignOut value)? signOut,
    TResult? Function(_AuthStateChanged value)? authStateChanged,
  }) {
    return authStateChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult Function(_RegisterDevice value)? registerDevice,
    TResult Function(_AuthenticateWithQRCode value)? authenticateWithQRCode,
    TResult Function(_Logout value)? logout,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_SignInWithApple value)? signInWithApple,
    TResult Function(_SignOut value)? signOut,
    TResult Function(_AuthStateChanged value)? authStateChanged,
    required TResult orElse(),
  }) {
    if (authStateChanged != null) {
      return authStateChanged(this);
    }
    return orElse();
  }
}

abstract class _AuthStateChanged implements AuthEvent {
  const factory _AuthStateChanged(final String? accessToken) =
      _$AuthStateChangedImpl;

  String? get accessToken;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthStateChangedImplCopyWith<_$AuthStateChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
