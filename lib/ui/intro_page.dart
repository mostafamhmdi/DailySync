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
      "title": "کارهات را مدیریت کن",
      "description": "به‌راحتی تمام کارهای روزانه‌ات را در کارنامه به صورت رایگان مدیریت کن."
    },
    {
      "image": "assets/images/intro2.png",
      "title": "پیشرفتت را دنبال کن",
      "description": "کارهای انجام‌شده و در انتظار را به‌طور مؤثر پیگیری کن."
    },
    {
      "image": "assets/images/intro3.png",
      "title": "همیشه منظم باش",
      "description": "زندگی‌ات را با دسته‌بندی وظایف و یادآورها منظم کن."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('skip',style: TextStyle(color: Colors.white.withOpacity(0.44)),),
      ),

      body: Column(
        children: [
             PageView.builder(
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



            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onboardingData.length,
                        (index) => buildDot(index),
                  ),
                ),
                SizedBox(height: 20),
                Row(
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
                        "BACK",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    TextButton(
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
                            ? "FINISH"
                            : "NEXT",
                        style: TextStyle(color: Colors.purple),
                      ),
                    ),
                  ],
                ),
              ],

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
        color: currentPage == index ? Colors.purple : Colors.grey,
        borderRadius: BorderRadius.circular(5),
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
    return Column(
      children: [
        Spacer(),
        Image.asset(
          image,
          height: 300,
        ),
        Spacer(),
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white70),
        ),

      ],
    );
  }
}
