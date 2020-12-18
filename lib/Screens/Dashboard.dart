import 'package:flutter/material.dart';
import 'package:todo_flutter_app/Screens/HomePage.dart';
import 'package:todo_flutter_app/Styles/Constants.dart';
import 'package:todo_flutter_app/Components/Dashboardpage.dart';
class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int currentPage;
  PageController _pageController =
      PageController(initialPage: 0, keepPage: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                child: PageView(
                  controller: _pageController,
                  children: [
                    dashboardPage(context,"Slide1", "Welcome!!Connect with us.."),
                    dashboardPage(context,"Slide2", "Organize of your work"),
                    dashboardPage(context,
                        "Slide3", "Set remainders and do it before time"),
                  ],
                  onPageChanged: (value) => (setCurrentPage(value)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) => getIndicator(index)),
              ),

              Padding(
                padding: const EdgeInsets.only(top:150.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => openLoginPage(),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 70),
                          decoration: BoxDecoration(
                            color: Color(0xff1db954),
                              borderRadius: BorderRadius.circular(90),
                          ),
                          child: Text("Get Started", style:normaltext(fsize: 30.0,color:Colors.black)),
                        ),
                      ),
                    ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  AnimatedContainer getIndicator(int pageNo) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      height: 10,
      width: (currentPage == pageNo) ? 20 : 10,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: (currentPage == pageNo) ? Color(0xff1db954): Colors.grey),
    );
  }



  setCurrentPage(int value) {
    currentPage = value;
    setState(() {});
  }
  openLoginPage(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
  }
}
