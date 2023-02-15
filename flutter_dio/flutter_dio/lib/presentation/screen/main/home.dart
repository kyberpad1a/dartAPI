import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

int currentIndex =0;
 @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text('Финансы'),
        actions: [
          IconButton(onPressed: (){
            showSearch(context: context, delegate: CustomSearchDelegate());
          }, icon: const Icon(Icons.search),)
        ],
      ),
      floatingActionButton: currentIndex == 0 
      ? FloatingActionButton(
      : null,
      bottom
      
      body: listPage[currentIndex],
    );
  }
}