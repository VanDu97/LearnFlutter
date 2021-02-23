import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailItem extends StatefulWidget {
  @override
  _DetailItem createState() => _DetailItem();
}

class _DetailItem extends State<DetailItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            iconTheme: IconThemeData(color: Colors.black),
            expandedHeight: MediaQuery.of(context).size.height * 0.25,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Demo'),
              background: Image.asset('lib/assets/the-ultimate-hamburger.jpg',
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * 0.25),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 100.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: Text('List Item $index'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/**
 * 
 * appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black), change icon back
            brightness: Brightness.light, change themes statusbar 
            backgroundColor: Colors.white, change backgroundColor
            title: Text('Buy Nothing Day',
                style: TextStyle(fontSize: 22, color: Colors.black)))
 */
