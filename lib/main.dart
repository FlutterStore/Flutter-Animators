import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<CrossFadeABState> crossFadeAnimation =
      GlobalKey<CrossFadeABState>();

  final GlobalKey<AnimatorWidgetState> basicAnimation =
      GlobalKey<AnimatorWidgetState>();

  final GlobalKey<InOutAnimationState> inOutAnimation =
      GlobalKey<InOutAnimationState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Animator",style: TextStyle(fontSize: 15),),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 20)),
            CrossFadeAB(
              key: crossFadeAnimation,
              childA: Container(
                height: 80,
                width: 80,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.amber
                ),
                child: const Text('A', style: TextStyle(fontSize: 20,color: Colors.white)),
              ),
              childB: Container(
                height: 80,
                width: 80,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.red
                ),
                child: const Text('B', style: TextStyle(fontSize: 20,color: Colors.white)),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Colors.green
                )
              ),
              onPressed: () {
                crossFadeAnimation.currentState!.cross();
              },
              child: const Text(
                'Cross Animate',
                style: TextStyle(fontSize: 15),
              ),
            ),
            const SizedBox(height: 15,),
            BounceIn(
              key: basicAnimation,
              child: Container(
                height: 35,
                width: 250,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.purple
                ),
                child: const Text('A', style: TextStyle(fontSize: 20,color: Colors.white)),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Colors.green
                )
              ),
              onPressed: () {
                basicAnimation.currentState!.forward();
              },
              child: const Text(
                'Animate Bounce',
                style: TextStyle(fontSize: 15),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 40)),
            InOutAnimation(
              key: inOutAnimation,
              inDefinition: FadeInAnimation(),
              outDefinition: BounceOutDownAnimation(),
              child: const Text(
                'In & Out',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Colors.green
                )
              ),
              onPressed: () {
                if (inOutAnimation.currentState!.status !=
                    InOutAnimationStatus.Out) {
                  inOutAnimation.currentState!.animateOut();
                } else {
                  inOutAnimation.currentState!.animateIn();
                }
              },
              child: const Text(
                'Animate In & Out',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}