import 'package:flutter/material.dart';

class TagsList extends StatelessWidget {
  String? tags;
  TagsList({
    super.key,
    this.tags,
  });

  List<String> editTags(String? tags) {
    List<String> listOfTags = [];
    if (tags != null) {
      var data = tags.split(',');
      for (var tag in data) {
        if (tag.isNotEmpty) {
          listOfTags.add(tag);
        }
      }
    } else {
      listOfTags = ['delicious', 'fast', 'tasty'];
    }
    return listOfTags;
  }

  @override
  Widget build(BuildContext context) {
    var finalTags = editTags(tags);
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: finalTags.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: const Color(0xFFEDEDED),
              borderRadius: BorderRadius.circular(32),
            ),
            child: Text(finalTags[index]),
          );
        },
      ),
    );
  }
}
