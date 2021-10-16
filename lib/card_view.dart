import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  const CardView({
    Key? key,
    this.name = "Name",
    this.details = "About",
    this.image = "instagrammer1",
  }) : super(key: key);
  final String name;
  final String details;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: Material(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          SizedBox.expand(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/$image.png"),
                    fit: BoxFit.cover,
                  ),
                  gradient: const LinearGradient(
                      colors: [Colors.transparent, Colors.black54],
                      begin: Alignment.center,
                      end: Alignment.bottomCenter)),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Stack(children: <Widget>[
                    Text(name,
                        style: TextStyle(
                            // color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                            foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 2
                            ..color = Colors.black38)),
                    Text(name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700))]),
                    // Text(name,
                    //     style: TextStyle(
                    //         // color: Colors.white,
                    //         fontSize: 20.0,
                    //         fontWeight: FontWeight.w700,
                    //         foreground: Paint()
                    //         ..style = PaintingStyle.stroke
                    //         ..strokeWidth = 1
                    //         ..color = Colors.black12)),
                    // Text(name,
                    //     style: const TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 20.0,
                    //         fontWeight: FontWeight.w700)),
                    const Padding(padding: EdgeInsets.only(bottom: 8.0)),
                    Stack(children: <Widget>[
                      Text(details,
                        textAlign: TextAlign.start,
                        style: TextStyle(foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 2
                            ..color = Colors.black38)),
                      Text(details,
                        textAlign: TextAlign.start,
                        style: const TextStyle(color: Colors.white))]),
                    // Text(details,
                    //     textAlign: TextAlign.start,
                    //     style: const TextStyle(color: Colors.black)),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
