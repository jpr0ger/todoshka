import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/cubit/settings/settings_cubit.dart';

class ArchiveButtonWidget extends StatelessWidget {
  const ArchiveButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SettingsCubit>().state;

    if (state.status == SettingsStatus.success) {
      return state.showArchivedTopics
          ? IconButton(
              onPressed: () => () {
                context.read<SettingsCubit>().changeShowArchived(false);
              },
              icon: const Icon(CupertinoIcons.archivebox_fill),
            )
          : IconButton(
              onPressed: () => () {
                context.read<SettingsCubit>().changeShowArchived(true);
              },
              icon: const Icon(CupertinoIcons.archivebox),
            );
    } else {
      return Container();
    }
  }
}
