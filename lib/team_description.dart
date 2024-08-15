import 'package:circ_scrorer/utils/app_images.dart';
import 'package:circ_scrorer/utils/paint_utils/dashed_oval_paint_bottom_circle.dart';
import 'package:circ_scrorer/utils/paint_utils/dashed_oval_paint_full.dart';
import 'package:circ_scrorer/utils/paint_utils/dshed_oval_paint_top_circle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TeamDescription extends StatefulWidget {
  const TeamDescription({super.key});

  @override
  State<TeamDescription> createState() => _TeamDescriptionState();
}

class _TeamDescriptionState extends State<TeamDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        color: Color(0xff48ea4b),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        color: Color(0xc31fc521),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        color: Color(0xff48ea4b),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        color: Color(0xc31fc521),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: MediaQuery.of(context).size.width * 0.10,
                child: CustomPaint(
                  size: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height / 2),
                  painter: DashedOvalPainterBottom(),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: MediaQuery.of(context).size.width * 0.11,
                child: CustomPaint(
                  size: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height / 2),
                  painter: DashedOvalPainterTop(),
                ),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width * 0.090,
                right: MediaQuery.of(context).size.width * 0.090,
                top: MediaQuery.of(context).size.width * 0.40,
                bottom: MediaQuery.of(context).size.width * 0.40,
                child: CustomPaint(
                  size: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height / 2),
                  painter: DashedOvalPainterFull(),
                ),
              ),
              // captain
              Positioned(
                bottom: MediaQuery.of(context).size.width * .30,
                left: MediaQuery.of(context).size.width * .04,
                right: MediaQuery.of(context).size.width * .04,
                child: Center(
                  child: Container(
                    child: Image.asset(
                      ic_img_virat,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
              ).animate().fade().slide(),
              // //player 1
              Positioned(
                top: MediaQuery.of(context).size.width * .10,
                bottom: MediaQuery.of(context).size.width * .10,
                left: MediaQuery.of(context).size.width * .04,
                child: Container(
                  child: Image.asset(
                    ic_img_virat,
                    width: 70,
                    height: 70,
                  ),
                ),
              ).animate().fade().slide(),
              // // //player 3
              Positioned(
                top: MediaQuery.of(context).size.width * .15,
                left: MediaQuery.of(context).size.width * .04,
                right: MediaQuery.of(context).size.width * .04,
                child: Center(
                  child: Container(
                    child: Image.asset(
                      ic_img_virat,
                      width: 70,
                      height: 70,
                    ),
                  ),
                ),
              ).animate().fade().slide(),
              // // //player 4
              Positioned(
                top: MediaQuery.of(context).size.width * .30,
                right: MediaQuery.of(context).size.width * .04,
                child: Center(
                  child: Container(
                    child: Image.asset(
                      ic_img_virat,
                      width: 70,
                      height: 70,
                    ),
                  ),
                ),
              ).animate().fade().slide(),
              // // //player 5
              Positioned(
                top: MediaQuery.of(context).size.width * .70,
                left: MediaQuery.of(context).size.width * .040,
                child: Center(
                  child: Container(
                    child: Image.asset(
                      ic_img_virat,
                      width: 70,
                      height: 70,
                    ),
                  ),
                ),
              ).animate().fade().slide(),
              // // //player 6
              Positioned(
                top: MediaQuery.of(context).size.width * 0.90,
                right: MediaQuery.of(context).size.width * .040,
                child: Center(
                  child: Container(
                    child: Image.asset(
                      ic_img_virat,
                      width: 70,
                      height: 70,
                    ),
                  ),
                ),
              ).animate().fade().slide(),
              // // //player 7
              Positioned(
                bottom: MediaQuery.of(context).size.width * 0.60,
                right: MediaQuery.of(context).size.width * 0.050,
                child: Center(
                  child: Container(
                    child: Image.asset(
                      ic_img_virat,
                      width: 70,
                      height: 70,
                    ),
                  ),
                ),
              ).animate().fade().slide(),
              // // //player 8
              Positioned(
                top: MediaQuery.of(context).size.width * 0.40,
                left: MediaQuery.of(context).size.width * 0.10,
                child: Center(
                  child: Container(
                    child: Image.asset(
                      ic_img_virat,
                      width: 70,
                      height: 70,
                    ),
                  ),
                ),
              ).animate().fade().slide(),
              // // //player 9
              Positioned(
                bottom: MediaQuery.of(context).size.width * 0.55,
                left: MediaQuery.of(context).size.width * 0.15,
                child: Center(
                  child: Container(
                    child: Image.asset(
                      ic_img_virat,
                      width: 70,
                      height: 70,
                    ),
                  ),
                ).animate().fade().slide(),
              ),
              // // //   player 10
              Positioned(
                top: MediaQuery.of(context).size.width * 0.60,
                right: MediaQuery.of(context).size.width * 0.30,
                child: Center(
                  child: Container(
                    child: Image.asset(
                      ic_img_virat,
                      width: 70,
                      height: 70,
                    ),
                  ),
                ).animate().fade().slide(),
                // ),
                // //player 11
                // Positioned(
                //   top: 50,
                //   right: 0,
                //   left: 0,
                //   child: Center(
                //       child:
                //           // SlideTransition(
                //           //   position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
                //           //       .animate(addToCartPopUpAnimationController),
                //           //   child: Container(
                //           //     child: Image.asset(
                //           //       ic_img_virat,
                //           //       width: 70,
                //           //       height: 70,
                //           //     ),
                //           //   ),
                //           // ),
                //           Image.asset(
                //     ic_img_virat,
                //     width: 70,
                //     height: 70,
                //   )).animate().fade().slide(),
                // ),
                // const StumAndPitchDesigns(),
                // Positioned(
                //   bottom: 20,
                //   left: 0,
                //   right: 0,
                //   child: Center(
                //     child: SlidingSwitch(
                //       value: false,
                //       width: 250,
                //       onChanged: (bool value) {
                //         print(value);
                //       },
                //       height: 55,
                //       animationDuration: const Duration(milliseconds: 400),
                //       onTap: () {},
                //       onDoubleTap: () {},
                //       onSwipe: () {},
                //       textOff: "CSK",
                //       textOn: "MI",
                //       colorOn: const Color(0xffdc6c73),
                //       colorOff: const Color(0xff6682c0),
                //       background: const Color(0xffe4e5eb),
                //       buttonColor: const Color(0xfff7f5f7),
                //       inactiveColor: const Color(0xff636f7b),
                //     ),
                //   ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class StumAndPitchDesigns extends StatefulWidget {
  const StumAndPitchDesigns({super.key});

  @override
  State<StumAndPitchDesigns> createState() => _StumAndPitchDesignsState();
}

class _StumAndPitchDesignsState extends State<StumAndPitchDesigns> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      bottom: 0,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          height: 400,
          width: 100,
          color: const Color(0xd3e8a74b),
          child: Stack(
            children: [
              // for top stump
              Positioned(
                top: 20,
                left: 10,
                right: 10,
                child: Container(
                  height: 2,
                  color: Colors.white,
                ),
              ),
              Positioned(
                top: 0,
                right: 10,
                child: Row(
                  children: [
                    Container(
                      width: 3,
                      height: 60,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                left: 10,
                child: Row(
                  children: [
                    Container(
                      width: 3,
                      height: 60,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                left: 10,
                child: Row(
                  children: [
                    Container(
                      width: 3,
                      height: 60,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 60,
                left: 0,
                right: 0,
                child: Container(
                  height: 2,
                  color: Colors.white,
                ),
              ),

              //for bottom stump
              Positioned(
                bottom: 30,
                left: 10,
                right: 10,
                child: Container(
                  height: 2,
                  color: Colors.white,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 10,
                child: Row(
                  children: [
                    Container(
                      width: 3,
                      height: 50,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 10,
                child: Row(
                  children: [
                    Container(
                      width: 3,
                      height: 50,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                left: 10,
                child: Row(
                  children: [
                    Container(
                      width: 3,
                      height: 50,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 2,
                  color: Colors.white,
                ),
              ),
            ],
          ), // Centered container
        ),
      ),
    );
  }
}

class PlayersPostions extends StatefulWidget {
  const PlayersPostions({super.key});

  @override
  State<PlayersPostions> createState() => _PlayersPostionsState();
}

class _PlayersPostionsState extends State<PlayersPostions> {
  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}