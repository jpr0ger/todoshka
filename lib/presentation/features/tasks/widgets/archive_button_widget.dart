import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/cubit/settings/settings_bloc.dart';

class ArchiveButtonWidget extends StatelessWidget {
  const ArchiveButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SettingsBloc>().state;

    if (state.status == SettingsStatus.success) {
      return IconButton(
        onPressed: () {
          context.read<SettingsBloc>().add(SettingsChangeShowArchived());
        },
        icon: state.showArchivedTopics
            ? const Icon(CupertinoIcons.archivebox_fill)
            : const Icon(CupertinoIcons.archivebox),
      );
    } else {
      return Container();
    }
  }
}
