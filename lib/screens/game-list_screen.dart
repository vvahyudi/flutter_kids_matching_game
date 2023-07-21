import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GameListScreen extends StatefulWidget {
  const GameListScreen({Key? key}) : super(key: key);

  @override
  State<GameListScreen> createState() => _GameListScreenState();
}

class _GameListScreenState extends State<GameListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "SaSix",
            style: TextStyle(fontSize: 40),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.settings,
                size: 20,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/setting');
              },
            ),
          ]),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ElevatedButton(
            //   // style: ElevatedButton.styleFrom(
            //   //   elevation: 10,
            //   //   shape: BeveledRectangleBorder(
            //   //       borderRadius: BorderRadius.circular(120)),
            //   // ),
            //   onPressed: () {
            //     Navigator.pushNamed(context, '/colorGame');
            //   },
            //   child: Text(
            //     AppLocalizations.of(context)!.colorGame,
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // ElevatedButton(
            //   // style: ElevatedButton.styleFrom(
            //   //   elevation: 10,
            //   //   shape: BeveledRectangleBorder(
            //   //       borderRadius: BorderRadius.circular(120)),
            //   // ),
            //   onPressed: () {
            //     Navigator.pushNamed(context, '/pknGame');
            //   },
            //   child: Text(
            //     AppLocalizations.of(context)!.pknGame,
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // ElevatedButton(
            // style: ElevatedButton.styleFrom(
            //   elevation: 10,
            //   shape: BeveledRectangleBorder(
            //       borderRadius: BorderRadius.circular(120)),
            // ),

            // SaSix
            //   onPressed: () {
            //     Navigator.pushNamed(context, '/animalGame');
            //   },
            //   child: Text(
            //     AppLocalizations.of(context)!.animalGame,
            //   ),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/pilihanGanda');
              },
              child: Text(
                AppLocalizations.of(context)!.pilihanGanda,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/pknGame');
              },
              child: Text(
                AppLocalizations.of(context)!.pknGame,
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
