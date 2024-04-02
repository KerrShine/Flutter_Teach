import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class i10nPage extends StatefulWidget {
  const i10nPage({super.key});

  @override
  State<i10nPage> createState() => _i10nPageState();
}

class _i10nPageState extends State<i10nPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('多語系示範'),
      ),
      body: Container(
        child: Text(AppLocalizations.of(context)!.helloWorld),
      ),
    );
  }
}
