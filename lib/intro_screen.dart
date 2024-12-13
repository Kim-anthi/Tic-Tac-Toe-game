import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe_game/home_page.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  static var myFont = GoogleFonts.pressStart2p(
    textStyle: const TextStyle(color: Colors.black, letterSpacing: 3),
  );
  static var myWhite = GoogleFonts.pressStart2p(
    textStyle: const TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 17),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Game Title
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 120),
                child: Text(
                  "TIC TAC TOE",
                  style: myWhite.copyWith(fontSize: 30),
                ),
              ),
            ),

            // Glowing Avatar with Logo
            Expanded(
              flex: 2,
              child: AvatarGlow(
                // endRadius: 140.0,
                duration: const Duration(seconds: 2),
                glowColor: Colors.white,
                repeat: true,
                // repeatPauseDuration: const Duration(seconds: 1),
                startDelay: const Duration(seconds: 1),
                child: CircleAvatar(
                  backgroundColor: Colors.grey[900],
                  radius: 110.0,
                  child: Image.asset(
                    'lib/images/this.webp',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            // Creator's Tagline
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Text(
                  "@KIM-CREATES",
                  style: myWhite.copyWith(fontSize: 23),
                ),
              ),
            ),

            // Play Game Button
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        "PLAY GAME",
                        style: myFont.copyWith(color: Colors.black, fontSize: 17),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
