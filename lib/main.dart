import 'package:flutter/material.dart';
import 'package:sasix/provider/settings_provider.dart';
// import 'package:flutter_kids_matching_game/screens/animal_game_screen.dart';
// import 'package:flutter_kids_matching_game/screens/color_game_screen.dart';
// import 'package:flutter_kids_matching_game/screens/fruit_game_screen.dart';
import 'package:sasix/screens/game_list_screen.dart';
import 'package:sasix/screens/pilihan_ganda_screen.dart';
import 'package:sasix/screens/pkn_game_screen.dart';
import 'package:sasix/screens/setting_page_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    final box = GetStorage();
    box.writeIfNull('selectedLanguage', 'English');
    box.writeIfNull('selectedLevel', 'Level 1');
    box.writeIfNull('selectedThemeColor', 'Pink');
    box.writeIfNull('selectedThemeCode', 0);
    box.writeIfNull('selectedLocale', 'en');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return SettingsProvider();
      },
      builder: (context, child) {
        final provider = Provider.of<SettingsProvider>(context);

        return MaterialApp(
          title: 'SaSix',
          theme: ThemeData(
              fontFamily: 'JosefinSans',
              colorScheme: ColorScheme(
                  primary: provider.themeColor as Color,
                  onError: Colors.red,
                  onBackground: const Color.fromARGB(255, 237, 37, 37),
                  onSecondary: Colors.white,
                  error: Colors.red,
                  background: const Color.fromARGB(255, 229, 172, 172),
                  onPrimary: Colors.white,
                  brightness: Brightness.light,
                  onSurface: Colors.black,
                  surface: const Color.fromARGB(255, 237, 37, 37),
                  secondary: provider.themeColor as Color),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  textStyle: const TextStyle(
                      fontSize: 30,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600),
                ),
              ),
              buttonTheme: const ButtonThemeData()),
          initialRoute: '/',
          routes: {
            '/': (context) => const GameListScreen(),
            // '/colorGame': (context) => const ColorGameScreen(),
            // '/animalGame': (context) => const AnimalGameScreen(),
            '/pknGame': (context) => const PknGameScreen(),
            '/pilihanGanda': (context) => const PilihanGandaScreen(),
            '/setting': (context) => const SettingPageScreen(),
          },
          supportedLocales: L10n.all,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          locale: provider.local,
        );
      },
    );
  }
}
