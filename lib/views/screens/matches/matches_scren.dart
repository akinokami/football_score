import 'package:flutter/material.dart';
import 'package:football_score/utils/app_theme.dart';
import 'package:football_score/utils/dimen_const.dart';
import 'package:football_score/views/screens/matches/sport_type/soccer_screen.dart';

class MatchesScreen extends StatefulWidget {
  @override
  _MatchesScreenState createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      //extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
       backgroundColor: Colors.transparent,
        toolbarHeight: 20,

      ),
      body: Column(
        children: <Widget>[
          kSizedBoxH20,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildTabItem(0, 'MLS'),
              _buildTabItem(1, 'Saudi' ),
              _buildTabItem(2, 'A - League'),
              _buildTabItem(3, 'J1 League'),
              _buildTabItem(4, 'J2 League'),
              _buildTabItem(5, 'k League'),
            ],
          ),
          Expanded(
            child: _buildContent(_currentIndex),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(int index, String label) {
    bool isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: isSelected ? secondaryColor : greyColor,
          //shape:isSelected? BoxShape.circle:BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[


              Text(
                label,
                style: TextStyle(color: Colors.white,fontSize: 10),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(int index) {
    switch (index) {
      case 0:
        return SoccerScreen();
      case 1:
        return Center(child: Text('Soccer Content'));
      case 2:
        return Center(child: Text('Basketball Content'));
      case 3:
        return Center(child: Text('Volleyball Content'));
      case 4:
        return Center(child: Text('Tennis Content'));
      case 5:
        return Center(child: Text('Cricket Content'));

      default:
        return Center(child: Text('Football Content'));
    }
  }
}