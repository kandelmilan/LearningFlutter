import 'package:flutter/material.dart';
import 'package:hello_world/utils/app_size.dart';

class CourseCard extends StatelessWidget {
  String image;
  String courseTitle;
  String courseDesc;
  CourseCard({
    super.key,
    required this.image,
    required this.courseTitle,
    required this.courseDesc,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSize.screenPadding),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(image),
            SizedBox(height: AppSize.sizedBoxGap),

            Text(
              courseTitle,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            Text(courseDesc),
            SizedBox(height: AppSize.sizedBoxGap),
            Row(
              children: [
                FilledButton(onPressed: () {}, child: Text("Button")),
                Spacer(),
                Icon(Icons.favorite_border),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
