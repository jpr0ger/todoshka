import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoshka/common/init_blocs.dart';

import 'app.dart';
import 'common/debug_bloc_observer.dart';
import 'common/hive.dart';
import 'common/sl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = DebugBlocObserver();
  await initSl();
  await initHive(sl());
  runApp((MultiBlocProvider(providers: initBlocs(), child: const App())));
}
