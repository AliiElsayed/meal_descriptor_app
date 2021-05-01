import 'package:flutter/material.dart';
import 'package:meal_app/providers/onBoarding_provider.dart';
import 'package:provider/provider.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String id = 'OnBoardingScreen';
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController(initialPage: 0);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int usedCurrentIndex =
        Provider.of<OnBoardingProvider>(context).currentIndex;
    var boardingProvider = Provider.of<OnBoardingProvider>(context);
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    bool isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    var skipButton = Container(
      padding: EdgeInsets.only(top: 7.0),
      height: deviceHeight / 10,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
      child: usedCurrentIndex == boardingProvider.onBoardingData.length - 1
          ? Text('')
          : OutlinedButton(
              style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0))),
              onPressed: () {
                boardingProvider.onSkipPressed(context);
              },
              child: Text('Skip'),
            ),
      alignment: Alignment.topRight,
    );
    getImage(int indx) {
      return Image.asset(
        boardingProvider.onBoardingData[indx]['imagePath'],
        height: isLandScape ? deviceHeight / 1.7 : deviceHeight / 2.5,
        width: isLandScape ? deviceWidth / 2.2 : deviceWidth / 1.2,
      );
    }

    getTitleContainer(int indx) {
      return Container(
        padding: isLandScape
            ? EdgeInsets.only(top: 15.0, bottom: 2.0, left: 10.0)
            : EdgeInsets.only(
                top: 15.0,
                bottom: 2.0,
              ),
        alignment: Alignment.centerLeft,
        child: Text(
          boardingProvider.onBoardingData[indx]['title'],
          style: TextStyle(color: Colors.black, fontSize: 25.0),
        ),
      );
    }

    getSubTitleContainer(int indx) {
      return Container(
        padding:
            isLandScape ? EdgeInsets.only(left: 15.0) : EdgeInsets.only(left:7.0),
        width: isLandScape ? deviceWidth / 2 : deviceWidth,
        child: Text(
          boardingProvider.onBoardingData[indx]['subTitle'],
          style: TextStyle(color: Colors.black, fontSize: 20.0),
          softWrap: true,
        ),
      );
    }

    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 2,
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (newVal) {
                boardingProvider.onViewedPageChanged(newVal);
              },
              itemCount: boardingProvider.onBoardingData.length,
              itemBuilder: (context, index) {
                return Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                  child: !isLandScape
                      ? Column(
                          children: [
                            skipButton,
                            getImage(index),
                            getTitleContainer(index),
                            getSubTitleContainer(index),
                          ],
                        )
                      : Column(
                          children: [
                            skipButton,
                            Row(
                              children: [
                                getImage(index),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    getTitleContainer(index),
                                    getSubTitleContainer(index),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              boardingProvider.onBoardingData.length,
              (index) => Container(
                height: 8.0,
                width: usedCurrentIndex == index ? 18.0 : 8,
                margin: EdgeInsets.only(left: 2.0),
                decoration: BoxDecoration(
                  color: usedCurrentIndex == index
                      ? Colors.pink
                      : Colors.black54.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
          ),
          Container(
            height:isLandScape? deviceHeight / 10:deviceHeight/13,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0), color: Colors.pink),
            child: TextButton(
              onPressed: () {
                boardingProvider.onBottomButtonPressed(context, _controller);
              },
              child: Text(
                usedCurrentIndex == boardingProvider.onBoardingData.length - 1
                    ? 'Continue'
                    : 'Next',
                style: TextStyle(color: Colors.white),
              ),
              style: TextButton.styleFrom(
                textStyle: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
