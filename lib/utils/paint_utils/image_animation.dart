import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_images.dart';

class PlayersLoadingScreen extends StatefulWidget {
  @override
  _PlayersLoadingScreenState createState() => _PlayersLoadingScreenState();
}

class _PlayersLoadingScreenState extends State<PlayersLoadingScreen> {
  bool _loading = true; // Controls loading state
  List<int> _visiblePlayers = List.generate(11, (index) => index);

  @override
  void initState() {
    super.initState();
    _simulateLoading();
  }

  void _simulateLoading() {
    Timer.periodic(Duration(milliseconds: 500), (timer) {
      if (_visiblePlayers.isEmpty) {
        timer.cancel();
        setState(() {
          _loading = false;
        });
      } else {
        setState(() {
          _visiblePlayers.removeAt(0); // Reveal next player
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _loading
          ? CircularProgressIndicator()
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 11,
              itemBuilder: (context, index) {
                return AnimatedOpacity(
                  opacity: _visiblePlayers.contains(index) ? 1.0 : 0.0,
                  duration: Duration(seconds: 1),
                  child: Image.asset(
                    ic_img_virat, // Example player images
                    width: 100,
                    height: 100,
                  ),
                );
              },
            ),
    );
  }
}