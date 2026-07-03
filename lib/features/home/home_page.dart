import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:swift_mart/core/presentation/widgets/smart_search_bar.dart';
import 'package:swift_mart/core/theme/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsetsDirectional.symmetric(horizontal: 16),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            //
          },
          icon: HugeIcon(
            icon: HugeIcons.strokeRoundedMoreHorizontalCircle01,
            size: 24,
            strokeWidth: 1.5,
            color: AppColors.textPrimary,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              //
            },
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedChatNotification,
              color: AppColors.textPrimary,
              strokeWidth: 1.5,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*CustomSearchBar(
                  controller: _searchController,
                  onSearchChanged: (value) {
                    //
                  },
                ),*/
                SmartSearchBar(),
                SizedBox(height: 32),
                Column(
                  spacing: 12,
                  children: [
                    Align(
                      alignment: AlignmentGeometry.centerLeft,
                      child: Text('Promotion'),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.blue,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: EdgeInsetsGeometry.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Get 50% off your first order'),
                            SizedBox(height: 12),
                            Text(
                              'Don’t miss this one time deal - grab your favourites now!',
                            ),
                            SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: () {
                                //
                              },
                              child: Text('Shop Now'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
