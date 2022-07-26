import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

Widget newsItem(Map map) {
  final String title = map['title'];
  final String date = map['publishedAt'];
  final String url = map['urlToImage'] ?? "";
  print('URL => ${url.isEmpty}');
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Row(
      children: [
        if (url.isEmpty)
          Container()
        else
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image:
                  DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
            ),
          ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    title,
                    textAlign: TextAlign.justify,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget divider() {
  return Padding(
    padding: const EdgeInsets.only(left: 100),
    child: Container(
      width: double.infinity,
      height: 1,
      color: Colors.grey,
    ),
  );
}


class ArticleBuilder extends StatelessWidget {
  const ArticleBuilder({
    Key? key,
    required this.list,
  }) : super(key: key);

  final List<dynamic> list;

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: list.isNotEmpty,
      fallback: (context) => const Center(
          child: CircularProgressIndicator(
        semanticsLabel: 'LODING...',
      )),
      builder: (cxt) => ListView.separated(
        itemCount: list.length,
        itemBuilder: (context, index) => newsItem(list[index]),
        separatorBuilder: (context, index) => divider(),
      ),
    );
  }
}