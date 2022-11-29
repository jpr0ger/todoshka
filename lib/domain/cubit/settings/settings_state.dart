part of 'settings_bloc.dart';

enum SettingsStatus { loading, success, failure }

class SettingsState extends Equatable {
  final SettingsStatus status;
  final bool showArchivedTopics;
  final String message;

  @override
  List<Object> get props => [status, showArchivedTopics, message];

  const SettingsState({
    this.status = SettingsStatus.success,
    this.showArchivedTopics = false,
    this.message = '',
  });

  SettingsState copyWith({
    SettingsStatus? status,
    bool? showArchivedTopics,
    String? message,
  }) {
    return SettingsState(
      status: status ?? this.status,
      showArchivedTopics: showArchivedTopics ?? this.showArchivedTopics,
      message: message ?? this.message,
    );
  }
}
