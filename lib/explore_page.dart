import 'package:flutter/material.dart';
import 'card_view.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  // var direction;
  int counter = 4;

  @override
  Widget build(BuildContext context) {
    //create a CardController
    SwipeableCardSectionController _cardController =
        SwipeableCardSectionController();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SwipeableCardsSection(
            cardController: _cardController,
            context: context,
            //add the first 3 cards
            items: const [
              CardView(name: "Nicole Smith", details: "Software Engineer at Microsoft", image: "explore_profile_1"),
              CardView(name: "Akiko Naka", details: "Founder and CEO of Wantedly", image: "explore_profile_2"),
              CardView(name: "Pocket Sun", details: "Co-Founder of SoGal", image: "explore_profile_3"),
            ],
            onCardSwiped: (dir, index, widget) {
              // print(dir.runtimeType);
              // direction = dir;
              // Navigator.push(
              //   context,
              // MaterialPageRoute(
              //     builder: (context) => CardView(
              //           direction: dir,
              //         ));
              // );

              // Add the next card
              if (counter <= 5) {
                if (counter == 4) {
                  _cardController.addItem(const CardView(
                    name: "Christine Wang", details: "Associate Director of AGD", image: "explore_profile_4"));
                } else if (counter == 5) {
                  _cardController.addItem(const CardView(
                    name: "Tiffany Su", details: "Business Analyst at McKinsey & Company", image: "explore_profile_5"));
                }
                counter++;
              }

              if (dir == Direction.left) {
                print('reached left');
                final snackBar = SnackBar(
                  content:
                      Text('Skipped ${(widget as CardView).name}'),
                  backgroundColor: (Colors.black12),
                  duration: const Duration(seconds: 2),
                  // action: SnackBarAction(
                  //   label: 'dismiss',
                  //   onPressed: () {},
                  // ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                // Positioned(
                //   top: 20,
                //   child: Transform.rotate(
                //     angle: 0.5,
                //     child: Container(
                //       padding: const EdgeInsets.all(8.0),
                //       decoration: BoxDecoration(
                //         border: Border.all(color: Colors.pink, width: 2),
                //       ),
                //       child: const Text(
                //         'NOPE',
                //         style: TextStyle(
                //           color: Colors.pink,
                //           fontSize: 20,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     ),
                //   ),
                // );
                // print('onDisliked ${(widget as CardView).text} $index');
              } else if (dir == Direction.right) {
                print('reached right');
                final snackBar = SnackBar(
                  content:
                      Text('Connected with ${(widget as CardView).name}'),
                  backgroundColor: (Colors.black12),
                  duration: const Duration(seconds: 2),
                  // action: SnackBarAction(
                  //   label: 'dismiss',
                  //   onPressed: () {},
                  // ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                // Positioned(
                //   top: 20,
                //   child: Transform.rotate(
                //     angle: -0.5,
                //     child: Container(
                //       padding: const EdgeInsets.all(8.0),
                //       decoration: BoxDecoration(
                //         border: Border.all(color: Colors.green, width: 2),
                //       ),
                //       child: const Text(
                //         'LIKE',
                //         style: TextStyle(
                //           color: Colors.green,
                //           fontSize: 20,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     ),
                //   ),
                // );
                // print('onLiked ${(widget as CardView).text} $index');
              }
            },
            enableSwipeUp: false,
            enableSwipeDown: false,
          ),
        ],
      ),
    );
  }
}
