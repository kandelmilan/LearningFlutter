import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hello_world/utils/app_size.dart';
import 'package:hello_world/views/home/screen/components/SubjectChip.dart';
import 'package:hello_world/views/home/screen/components/stat_card_section.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppSize.screenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// TOP USER SECTION
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage("images/pr.png"),
                    ),

                    Gap(AppSize.hGap),

                    /// USER INFO
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Hi, Sabin 👋",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 4),

                          Text(
                            "Preparing for: Medical Entrance Exam",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),

                    /// NOTIFICATION
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications_none_rounded),
                    ),
                  ],
                ),

                Gap(AppSize.vGap),

                /// SUBJECT CHIPS
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: const [
                    SubjectChip(subject: "Math"),
                    SubjectChip(subject: "Physics"),
                    SubjectChip(subject: "Chemistry"),
                    SubjectChip(subject: "Biology"),
                  ],
                ),
                Row(children: [StatCardSection()]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
