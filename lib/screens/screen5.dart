import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen5 extends StatefulWidget {
  const Screen5({super.key});

  @override
  State<Screen5> createState() => _Screen5State();
}

class _Screen5State extends State<Screen5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Cards'),
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              Container(
                  width: 700,
                  height: 350,
                  padding: new EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                        image: NetworkImage(
                            "https://www.criptonoticias.com/wp-content/uploads/2018/12/ethereum-donativo-tarjeta-navidad-caridad-1024x622.jpg"),
                        fit: BoxFit.cover),
                  ),
                  margin: EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Card(
                        color: Color.fromRGBO(0, 0, 0, 0.3),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        shadowColor: Colors.blue,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: ListTile(
                                leading: const Icon(Icons.ac_unit_outlined,
                                    size: 60),
                                title: Text(
                                  'Feliz Navidad y prospero año nuevo 2025',
                                  style: GoogleFonts.imperialScript(
                                    textStyle: const TextStyle(
                                      fontSize: 40,
                                      color: Colors.amber,
                                      fontWeight: FontWeight.w900,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 10.0, // shadow blur
                                          color: Colors.white, // shadow color
                                          offset: Offset(2.0,
                                              2.0), // how much shadow will be shown
                                        ),
                                      ],
                                    ),
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                                subtitle: const Text(
                                  'El mejor regalo de cada navidad es compartir y estar alado de estudiantes como ustedes.  Son los deseos de tu profesor de Desarrollo de Plataformas Móviles. .',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 120,
                              height: 50,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.wine_bar_sharp,
                                    color: Colors.red,
                                  ),
                                  Text(
                                    "Feliz 2025",
                                    style: TextStyle(color: Colors.red),
                                  )
                                ],
                              ),
                            ),
                            AnimatedTextKit(
                              animatedTexts: [
                                FadeAnimatedText('Muchos éxitos y bendiciones',
                                    textStyle: const TextStyle(
                                        color: Color(0xFFF3FF44),
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500)),
                                FadeAnimatedText('para ti y tu familia para el',
                                    textStyle: const TextStyle(
                                        color: Color(0xFFF3FF44),
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500)),
                                FadeAnimatedText('2025 :)',
                                    textStyle: const TextStyle(
                                        color: Color(0xFFF3FF44),
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500)),
                              ],
                              totalRepeatCount: 4,
                              pause: const Duration(milliseconds: 1000),
                              displayFullTextOnTap: true,
                              stopPauseOnTap: true,
                              onTap: () {},
                            )
                          ],
                        )),
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
