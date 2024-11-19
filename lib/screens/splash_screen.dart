import 'package:categrised_search/data/products_data.dart';
import 'package:categrised_search/screens/authentication/sign_in.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width * 0.95;
    final height = MediaQuery.of(context).size.height * 0.95;
    return Scaffold(
      body: Center(
        child: Container(
          width: width,
          height: height,
          color: Colors.teal,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                alignment: Alignment.topRight,
                width: double.infinity,
                height: 70,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ));
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage=value;
                    });
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: categorys.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(categorys[index].image),
                            ),
                          ),
                          width: 400,
                          height: 400,
                        ),
                        Text(
                          categorys[index].title,
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          categorys[index].subTitle,
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 15,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(5),
                      width: currentPage==index? 25:10,
                      height: 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color:currentPage==index?Colors.red:
                           Colors.white),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                    child: 
                    currentPage==2?
                    Row(mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login(),));
                            },
                            child: Icon(Icons.arrow_forward_ios)),
                      ],
                    ):Container()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
