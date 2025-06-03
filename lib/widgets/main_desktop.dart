import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maham_website/constants/colors.dart';
import 'package:maham_website/dio_helper.dart';
import 'package:maham_website/services/api_service.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({super.key});

  void getPosts() async {
    try {
      // هنا بنستدعي الدالة من ملف dio_helper.dart
      var response = await DioHelper.getData(url: 'posts');
      print(response.data); // دي هتطبع البيانات في الـ console
    } catch (e) {
      print('Error: $e');
    }
  }

  /// هنا بعمل function عشان أجيب البيانات من الـ API
  void _fetchAboutUs() async {
    final apiService = ApiService();
    final data = await apiService.getAboutUs();
    print('API Response: $data');
    // هنا ممكن تعرض البيانات في الـ UI بالطريقة اللي تحبها
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      height: screenHeight / 1.2,
      constraints: const BoxConstraints(minHeight: 350.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'main_title'.tr(),
                  maxLines: 3,
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.scaffoldBg,
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: 250.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                    ),
                    onPressed: () {
                      final lang = context.locale.languageCode;
                      context.go('/$lang/contact');
                    },
                    child: Text(
                      'get_in_touch'.tr(),
                      style: const TextStyle(color: CustomColor.whitePrimary),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: 250.0,
                  child: ElevatedButton(
                    onPressed: () {
                      getPosts();
                    },
                    child: Text('Get Posts (Test)'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: Image.asset('images/1.png', width: screenWidth / 2)),
        ],
      ),
    );
  }
}
