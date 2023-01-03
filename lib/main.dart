import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RatingScreen(title: 'Rating Screen Practice'),
    );
  }
}

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key, required this.title});

  final String title;

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double ratingValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Your Rating:',
            ),
            const SizedBox(height: 25),
            RatingBar.builder(
              initialRating: ratingValue,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (ratingValue) {
                // print(ratingValue);
              },
            ),
            const SizedBox(height: 25),
            Slider(
              value: ratingValue,
              max: 5,
              divisions: 5,
              label: ratingValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  ratingValue = value;
                  // print(ratingValue);
                });
              },
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
