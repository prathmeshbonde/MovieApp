import 'package:flutter/material.dart';
import 'package:movie_app/components/text.dart';

class DescriptionPage extends StatelessWidget {
  const DescriptionPage(
      {Key? key,
      required this.name,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      this.launchon})
      : super(key: key);

  final String name, description, bannerurl, posterurl, vote;
  final String? launchon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ModifiedText(text: name, color: Colors.white54, size: 20),
      ),
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.only(top: 20),
        child: ListView(
          children: [
            SizedBox(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    child: SizedBox(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        bannerurl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: ModifiedText(
                      text: '⭐  Average rating : ' + vote,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(10),
              child: ModifiedText(
                text: name,
                size: 24,
                color: Colors.white,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              child: ModifiedText(
                text: launchon != null ? ('Releasing On : ' + launchon!) : '',
                color: Colors.white30,
                size: 14,
              ),
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl),
                ),
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: ModifiedText(
                      text: description,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
