import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/models/recipe.dart';

import '../../models/recipe.dart';

class DetailScreen extends StatefulWidget {
  final Recipe _model;

  DetailScreen(this._model);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details')),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: widget._model.image,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: widget._model.cookDetails.length,
                  itemBuilder: (c, i) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Step' + (i + 1).toString(),
                            style: _getTextStyle(fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(widget._model.cookDetails[i],
                                style: _getTextStyle()),
                          ),
                        ],
                      )),
            ),
            BackButton(
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _getTextStyle({FontWeight? fontWeight}) {
    return TextStyle(
        fontSize: 16.0,
        color: Colors.black,
        fontWeight: fontWeight ?? FontWeight.normal);
  }
}
