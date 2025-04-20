import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/config/env.dart';
import 'settings_event.dart';
import 'settings_state.dart';

@injectable
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState.initial()) {
    on<SettingsEvent>((event, emit) async {
      await event.map(
        signOut: (_) async {
          emit(const SettingsState.loading());
          try {
            await Env.clearTokens();
            emit(const SettingsState.success());
          } catch (e) {
            emit(SettingsState.error(e.toString()));
          }
        },
      );
    });
  }
}
