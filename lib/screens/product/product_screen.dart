import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  static const double containerRadius = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (_, BoxConstraints boxConstraints) {
          final double imageHeight = boxConstraints.maxHeight * 0.3;

          return Stack(
            children: <Widget>[
              PositionedDirectional(
                top: 0.0,
                start: 0.0,
                end: 0.0,
                height: imageHeight,
                child: Image.network(
                  'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?q=80&w=1310&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  fit: BoxFit.cover,
                  cacheHeight:
                      (imageHeight * MediaQuery.devicePixelRatioOf(context))
                          .toInt(),
                ),
              ),
              PositionedDirectional(
                top: imageHeight - containerRadius,
                start: 0.0,
                end: 0.0,
                bottom: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(containerRadius),
                    ),
                  ),
                  padding: EdgeInsetsDirectional.only(
                    top: 30.0,
                    start: 20.0,
                    end: 20.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[Text('Petits pois'), Text('Cassegrain')],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
