// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:sasix/provider/settings_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_storage/get_storage.dart';

class SettingPageScreen extends StatefulWidget {
  const SettingPageScreen({Key? key}) : super(key: key);

  @override
  State<SettingPageScreen> createState() => _SettingPageScreenState();
}

class _SettingPageScreenState extends State<SettingPageScreen> {
  late String selectedLanguage;
  late String selectedLevel;
  late String selectedThemeColor;
  late String selectedThemeCode;
  late SettingsProvider provider;
  final box = GetStorage();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> gameLevels = [
      AppLocalizations.of(context)!.level1,
    ];

    List<String> themeColors = [
      AppLocalizations.of(context)!.pink
      // AppLocalizations.of(context)!.purple,
      // AppLocalizations.of(context)!.orange
    ];

    // String tempLanguage = box.read('selectedLanguage');
    String tempLevel = box.read('selectedLevel');
    // int selectedThemeCode = box.read('selectedThemeCode');

    selectedLanguage = AppLocalizations.of(context)!.english;

    selectedLevel = tempLevel.contains('1')
        ? AppLocalizations.of(context)!.level1
        : AppLocalizations.of(context)!.level1;

    selectedThemeColor = AppLocalizations.of(context)!.pink;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.setting,
          style: const TextStyle(fontSize: 28),
        ),
      ),
      body: const Material(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          // child: Column(
          //   children: [
          //     Row(
          //       children: [
          //         Text(
          //           AppLocalizations.of(context)!.lessonLanguage,
          //           style: const TextStyle(fontSize: 20),
          //         ),
          //         const SizedBox(
          //           width: 30,
          //         ),
          //         DropdownButton<String>(
          //           value: selectedLanguage,
          //           icon: const Icon(Icons.translate),
          //           iconSize: 24,
          //           elevation: 16,
          //           style: const TextStyle(color: Colors.deepPurple),
          //           underline: Container(
          //             height: 2,
          //             color: Colors.deepPurpleAccent,
          //           ),
          //           onChanged: (String? newValue) {
          //             setState(() {
          //               provider = Provider.of<SettingsProvider>(context,
          //                   listen: false);
          //               box.write('selectedLanguage', newValue);

          //               selectedLanguage = box.read('selectedLanguage');

          //               provider.setLocale(const Locale('en'));
          //               box.write('selectedLocale', 'en');
          //               selectedLevel = box.read('selectedLevel');
          //               selectedThemeColor = box.read('selectedThemeColor');
          //             });
          //           },
          //           items:
          //               L10n.all.map<DropdownMenuItem<String>>((Locale value) {
          //             return DropdownMenuItem<String>(
          //               value: L10n.getLanguages(value.toString()),
          //               child: Text(
          //                 L10n.getLanguages(value.toString()),
          //                 style: const TextStyle(fontSize: 18),
          //               ),
          //             );
          //           }).toList(),
          //         ),
          //       ],
          //     ),
          //     Row(
          //       children: [
          //         Text(
          //           AppLocalizations.of(context)!.gameLevel,
          //           style: const TextStyle(fontSize: 20),
          //         ),
          //         const SizedBox(
          //           width: 30,
          //         ),
          //         DropdownButton<String>(
          //           value: selectedLevel,
          //           icon: const Icon(Icons.arrow_upward),
          //           iconSize: 24,
          //           elevation: 16,
          //           style: const TextStyle(color: Colors.pink),
          //           underline: Container(
          //             height: 2,
          //             color: Colors.pinkAccent,
          //           ),
          //           onChanged: (String? newValue) {
          //             setState(() {
          //               box.write('selectedLevel', newValue);
          //               selectedLevel = box.read('selectedLevel');
          //             });
          //           },
          //           items: gameLevels
          //               .map<DropdownMenuItem<String>>((String value) {
          //             return DropdownMenuItem<String>(
          //               value: value,
          //               child: Text(
          //                 value,
          //                 style: const TextStyle(fontSize: 18),
          //               ),
          //             );
          //           }).toList(),
          //         ),
          //       ],
          //     ),
          //     Row(
          //       children: [
          //         Text(
          //           AppLocalizations.of(context)!.themeColor,
          //           style: const TextStyle(fontSize: 20),
          //         ),
          //         const SizedBox(
          //           width: 30,
          //         ),
          //         DropdownButton<String>(
          //           value: selectedThemeColor,
          //           icon: const Icon(Icons.color_lens),
          //           iconSize: 24,
          //           elevation: 6,
          //           style: const TextStyle(color: Colors.pinkAccent),
          //           underline: Container(
          //             height: 2,
          //             color: Colors.pinkAccent,
          //           ),
          //           onChanged: (String? newValue) {
          //             setState(() {
          //               box.write('selectedThemeColor', newValue);
          //               box.write('selectedThemeCode',
          //                   themeColors.indexOf(newValue!));
          //               selectedThemeColor = box.read('selectedThemeColor');
          //               selectedThemeCode = box.read('selectedThemeCode');
          //               provider = Provider.of<SettingsProvider>(context,
          //                   listen: false);
          //               provider.setTheme(themeColors.indexOf(newValue));
          //             });
          //           },
          //           items: themeColors
          //               .map<DropdownMenuItem<String>>((String value) {
          //             return DropdownMenuItem<String>(
          //               value: value,
          //               child: Text(
          //                 value,
          //                 style: const TextStyle(fontSize: 18),
          //               ),
          //             );
          //           }).toList(),
          //         ),
          //       ],
          //     )
          //   ],
          // ),
        ),
      ),
    );
  }
}
