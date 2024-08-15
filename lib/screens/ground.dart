import 'package:circ_scrorer/utils/app_colors.dart';
import 'package:circ_scrorer/utils/app_images.dart';
import 'package:circ_scrorer/utils/diamentions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Ground extends StatefulWidget {
  const Ground({super.key});

  @override
  State<Ground> createState() => _GroundState();
}

class _GroundState extends State<Ground> {
  @override
  void initState() {
    super.initState();
  }

  List<Player> players = [
    Player(name: 'Batsman 1', position: 'Batsman', x: 600 / 2 - 30, y: (300 * 2.25) - 50, image: ic_player),
    Player(name: 'Batsman 2', position: 'Batsman', x: 600 / 2 + 30, y: (300 * 2.25) - 50, image: ic_player),
    // Add more players here with their positions, images, and initial coordinates
  ];

  void updatePlayerPositions(List<Player> newPositions) {
    setState(() {
      players = newPositions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          SvgPicture.asset(
            ic_pitch,
            semanticsLabel: 'My SVG Image',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            left: 0,
            right: 0, // Adjust position as needed
            top: 100, // Adjust position as needed
            child: Image.asset(
              ic_player,
              width: 90,
              height: 90,
            ),
          ),
          Positioned(
            right: MediaQuery.of(context).size.width * 0.70,
            // Adjust position as needed
            top: MediaQuery.of(context).size.width * 0.60, // Adjust position as needed
            child: Image.asset(
              ic_player,
              width: 90,
              height: 90,
            ),
          ),
          Positioned(
            right: 0,
            left: 0, // Adjust position as needed
            bottom: 50, // Adjust position as needed
            child: Image.asset(
              ic_player,
              width: 100,
              height: 100,
            ),
          ),
        ],
      ),
    );
  }
}

class Player {
  final String name;
  final String position;
  double x;
  double y;
  final String image;

  Player({
    required this.name,
    required this.position,
    this.x = 0,
    this.y = 0,
    required this.image,
  });
}