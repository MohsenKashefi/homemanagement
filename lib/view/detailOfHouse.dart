import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';



class DetailPage extends StatelessWidget {
  final int itemIndex;

  DetailPage({required this.itemIndex});

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://www.apartments.com/blog/sites/default/files/styles/x_large_hq/public/image/2023-06/ParkLine-apartment-in-Miami-FL.jpg?itok=kQmw64UU',
       'https://www.apartments.com/blog/sites/default/files/styles/x_large_hq/public/image/2023-06/ParkLine-apartment-in-Miami-FL.jpg?itok=kQmw64UU',
      'https://www.apartments.com/blog/sites/default/files/styles/x_large_hq/public/image/2023-06/ParkLine-apartment-in-Miami-FL.jpg?itok=kQmw64UU',
    ];

    return Scaffold(
      appBar: AppBar(
       
        title: Text('Item $itemIndex Details'),
         backgroundColor: Colors.purple[100],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 400.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16/9,
                  autoPlayInterval: Duration(seconds: 3),
                ),
                items: imgList.map((item) => Container(
                  child: Center(
                    child: Image.network(item, fit: BoxFit.cover, width: 1000)
                  ),
                )).toList(),
              ),
              SizedBox(height: 16),
              Text(
                'Item $itemIndex',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'This is a detailed description for item $itemIndex. '
                'This section provides comprehensive information about the item, '
                'including its features, benefits, and other relevant details. '
                'It aims to give the user a thorough understanding of the item, '
                'making it easier to decide whether to rent it or not. '
                'It also includes various amenities, location advantages, '
                'and any other important information that might be useful for the user.',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}