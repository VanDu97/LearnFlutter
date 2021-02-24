import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'itemhumberger.dart';
import 'burgers.dart';

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
  List<ItemHumberger> items = [
    ItemHumberger(name: 'American Beef Burgers', price: '\$16', id: '1'),
    ItemHumberger(
        name: 'Classic Cheese Burger Beef Burgers', price: '\$15', id: '2'),
    ItemHumberger(name: 'Fishman Beef Burgers', price: '\$10', id: '3'),
    ItemHumberger(
        name: 'American Beef Burgers and Burgers', price: '\$26', id: '4')
  ];
  List<Burgers> ListBurgers = [
    Burgers(
      name: 'Classic Cheese Burger Beef Burgers',
      price: '\$16',
      description: 'Angus, beef, cheese',
      bestSale: true,
    ),
    Burgers(
      name: 'Pork Burgers',
      price: '\$18',
      description: 'Angus, beef, cheese',
      bestSale: false,
    ),
    Burgers(
      name: 'Triple Double Burgers',
      price: '\$10.5',
      description: 'Angus, beef, cheese',
      bestSale: true,
    ),
    Burgers(
      name: 'Classic Cheese Burger Beef Burgers',
      price: '\$11.1',
      description: 'Angus, beef, cheese',
      bestSale: false,
    ),
    Burgers(
      name: 'Classic Cheese Burger Beef Burgers',
      price: '\$20',
      description: 'Angus, beef, cheese',
      bestSale: true,
    ),
    Burgers(
      name: 'Classic Cheese Burger Beef Burgers',
      price: '\$11.1',
      description: 'Angus, beef, cheese',
      bestSale: false,
    ),
    Burgers(
      name: 'Classic Cheese Burger Beef Burgers',
      price: '\$20',
      description: 'Angus, beef, cheese',
      bestSale: true,
    )
  ];
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
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                  // border: Border.all(width: 1, color: Colors.black),
                  borderRadius: BorderRadius.circular(6)),
              child: Padding(
                padding: EdgeInsets.all(6),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Really Cool Burgers",
                              style: TextStyle(
                                  color: Color.fromRGBO(241, 91, 92, 1),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          Icon(Icons.favorite_border,
                              color: Color.fromRGBO(241, 91, 92, 1))
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(2),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Color.fromRGBO(241, 91, 92, 1),
                            ),
                            Text('4.9',
                                style: TextStyle(
                                    color: Color.fromRGBO(241, 91, 92, 1))),
                            Text("(124 ratings) Burgers - Westerm Food!")
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.all(2),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.place,
                                color: Color.fromRGBO(241, 91, 92, 1)),
                            Expanded(
                              child: Text(
                                  "6th Floor, Ocean Park Building, 1 Đào Duy Anh, Phương Mai, Phương Mai, Đống Đa, Hà Nội"),
                            )
                          ],
                        )),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Row(
                        children: [
                          Text('Popular Choices',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20))
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(3),
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 20.0),
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: items.length,
                            shrinkWrap: true,
                            itemBuilder: (context, int index) {
                              return GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 40, 0),
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            child: Image.network(
                                                'https://source.unsplash.com/random',
                                                fit: BoxFit.fitWidth,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.15,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.3)),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 10, 10, 0),
                                          child: Text(items[index].name,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15)),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 5, 10, 0),
                                          child: Text(items[index].price,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ],
                                    ),
                                  ));
                            }),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(2),
                        child: Row(
                          children: [
                            Text('Burgers',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20))
                          ],
                        )),
                    Padding(
                      padding: EdgeInsets.all(2),
                      child: Column(
                          children: new List<Widget>.generate(
                              ListBurgers.length, (index) {
                        return Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          width: MediaQuery.of(context).size.width,

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.white),
                          //height: MediaQuery.of(context).size.height * 0.2,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(ListBurgers[index].name,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600)),
                                  Text(ListBurgers[index].price,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(ListBurgers[index].description,
                                      style:
                                          TextStyle(color: Colors.blueAccent)),
                                  ListBurgers[index].bestSale
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(Icons.star,
                                                color: Color.fromRGBO(
                                                    241, 91, 92, 1)),
                                            Text(
                                              'Popular',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      241, 91, 92, 1)),
                                            )
                                          ],
                                        )
                                      : Text(''),
                                ],
                              )
                            ],
                          ),
                        );
                      })),
                    ),
                  ],
                ),
              ),
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
