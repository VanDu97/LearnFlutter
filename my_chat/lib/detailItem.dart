import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SABT extends StatefulWidget {
  final Widget child;
  const SABT({
    Key key,
    @required this.child,
  }) : super(key: key);
  @override
  _SABTState createState() {
    return new _SABTState();
  }
}

class _SABTState extends State<SABT> {
  ScrollPosition _position;
  bool _visible;
  @override
  void dispose() {
    _removeListener();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _removeListener();
    _addListener();
  }

  void _addListener() {
    _position = Scrollable.of(context)?.position;
    _position?.addListener(_positionListener);
    _positionListener();
  }

  void _removeListener() {
    _position?.removeListener(_positionListener);
  }

  void _positionListener() {
    final FlexibleSpaceBarSettings settings =
        context.inheritFromWidgetOfExactType(FlexibleSpaceBarSettings);
    bool visible =
        settings == null || settings.currentExtent <= settings.minExtent;
    if (_visible != visible) {
      setState(() {
        _visible = visible;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _visible,
      child: widget.child,
    );
  }
}

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
            primary: true,
            iconTheme: IconThemeData(color: Colors.black),
            title: SABT(
                child: Text('Really Cool Burgers',
                    style: TextStyle(color: Colors.black))),
            backgroundColor: Colors.white,
            brightness: Brightness.light,
            expandedHeight: MediaQuery.of(context).size.height * 0.25,
            flexibleSpace: FlexibleSpaceBar(
              // title: Text('Buy Nothing Day',
              //     style: TextStyle(color: Colors.black)),
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
