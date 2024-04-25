import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "Booking Flight",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
              ),
            ),
          ),
          backgroundColor: Colors.purpleAccent,
        ),
        body: Center(
          child: Container(
              alignment: Alignment.center,
              color: Colors.deepPurple,
              padding: const EdgeInsets.only(left: 10.0, top: 40.0),
              child: const Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        "US Bangla",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 28.0,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      )),
                      Expanded(
                          child: Text(
                        "From Dhaka to Chittagong",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 20.0,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      )),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        "NovoAir",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 28.0,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      )),
                      Expanded(
                          child: Text(
                        "From Dhaka to Chittagong.",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 20.0,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      )),
                    ],
                  ),
                  FlightImageAsset(),
                  FlightBookButton()
                ],
              )),
        ));

    throw UnimplementedError();
  }
}

class FlightImageAsset extends StatelessWidget {
  const FlightImageAsset({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage assetImage = const AssetImage('images/flight.png');
    Image image = Image(image: assetImage, width: 250.0, height: 250.0);
    return Container(child: image);

    throw UnimplementedError();
  }
}

class FlightBookButton extends StatelessWidget {
  const FlightBookButton({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    const color = Color(0xFFB74093);
    return ElevatedButton(
      onPressed: () => bookFlight(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purpleAccent,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      ),
      child: const Text(
        "Book Your Flight",
        style:
            TextStyle(fontFamily: 'Raleway', color: Colors.white, fontSize: 30),
      ),
    );

    throw UnimplementedError();
  }

  void bookFlight(BuildContext context) {
    var alertDialog = const AlertDialog(
      backgroundColor: Colors.blueAccent,
      
      title: Text(
          "Flight booked successfully",
          style: TextStyle(color: Colors.white),
        ),

      content:
          Text(
        "Have a pleasant flight",
        style: TextStyle(color: Colors.white),
      ),
    );

    showDialog(
        context: context, builder: (BuildContext context) => alertDialog);
  }
}
