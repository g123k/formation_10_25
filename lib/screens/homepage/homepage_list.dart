import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:off/model/product.dart';
import 'package:off/res/app_colors.dart';
import 'package:off/screens/homepage/homepage_notifier.dart';
import 'package:provider/provider.dart';

class HomepageList extends StatefulWidget {
  const HomepageList({super.key});

  @override
  State<HomepageList> createState() => _HomepageListState();
}

class _HomepageListState extends State<HomepageList> {
  Color color = Colors.red;
  double size = 100.0;

  @override
  Widget build(BuildContext context) {
    final List<Product> products = context.watch<HomepageNotifier>().products;

    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (BuildContext context, int position) {
        return _HomepageListItem(product: products[position]);
      },
    );
  }
}

class _HomepageListItem extends StatelessWidget {
  const _HomepageListItem({required this.product});

  final Product product;

  static const BorderRadius _borderRadius = BorderRadius.all(
    Radius.circular(8.0),
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsetsDirectional.symmetric(horizontal: 10.0, vertical: 6.0),
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: _borderRadius),
      child: InkWell(
        borderRadius: _borderRadius,
        onTap: () => context.push('/product'),
        child: ClipRRect(
          borderRadius: _borderRadius,
          child: Padding(
            padding: const EdgeInsetsDirectional.only(end: 8.0),
            child: Row(
              children: <Widget>[
                SizedBox.square(
                  dimension: 100.0,
                  child: Ink.image(
                    image: NetworkImage(product.picture ?? '-'),
                    width: 100.0,
                    height: 100.0,
                    fit: BoxFit.contain,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        product.name ?? '-',
                        style: TextStyle(
                          color: AppColors.blueDark,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        product.brands?.join(', ') ?? '-',
                        style: TextStyle(
                          color: AppColors.grey2,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                CircleAvatar(child: Icon(Icons.keyboard_arrow_right_rounded)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
