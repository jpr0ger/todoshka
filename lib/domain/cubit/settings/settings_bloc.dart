import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState()) {
    on<SettingsChangeShowArchived>(_changeShowArchived);
  }

  Future<void> _changeShowArchived(
    SettingsChangeShowArchived event,
    Emitter<SettingsState> emit,
  ) async {
    emit(state.copyWith(showArchivedTopics: !state.showArchivedTopics));
  }
}
