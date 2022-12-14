import 'package:flutter/material.dart';
import 'package:kit_kart/consts/consts.dart';
import 'package:get/get.dart';
import 'package:kit_kart/consts/list.dart';
import 'package:kit_kart/widgets_common/home_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: whiteColor,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
        child: Column(
          children: [
            Container(
                color: whiteColor,
                child: TextFormField(
                  decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor: lightGrey,
                      hintText: searchAnything,
                      border: InputBorder.none),
                )),
            10.heightBox,
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
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
                    20.heightBox,
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Featured Categories',
                        style: TextStyle(fontSize: 20, fontFamily: semibold),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
