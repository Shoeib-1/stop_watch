import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stopwatch(),
    );
  }
}

class Stopwatch extends StatefulWidget {
  const Stopwatch({Key? key}) : super(key: key);

  @override
  State<Stopwatch> createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> {
  Timer? repeatedFunc;
  Duration duration = Duration(seconds: 0);

  startTimer() {
    repeatedFunc = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        int newSecond = duration.inSeconds + 1;
        duration = Duration(seconds: newSecond);
      });
    });
  }

  bool isRunning = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 223, 60, 101),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 22),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(17)),
                      child: Text(
                        duration.inHours.toString().padLeft(2, "0"),
                        style: TextStyle(color: Colors.black38, fontSize: 50),
                      ),
                    ),
                    Text(
                      "Hours",
                      style: TextStyle(fontSize: 22),
                    )
                  ],
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 22),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(17)),
                      child: Text(
                        duration.inMinutes
                            .remainder(60)
                            .toString()
                            .padLeft(2, "0"),
                        style: TextStyle(color: Colors.black38, fontSize: 50),
                      ),
                    ),
                    Text(
                      "Minutes",
                      style: TextStyle(fontSize: 22),
                    ),
                  ],
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 22),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(17)),
                      child: Text(
                        duration.inSeconds
                            .remainder(60)
                            .toString()
                            .padLeft(2, "0"),
                        style: TextStyle(color: Colors.black38, fontSize: 50),
                      ),
                    ),
                    Text(
                      "Seconds",
                      style: TextStyle(fontSize: 22),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            isRunning
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (repeatedFunc!.isActive) {
                            setState(() {
                              repeatedFunc!.cancel();
                            });
                          } else {
                            startTimer();
                          }
                        },
                        child: Text(
                          (repeatedFunc!.isActive) ? "Stop " : "Resume",
                          style: TextStyle(fontSize: 19),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 34, 222, 255)),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(12)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          repeatedFunc!.cancel();
                          setState(() {
                            duration = Duration(seconds: 0);
                            isRunning = false;
                          });
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(fontSize: 19),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 34, 222, 255)),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(12)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                      ),
                    ],
                  )
                : ElevatedButton(
                    onPressed: () {
                      startTimer();
                      setState(() {
                        isRunning = true;
                      });
                    },
                    child: Text(
                      "Start Timer",
                      style: TextStyle(fontSize: 19),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 34, 222, 255)),
                      padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
