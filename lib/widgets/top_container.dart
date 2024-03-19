import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TopContainer extends StatelessWidget {
  final String title;
  final String searchBarTitle;

  TopContainer({
    Key? key, // Removed const keyword
    required this.title,
    required this.searchBarTitle,
  }) : super(key: key); // Removed const keyword
  final search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // title
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            Container(
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withOpacity(0.8),
              ),
              child: Stack(
                children: [
                  Icon(
                    FontAwesomeIcons.bell,
                    color: Colors.black87,
                    size: 20,
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: CachedNetworkImage(
                imageUrl: 'assets/kushal.jpg',
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),

        // search bar
        Container(
          margin: const EdgeInsets.symmetric(vertical: 30),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.8),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(
            children: [
              Icon(
                FontAwesomeIcons.search,
                size: 20,
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                    controller: search,
                    decoration: InputDecoration(
                      hintText: "search your item",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(color: Colors.red, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(31),
                          borderSide: BorderSide(color: Colors.deepPurple)),
                    ),
                    onSubmitted: (value) {
                      String se = search.text.toString();
                      print(" searched name is : $se");
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
