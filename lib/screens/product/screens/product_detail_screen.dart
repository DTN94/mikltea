import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:mikltea/constants/api_constant.dart';
import 'package:mikltea/models/api_product_model.dart';

import '../../../models/product_model.dart';

class ProductDetail extends StatefulWidget {
  final int? item;

  const ProductDetail({Key? key, required this.item}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail>
    with TickerProviderStateMixin {
  late TabController tabController;
  int _counter = 0;
  final int _counterStar = 1;
  late Future<List<ApiProduct>> _productDetail;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _incrementCounterMinus() {
    if (_counter > _counterStar) {
      setState(() {
        _counter--;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    _productDetail = ApiConstants.getProductDetail(widget.item!);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var infoProduct = _productDetail;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 50,
        iconTheme: const IconThemeData(
          color: Colors.black, // <-- SEE HERE
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: FutureBuilder<List<ApiProduct>>(
          future: infoProduct,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  GFCarousel(
                    items: snapshot.data![index].images.map(
                          (url) {
                        return Container(
                          margin: const EdgeInsets.all(0),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(0)),
                            child: Image.asset("assets/images/${url!}", fit: BoxFit.cover, width: 1000.0),
                          ),
                        );
                      },
                    ).toList(),
                    viewportFraction: 1.0,
                  ),
                ],
              )
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
