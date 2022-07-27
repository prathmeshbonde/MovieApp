import 'package:flutter/material.dart';
import 'package:movie_app/components/text.dart';
import 'package:movie_app/descriptionpage.dart';

class TV extends StatelessWidget {
  const TV({Key? key, required this.tv}) : super(key: key);

  final List tv;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
            text: 'Popular Shows',
            color: Colors.white,
            size: 25,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: tv.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DescriptionPage(
                          name: tv[index]['name'],
                          description: tv[index]['overview'],
                          bannerurl: 'https://image.tmdb.org/t/p/w500' +
                              (tv[index]['backdrop_path'] ?? 'No Image Found'),
                          posterurl: 'https://image.tmdb.org/t/p/w500' +
                              tv[index]['poster_path'],
                          vote: tv[index]['vote_average'].toString(),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 250,
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Container(
                          width: 250,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500' +
                                    (tv[index]['backdrop_path'] ?? 'No Image Found'),
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: ModifiedText(
                            text: tv[index]['original_name'] ?? 'Loading...',
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
