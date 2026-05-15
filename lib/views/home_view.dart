import 'package:flutter/material.dart';
import 'package:hello_world/utils/app_size.dart';
import 'package:hello_world/widgets/course_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(title: Text("Practice")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                "Course Categories",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text("What do you want to learn"),
            ),

            Padding(
              padding: EdgeInsets.all(AppSize.screenPadding),
              child: SizedBox(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Chip(label: Text("Web development")),
                      SizedBox(width: AppSize.sizedBoxGap),
                      Chip(label: Text("Designing")),
                      SizedBox(width: AppSize.sizedBoxGap),
                      Chip(label: Text("Data Science")),
                      SizedBox(width: AppSize.sizedBoxGap),
                      Chip(label: Text("Backend Developments")),
                    ],
                  ),
                ),
              ),
            ),
            CourseCard(
              image:
                  "https://codeit.com.np/storage/course-featured/01KN8VNVH5HQPA553ATRK8SQQH.webp",
              courseTitle: "Power BI trainig",
              courseDesc:
                  "Build industry-ready dashboards and analytical skills employers value",
            ),
            CourseCard(
              image:
                  "https://codeit.com.np/storage/course-featured/01KN8W36182PSSY09GPKYQ6N6H.webp",
              courseTitle: "React with Next Js",
              courseDesc:
                  "React with Next.js Course – Build Fast, SEO-Friendly Web Apps with Modern JavaScript",
            ),
            CourseCard(
              image:
                  "https://codeit.com.np/storage/course-featured/01KN8W36182PSSY09GPKYQ6N6H.webp",
              courseTitle: "React with Next Js",
              courseDesc:
                  "React with Next.js Course – Build Fast, SEO-Friendly Web Apps with Modern JavaScript",
            ),
          ],
        ),
      ),
    );
  }
}
