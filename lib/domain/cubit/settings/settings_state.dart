part of 'settings_cubit.dart';

enum SettingsStatus { loading, success, failure }

class SettingsState extends Equatable {
  final SettingsStatus status;
  final bool showArchivedTopics;
  final String message;

  @override
  List<Object> get props => [status, showArchivedTopics, message];

  const SettingsState._({
    this.status = SettingsStatus.loading,
    this.showArchivedTopics = false,
    this.message = '',
  });

  const SettingsState.loading() : this._();

  const SettingsState.success({
    required bool showArchivedTopics,
  }) : this._(
          status: SettingsStatus.success,
          showArchivedTopics: showArchivedTopics,
        );

  const SettingsState.failure(String error)
      : this._(
          status: SettingsStatus.failure,
          message: error,
        );
}
