import 'package:dailysync/utils/constants.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController();

  int currentPage = 0;


  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/intro1.png",
      "title": "کارهات رو مدیریت کن",
      "description": "به‌راحتی تمام کارهای روزانه‌ات را در کارنامه به صورت رایگان مدیریت کن."
    },
    {
      "image": "assets/images/intro2.png",
      "title": "پیشرفتت رو دنبال کن",
      "description": "کارهای انجام‌شده و در انتظار رو به‌طور مؤثر پیگیری کن."
    },
    {
      "image": "assets/images/intro3.png",
      "title": "همیشه منظم باش",
      "description": "زندگی‌ات را با دسته‌بندی وظایف و یادآورها منظم کن."
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor, // Adjusted to match primaryColor
        title: Text(
          'گذر کردن',
          style: TextStyle(
              color: Colors.white.withOpacity(0.44),
              fontFamily: 'Vazir',
              fontSize: 16),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: screenHeight * 0.7, // Set a fixed height for the PageView
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  currentPage = page;
                });
              },
              itemCount: onboardingData.length,
              itemBuilder: (context, index) => OnboardingContent(
                image: onboardingData[index]["image"]!,
                title: onboardingData[index]["title"]!,
                description: onboardingData[index]["description"]!,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onboardingData.length,
                  (index) => buildDot(index),
            ),
          ),
          SizedBox(height: screenHeight*0.05),
          Padding(
            padding: const EdgeInsets.all(20.0), // Added padding for buttons
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(

                  onPressed: () {
                    if (currentPage > 0) {
                      _pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    }
                  },
                  child: Text(
                    "بازگشت", // Localized to Persian
                    style: TextStyle(color: Colors.white.withOpacity(0.44),fontFamily: 'Vazir',fontSize: 16),
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.0),  // Set to 0 for sharp corners
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(buttoncolor), // Your button color
                  ),

                  onPressed: () {
                    if (currentPage < onboardingData.length - 1) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    } else {
                      // Navigate to the next screen or home screen
                    }
                  },
                  child: Text(

                    currentPage == onboardingData.length - 1
                        ? "پایان"  // Localized to Persian
                        : "بعدی",  // Localized to Persian
                    style: TextStyle(color: Colors.white,fontFamily: 'Vazir',fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Method to build dots for page indicators
  Widget buildDot(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 8,
      width: currentPage == index ? 20 : 8,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.white : Colors.grey,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class OnboardingContent extends StatelessWidget {
  final String image, title, description;

  const OnboardingContent({
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              image,
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.9,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.06),
          Text(
            title,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: 32,
              fontFamily: 'Vazir',
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Text(
            description,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontFamily: 'Vazir',
              fontSize: 16,
              color: Colors.white.withOpacity(0.77),
            ),
          ),
        ],
      ),
    );
  }
}
