import 'package:flutter/material.dart';
import 'package:maham_website/dio_helper.dart';
import 'package:maham_website/widgets/master_layout.dart';

class Cartel extends StatelessWidget {
    final String language;

  const Cartel({super.key, required this.language});

  Future<List<dynamic>> _fetchPosts() async {
    final response = await DioHelper.getData(url: 'posts');
    return response.data;
  }
  
  @override
  Widget build(BuildContext context) {
    return MasterLayout(
      child: Scaffold(
        appBar: AppBar(title: Text(language == 'ar' ? 'كارتل' : 'Cartel')),
        body: FutureBuilder<List<dynamic>>(
          future: _fetchPosts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
      
            if (snapshot.hasError) {
              return Center(
                child: Text(language == 'ar'
                    ? 'حدث خطأ أثناء تحميل البيانات'
                    : 'Error loading data'),
              );
            }
      
            final List posts = snapshot.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(posts[index]['title']),
                subtitle: Text(posts[index]['body']),
              ),
            );
          },
        ),
      ),

    );
  }
}