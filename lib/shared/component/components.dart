import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app/module/web_view/web_view_screen.dart';

Widget newsItem(BuildContext context, Map map) {
  final String title = map['title'];
  final String date = map['publishedAt'];
  final String url = map['urlToImage'] ?? "";
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
              image: DecorationImage(
                  image: CachedNetworkImageProvider(url), fit: BoxFit.cover),
            ),
          ),
        const SizedBox(width: 10),
        Expanded(
          child: SizedBox(
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
                    style: Theme.of(context).textTheme.bodyText1,
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

Widget articleBuilder({required list}) {
  // return ConditionalBuilder(
  //   condition: true,
  //   fallback: (context) => const Center(
  //       child: CircularProgressIndicator(
  //     semanticsLabel: 'LODING...',
  //   )),
  //   builder: (cxt) => ListView.separated(
  //     itemCount: list.length,
  //     itemBuilder: (context, index) => newsItem(context, list[index]),
  //     separatorBuilder: (context, index) => divider(),
  //   ),
  // );
  return ListView.separated(
    itemCount: list.length,
    itemBuilder: (context, index) => InkWell(
      child: newsItem(context, list[index]),
      onTap: () {
        navigateTo(context, WebViewScreen(url: list[index]['url']));
      },
    ),
    separatorBuilder: (context, index) => divider(),
  );
}

class DefualtTextField extends StatelessWidget {
  DefualtTextField({
    Key? key,
    required this.controller,
    required this.title,
    required this.icon,
    required this.validator,
    this.readOnly = false,
    this.onTap,
    this.onChanged,
  }) : super(key: key);

  final TextEditingController controller;
  final String title;
  final IconData icon;
  final FormFieldValidator<String>? validator;
  final void Function()? onTap;
  final bool readOnly;
  void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        border: const OutlineInputBorder(),
        label: Text(title),
      ),
      validator: validator,
      readOnly: readOnly,
      onTap: onTap,
      onChanged: onChanged,
    );
  }
}

void navigateTo(BuildContext context, Widget widget) =>
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return widget;
      },
    ));
