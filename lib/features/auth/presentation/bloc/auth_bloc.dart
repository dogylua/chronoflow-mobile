import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../data/models/auth_response.dart';
import 'auth_event.dart';
import 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.map(
        checkAuthStatus: (e) => _onCheckAuthStatus(emit),
        registerDevice: (e) => _onRegisterDevice(emit),
        authenticateWithQRCode: (e) =>
            _onAuthenticateWithQRCode(e.qrCode, emit),
        logout: (e) => _onLogout(emit),
        signInWithGoogle: (e) async {
          // TODO: Implement Google Sign In
        },
        signInWithApple: (e) async {
          // TODO: Implement Apple Sign In
        },
        signOut: (e) async {
          await _authRepository.logout();
          emit(const AuthState.unauthenticated());
        },
        authStateChanged: (e) async {
          if (e.accessToken != null) {
            final refreshToken = await _authRepository.storedRefreshToken;
            if (refreshToken != null) {
              emit(AuthState.authenticated(
                accessToken: e.accessToken!,
                refreshToken: refreshToken,
                expiresAt: DateTime.now().add(const Duration(hours: 1)),
              ));
            } else {
              emit(const AuthState.unauthenticated());
            }
          } else {
            emit(const AuthState.unauthenticated());
          }
        },
      );
    });
  }

  Future<void> _onCheckAuthStatus(Emitter<AuthState> emit) async {
    try {
      emit(const AuthState.loading());
      final isAuthenticated = await _authRepository.isAuthenticated();
      if (isAuthenticated) {
        final authResponse = await _authRepository.authResponse;
        emit(AuthState.authenticated(
          accessToken: authResponse.accessToken,
          refreshToken: authResponse.refreshToken,
          expiresAt:
              DateTime.now().add(Duration(seconds: authResponse.expiresIn)),
        ));
      } else {
        emit(const AuthState.unauthenticated());
      }
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> _onRegisterDevice(Emitter<AuthState> emit) async {
    try {
      emit(const AuthState.loading());
      final response = await _authRepository.registerDevice();
      emit(AuthState.authenticated(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
        expiresAt: DateTime.now().add(Duration(seconds: response.expiresIn)),
      ));
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> _onAuthenticateWithQRCode(
    String qrCode,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthState.loading());
      final response = await _authRepository.authenticateWithQRCode(qrCode);
      emit(AuthState.authenticated(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
        expiresAt: DateTime.now().add(Duration(seconds: response.expiresIn)),
      ));
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  Future<void> _onLogout(Emitter<AuthState> emit) async {
    try {
      emit(const AuthState.loading());
      await _authRepository.logout();
      emit(const AuthState.unauthenticated());
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }
}
