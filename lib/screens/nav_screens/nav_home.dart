import 'dart:async';

import 'package:categrised_search/data/ad_image.dart';
import 'package:categrised_search/data/products_data.dart';
import 'package:categrised_search/models/product_model.dart';
import 'package:categrised_search/screens/detail_product_screen.dart';
import 'package:categrised_search/screens/nav_screens/nav_cart.dart';
import 'package:flutter/material.dart';

class NavHome extends StatefulWidget {
  const NavHome({super.key});

  @override
  State<NavHome> createState() => _NavHomeState();
}

class _NavHomeState extends State<NavHome> {
  
  String searchText = "";
  List<ProductModel> filterdList = [];
  final _pageViewController = PageController();
  int currentPage = 0;
  int categoryIndex = 0;
  @override
  void dispose() {
    autoImageSlider();
    super.dispose();
  }
  
  @override
  void initState() {
    autoImageSlider();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    filterdList = categorizeList()
        .where((element) => element.title.toLowerCase().contains(searchText))
        .toList();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NavCart(),
                    ));
              },
              icon: Icon(Icons.shopping_cart)),
        ],
        title: Text(
          "Home Screen",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    searchText = value.toLowerCase();
                  });
                },
                decoration: InputDecoration(
                    hintText: "Search", prefixIcon: Icon(Icons.search)),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 150,
                child: PageView.builder(
                  controller: _pageViewController,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: AdImage().adImages.length,
                  itemBuilder: (context, index) {
                    return Container(
                     
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AdImage().adImages[index].adImage),
                        ),
                      ),
                    );
                  },
                ),
              ),
            SizedBox(height: 10,),
              SizedBox(
                height: 10,
                child: ListView.separated(
                  
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        width: currentPage == index ? 15 : 8,
                        height: 5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: currentPage == index
                                ? Colors.red
                                : Colors.amber),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          width: 5,
                        ),
                    itemCount: AdImage().adImages.length),
              ),
              Text(
                "Category",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 60,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => SizedBox(
                    width: 10,
                  ),
                  itemCount: categorys.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          categoryIndex = index;
                        });
                      },
                      child: Container(
                        width: 150,
                        height: 60,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(10),
                            color: categoryIndex == index
                                ? Colors.teal
                                : Colors.grey.shade100),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image(
                              image: AssetImage(categorys[index].image),
                              height: 50,
                            ),
                            Text(
                              categorys[index].title,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: categoryIndex == index
                                      ? Colors.white
                                      : Colors.grey),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Products",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 270,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => SizedBox(
                    width: 10,
                  ),
                  itemCount: filterdList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailProductScreen(
                                        product: filterdList[index],
                                      )));
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: 190,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade100),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(
                                image: AssetImage(filterdList[index].image),
                                height: 130,
                              ),
                              Text(
                                filterdList[index].title,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.teal),
                              ),
                              Text(
                                filterdList[index].subTitle,
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Price",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.teal),
                                  ),
                                  Text(
                                    "\$${filterdList[index].price.toStringAsFixed(2)}",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.teal),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<ProductModel> categorizeList() {
    switch (categoryIndex) {
      case 0:
        return burgerList;
      case 1:
        return dessertList;
      case 2:
        return pizzaList;
      default:
        return [];
    }
  }

  void autoImageSlider() {
    Timer.periodic(Duration(seconds: 2), (Timer timer) {
     if(mounted) setState(() {
        currentPage = (currentPage + 1) % AdImage().adImages.length;
      });
      if(_pageViewController.hasClients){
        _pageViewController.animateToPage(currentPage, duration: Duration(milliseconds: 500), curve: Curves.ease);
      }
    });
  }
}
