import 'package:flutter/material.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingProvider with ChangeNotifier{
   int currentIndex =0;
   List<Map<String,Object > > onBoardingData =[
     {
       'imagePath': 'assets/images/food2.png',
       'subTitle':
       'Our App helps you to know all recipes that you want,So enjoy Using it.. ',
       'title': 'Good Cooking',
     },
     {
       'imagePath': 'assets/images/cookerIntro.png',
       'subTitle': 'Step by step to make all your meals that you want,'
           ' Our App will be your guide for delicious meals,So enjoy Using it.. ',
       'title': 'Be Your Cooker',
     },
   ];
   onViewedPageChanged(int indexVal){
     currentIndex = indexVal;
     notifyListeners();
   }
   onSkipPressed( context) async{
     Navigator.of(context).pushReplacementNamed(TabsScreen.id);
     SharedPreferences _pref = await SharedPreferences.getInstance();
     _pref.setBool('watched', true);
     notifyListeners();
   }

  onBottomButtonPressed (context , PageController _pagController) async{
    if (currentIndex == onBoardingData.length - 1) {
      Navigator.of(context).pushReplacementNamed(TabsScreen.id);
    }
    _pagController.nextPage(
        duration: Duration(milliseconds: 100),
        curve: Curves.bounceIn);
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setBool('watched', true);
    notifyListeners();
  }

}