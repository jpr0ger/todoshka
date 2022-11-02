import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppTitle extends StatefulWidget {
  const AppTitle({
    Key? key,
  }) : super(key: key);

  @override
  State<AppTitle> createState() => AppTitleState();
}

class AppTitleState extends State<AppTitle> {
  String appVersion = '';

  @override
  void initState() {
    super.initState();
    _initAppVersion();
  }

  Future<void> _initAppVersion() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      appVersion = '(${info.version})';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text('TODOшка $appVersion');
  }
}
