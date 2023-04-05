import 'package:flutter/material.dart';
import 'package:pnemonia/prediction.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 50,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 50,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/images/radiograph.png',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                textAlign: TextAlign.center,
                "lorem epsum dolor etos sjflsd lkdfjlskfjsfsflsj fls flsjflsdjflsdjfls fl dfl] flkjdlfjdslfj lf sdlfjsljf dlf sld flsdjf alfl saf a fl sdlfjslfdslflsfl sl dlflsdjfls fl lsk lkfj slfjlj dflsdlf sdl sd fsdl lsd flsd fllj lsfl flsdlflsd flslsj djslfjs fl sdfljsd lfjsdl.jdslkjfslfjsl fsld fjsdl fjsdlf sldf jld.",
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Prediction()));
                  },
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Get Started",
                          ),
                          Icon(Icons.chevron_right_outlined)
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
