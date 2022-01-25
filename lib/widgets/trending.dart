import 'package:flutter/material.dart';
import 'package:movie_app/components/text.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({Key? key, required this.trending}) : super(key: key);

  final List trending;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
            text: 'Trending Movies', color: Colors.white, size: 25,
          ),
          const SizedBox(height: 10,),
          SizedBox(
            height: 270,
            child: ListView.builder(itemCount: trending.length, scrollDirection: Axis.horizontal, itemBuilder: (context, index) {
              return InkWell(
                onTap: (){},
                child: SizedBox(
                  width: 140,
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path'],
                          )),
                        ),
                      ),
                      SizedBox(
                        child: ModifiedText(
                          text: trending[index]['title'] ?? 'Loading...',
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 24,),
          const ModifiedText(
            text: 'Trending Series', color: Colors.white, size: 25,
          ),
          const SizedBox(height: 10,),
          SizedBox(
            height: 270,
            child: ListView.builder(itemCount: trending.length, scrollDirection: Axis.horizontal, itemBuilder: (context, index) {
              return InkWell(
                onTap: (){},
                child: SizedBox(
                  width: 140,
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path'],
                          )),
                        ),
                      ),
                      SizedBox(
                        child: ModifiedText(
                          text: trending[index]['title'] ?? 'Loading...',
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
