import 'package:flutter/material.dart';
import 'package:movie_app/components/text.dart';

class TrendingShows extends StatelessWidget {
  const TrendingShows({Key? key, required this.trending}) : super(key: key);

  final List trending;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
            text: 'Trending Shows',
            color: Colors.white,
            size: 25,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 290,
            child: ListView.builder(
              itemCount: trending.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    width: 140,
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500' +
                                  trending[index]['poster_path'],
                            )),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: ModifiedText(
                            text: trending[index]['name'] ?? 'Loading...',
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
