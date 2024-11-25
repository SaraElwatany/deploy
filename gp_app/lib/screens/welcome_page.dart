import 'package:gp_app/main.dart';
import 'package:gp_app/apis/apis.dart';
import 'package:flutter/material.dart';
import 'package:gp_app/models/global.dart';
import 'package:gp_app/generated/l10n.dart';
import 'package:gp_app/models/new_user.dart';
import 'package:gp_app/classes/language.dart';
import 'package:gp_app/screens/main_page.dart';
import 'package:gp_app/screens/login_screen.dart';
import 'package:gp_app/widgets/welcome_page_en.dart';
import 'package:gp_app/screens/voice_note_screen.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() {
    return _WelcomePageState();
  }
}

class _WelcomePageState extends State<WelcomePage> {
  bool isNavigating = false; // Add this flag to track navigation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/Hilal.png',
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<Language>(
              underline: const SizedBox(),
              icon: const Icon(
                Icons.language,
                color: Colors.white,
              ),
              onChanged: (Language? language) {
                if (language != null) {
                  MyApp.setLocale(context, Locale(language.languageCode, ''));
                }
              },
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>(
                    (e) => DropdownMenuItem<Language>(
                      value: e,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            e.flag,
                            style: const TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            e.name,
                            style: const TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Text(S.of(context).appName),
          const WelcomePageEN(),
          //  const WelcomePageAR(),
          // const Localization(),
          const SizedBox(height: 70),
          Center(
            // Backend:Button to go to Login page
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                fixedSize: const Size(166, 69),
                backgroundColor: const Color.fromARGB(255, 29, 49, 78),
              ),
              child: Text(
                S.of(context).start,
                style: const TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 255, 251, 251),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              if (!isNavigating) {
                isNavigating = true; // Set the flag to true
                var _enteredFirstName = '';
                var _enteredLastName = '';
                var _enteredEmail = '';
                var _enteredPassword = '';
                var _speciality = '';
                var output = '';

                NewUser userInfo = NewUser(
                  firstName: _enteredFirstName,
                  lastName: _enteredLastName,
                  email: _enteredEmail,
                  password: _enteredPassword,
                  speciality: _speciality,
                  userId: Global.userId,
                );

                output = await signUp(userInfo, 'patient', 1);

                if (output == 'Sign up Allowed') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MainPageScreen()),
                  );
                }
                isNavigating = false; // Reset the flag after navigation
              }
            },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                fixedSize: const Size(166, 69),
                backgroundColor: const Color.fromARGB(255, 156, 17, 17)),
            child: Text(
              S.of(context).emergency,
              style: const TextStyle(
                fontSize: 23,
                color: Color.fromARGB(255, 255, 251, 251),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => const VoiceNoteScreen()),
          //     );
          //   },
          //   style: ElevatedButton.styleFrom(
          //       shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(15)),
          //       fixedSize: const Size(100, 50),
          //       backgroundColor: const Color.fromARGB(255, 29, 49, 78)),
          //   child: const Text(
          //     "Voice",
          //     style: TextStyle(
          //       fontSize: 18,
          //       color: Color.fromARGB(255, 255, 251, 251),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
