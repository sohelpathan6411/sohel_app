import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked_card_carousel/stacked_card_carousel.dart';

import '../consts/app_consts.dart';
import '../providers/subscription_provider.dart';
import '../widgets/custom_button_widget.dart';
import 'add_subscription_bottom_sheet.dart';

class MySubscriptionsScreen extends StatelessWidget {
  const MySubscriptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.subscriptions_sharp,
              size: 18,
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              allSubsText,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.white),
            )
          ],
        ),
      ),
      body: LayoutBuilder( 
            builder: (BuildContext ctx, BoxConstraints constraints) { 
          return Consumer<SubscriptionProvider>(builder: (context, provider, child) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //CATEGORY OPTIONS
                  _categoryOptions(),
                  SizedBox(
                    height: 20,
                  ),
                  //SUBSCRIPTION LIST
                  Expanded(
                    child: _subscriptionList(constraints),
                  ),
                ],
              ),
            );
          });
        }
      ),
    );
  }

  Widget _subscriptionList(BoxConstraints constraints) {
    return Consumer<SubscriptionProvider>(builder: (context, provider, child) {
      return SizedBox(
                  width: constraints.maxWidth * (constraints.maxWidth<600?1:0.5),
        child: StackedCardCarousel(
          initialOffset: 0,
          items: [
            //ADD SUBSCRIPTION CARD
            _addSubscriptionCard(context),
        
            //SUBSCRIPTION CARDS
            if (provider.subscriptions.isNotEmpty)
              for (int index = 0; index < provider.subscriptions.length; index++)
                Dismissible(
                  onDismissed: (_) {
                    provider.removeSubscription(index);
                  },
                  key: UniqueKey(),
                  child: Stack(
                    children: [
                      Card(
                     
                        elevation: 12,
                        shadowColor: colorsList[index % colorsList.length],
                        color: colorsList[index % colorsList.length],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.only(
                              left: 16, right: 16, top: 5, bottom: 18),
                          title: Text(
                            provider.subscriptions[index].name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: titleList[index % titleList.length],
                            ),
                          ),
                          titleAlignment: ListTileTitleAlignment.top,
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 3),
                                margin: EdgeInsets.only(top: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  '\$${provider.subscriptions[index].price.toStringAsFixed(2)} / $monthText',
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                detailsText,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: titleList[index % titleList.length],
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  Text(
                                    nextPaymentText,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: titleList[index % titleList.length],
                                    ),
                                  ),
                                  Text(
                                    provider.subscriptions[index].renewalDate
                                        .toString()
                                        .split(" ")
                                        .first,
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: titleList[index % titleList.length],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          trailing: Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            padding: const EdgeInsets.all(6.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                'assets/${provider.subscriptions[index].name.replaceAll(" ", "_")}.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 130, // Adjust for stacking effect
                        right: 30,
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: titleList[index % titleList.length],
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Icon(
                            Icons.arrow_forward,
                            size: 14,
                            color: colorsList[index % titleList.length],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          ],
          spaceBetweenItems: 80,
        ),
      );
    });
  }

  Widget _addSubscriptionCard(BuildContext context) {
    return InkWell(
      onTap: () {
        //Add Subscription, Bottom Sheet
        showModalBottomSheet(
          context: context,
          builder: (context) => AddSubscriptionBottomSheet(),
        );
      },
      child: Card(
     
        color: Colors.blue.shade800,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListTile(
            contentPadding: EdgeInsets.only(right: 6, top: 15, bottom: 70),
            title: Text(
              addASubscriptionText,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            subtitle: Text(''),
            trailing: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(
                Icons.add,
                size: 32,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _categoryOptions() {
    return Row(
      children: [
        CustomButtonWidget(
          text: allSubsText,
          onPressed: () {},
        ),
        SizedBox(
          width: 4,
        ),
        CustomButtonWidget(
          text: entertainmentText,
          onPressed: () {},
          bgColor: Colors.white12,
        ),
        SizedBox(
          width: 6,
        ),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Icon(
            Icons.add,
            size: 20,
          ),
        ),
      ],
    );
  }
}
