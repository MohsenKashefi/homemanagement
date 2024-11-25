import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:homemanagement/view/detailOfHouse.dart';




class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<int> _items = List.generate(20, (index) => index);
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        _loadMoreItems();
      }
    });
  }

  void _loadMoreItems() {
    setState(() {
      _items.addAll(List.generate(20, (index) => _items.length + index));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Infinite List View'),
        backgroundColor: Colors.purple[100],
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(itemIndex: _items[index]),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(
                    color: Colors.purple.withOpacity(0.3),
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.purple.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              image: DecorationImage(
                                image: NetworkImage('https://www.apartments.com/blog/sites/default/files/styles/x_large_hq/public/image/2023-06/ParkLine-apartment-in-Miami-FL.jpg?itok=kQmw64UU'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Item ${_items[index]}',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  'This is a more detailed description for item ${_items[index]}. '
                                  'This text provides additional information about the item, '
                                  'such as its features, benefits, and other relevant details. '
                                  'This makes the list item more informative and engaging.',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}