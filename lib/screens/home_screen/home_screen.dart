import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kit_kart/consts/consts.dart';
import 'package:kit_kart/consts/list.dart';
import 'package:kit_kart/controller/authController.dart';
import 'package:kit_kart/screens/home_screen/search_page.dart';
import 'package:kit_kart/screens/profile_screen/profile_screen.dart';
import 'package:kit_kart/widgets_common/featured_card.dart';
import 'package:kit_kart/widgets_common/home_card.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var controller = AuthController();
  var userNAme = AuthController.userName;
  var userUrl = AuthController.userUrl;

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          children: [
            GestureDetector(
                onTap: (() {
                  Get.to(() => const ProfileScreen());
                }),
                child: SizedBox(
                    width: 40,
                    height: 40,
                    child: userUrl == null
                        ? Container(
                            width: 40,
                            height: 40,
                            color: Colors.red,
                          )
                        : Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                image: DecorationImage(
                                    image: NetworkImage(userUrl.toString()))),
                          ))),
            20.widthBox,
            Text(userNAme ?? 'Name'),
          ],
        ),
        actions: [
          // Navigate to the Search Screen
          IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => const SearchPage())),
              icon: const Icon(Icons.search))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        color: whiteColor,
        width: context.screenWidth,
        height: context.screenHeight,
        child: SafeArea(
          child: Column(
            children: [
              10.heightBox,
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      // first swiper
                      VxSwiper.builder(
                          aspectRatio: 16 / 9,
                          autoPlay: true,
                          autoPlayCurve: Curves.linear,
                          height: 120,
                          itemCount: sliderTwoList.length,
                          itemBuilder: ((context, index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                        sliderTwoList[index],
                                      )),
                                  borderRadius: BorderRadius.circular(20)),
                            );
                          })),

                      20.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // deals card
                          homeCard(
                              icon: icTodaysDeal,
                              title: todayDeals,
                              hight: MediaQuery.of(context).size.height * .15,
                              width: MediaQuery.of(context).size.width / 2.5),
                          homeCard(
                              icon: icFlashDeal,
                              title: flashsales,
                              hight: MediaQuery.of(context).size.height * .15,
                              width: MediaQuery.of(context).size.width / 2.5)
                        ],
                      ),
                      // slider two
                      10.heightBox,
                      VxSwiper.builder(
                          aspectRatio: 16 / 9,
                          autoPlay: true,
                          autoPlayCurve: Curves.linear,
                          height: 120,
                          itemCount: slidersList.length,
                          itemBuilder: ((context, index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                        slidersList[index],
                                      )),
                                  borderRadius: BorderRadius.circular(20)),
                            );
                          })),
                      10.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // category cards
                          homeCard(
                              icon: icTopCategories,
                              title: topCategory,
                              hight: MediaQuery.of(context).size.height * .12,
                              width: MediaQuery.of(context).size.width / 3.5),
                          homeCard(
                              icon: icBrands,
                              title: topbrands,
                              hight: MediaQuery.of(context).size.height * .12,
                              width: MediaQuery.of(context).size.width / 3.5),
                          homeCard(
                              icon: icTopSeller,
                              title: topSaller,
                              hight: MediaQuery.of(context).size.height * .12,
                              width: MediaQuery.of(context).size.width / 3.5),
                        ],
                      ),
                      // featured category

                      20.heightBox,
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Featured Categories',
                          style: TextStyle(fontSize: 20, fontFamily: semibold),
                        ),
                      ),
                      20.heightBox,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              3,
                              (index) => Column(
                                    children: [
                                      featuredCard(
                                          image: featuredImage1[index],
                                          title: featuredTitle1[index]),
                                      10.heightBox,
                                      featuredCard(
                                          image: featuredImage2[index],
                                          title: featuredTitle2[index])
                                    ],
                                  )),
                        ),
                      ),

                      //featured product
                      20.heightBox,
                      Container(
                        padding: const EdgeInsets.all(12),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: primaryColor,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              featuredProduct,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: whiteColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            20.heightBox,
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(
                                    6,
                                    (index) => Container(
                                          width: 150,
                                          padding: const EdgeInsets.all(10),
                                          margin:
                                              const EdgeInsets.only(right: 10),
                                          decoration: BoxDecoration(
                                            color: whiteColor,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 7,
                                                offset: const Offset(0,
                                                    4), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                imgP3,
                                                width: 150,
                                                fit: BoxFit.cover,
                                              ),
                                              10.heightBox,
                                              const Text(
                                                  'Macbook Air (2012) 128/SSD'),
                                              10.heightBox,
                                              const Text(
                                                '\$500',
                                                style: TextStyle(
                                                    color: primaryColor,
                                                    fontFamily: bold,
                                                    fontSize: 16),
                                              )
                                            ],
                                          ),
                                        )),
                              ),
                            )
                          ],
                        ),
                      ),
                      // third swipier
                      20.heightBox,
                      VxSwiper.builder(
                          aspectRatio: 16 / 9,
                          autoPlay: true,
                          autoPlayCurve: Curves.linear,
                          height: 120,
                          itemCount: sliderTwoList.length,
                          itemBuilder: ((context, index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                        sliderTwoList[index],
                                      )),
                                  borderRadius: BorderRadius.circular(20)),
                            );
                          })),
                      // all products
                      20.heightBox,
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 6,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                                mainAxisExtent: 300),
                        itemBuilder: ((context, index) {
                          return Container(
                            width: 150,
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 4), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  imgP1,
                                  width: 200,
                                  fit: BoxFit.cover,
                                ),
                                const Spacer(),
                                const Text('Macbook Air (2012) 128/SSD'),
                                10.heightBox,
                                const Text(
                                  '\$500',
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontFamily: bold,
                                      fontSize: 16),
                                )
                              ],
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
