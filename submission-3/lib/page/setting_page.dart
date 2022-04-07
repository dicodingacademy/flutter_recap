import 'package:flutter/material.dart';
import 'package:flutter_recap/provider/setting_notifier.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

@override
  void initState() {
    Future.microtask(() {
      context.read<SettingNotifier>().getDailyMessage();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingNotifier>(
      builder: (context, state, child) {
        return ListView(
          children: [
            SwitchListTile(
              value: state.isDailyMessageOn,
              onChanged: (value) {
                state.setDailyMessage(value);
              },
              title: const Text("Daily Message"),
            ),
          ],
        );
      },
    );
  }
}
