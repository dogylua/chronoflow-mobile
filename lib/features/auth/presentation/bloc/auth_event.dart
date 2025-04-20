import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.checkAuthStatus() = _CheckAuthStatus;
  const factory AuthEvent.registerDevice() = _RegisterDevice;
  const factory AuthEvent.authenticateWithQRCode(String qrCode) =
      _AuthenticateWithQRCode;
  const factory AuthEvent.logout() = _Logout;
  const factory AuthEvent.signInWithGoogle() = _SignInWithGoogle;
  const factory AuthEvent.signInWithApple() = _SignInWithApple;
  const factory AuthEvent.signOut() = _SignOut;
  const factory AuthEvent.authStateChanged(String? accessToken) =
      _AuthStateChanged;
}
