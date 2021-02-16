import 'package:flutter/material.dart';
import 'package:lipsum/lipsum.dart' as lipsum;
import 'package:ola_energy/widgets/listItem.dart';

class NewsDetails extends StatelessWidget {
  final String tag;
  final ListItem item;

  NewsDetails({Key key, @required this.item, @required this.tag}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('News Reports'),
          backgroundColor: Color(0xff07239d),
          leading: IconButton(icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
            onPressed: (){
              Navigator.pop(context);
            },),
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Hero(
                    tag: '${item.newsTile}',
                      child: Image.asset(item.imgUrl)
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        Text(
                          item.newsTile,
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w700,
                            ),
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: [
                            Icon(Icons.person),
                            Text(item.reporter,
                              style: TextStyle(
                                  fontSize: 18.0,
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Icon(Icons.date_range),
                            Text(item.date,
                              style: TextStyle(
                                  fontSize: 18.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          lipsum.createParagraph(numParagraphs: 3),
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
