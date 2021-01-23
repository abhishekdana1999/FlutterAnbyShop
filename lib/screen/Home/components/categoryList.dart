import 'dart:convert';

import 'package:anbyshop/util/colors.dart';
import 'package:anbyshop/util/font_family.dart';
import 'package:anbyshop/util/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart' as Http;

class CategoryList extends StatefulWidget {
  CategoryList({Key key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final http = Http.Client();

  @override
  Widget build(BuildContext context) {
    var items = [];
    bool isLoading = false;
    _getCateoryList() async {
      isLoading = true;
      var response = await http.get(
          "https://api.soft-impressions.com/category?size=12&currentPage=1",
          headers: null);

      if (response.statusCode == 200) {
        isLoading = false;
        var parsed = jsonDecode(response.body);
        return items = parsed["docs"];
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          height: 300,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: FutureBuilder(
              future: _getCateoryList(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return AlignedGrid(
                    items: items,
                  );
                }

                if (snapshot.hasError) {
                  Get.snackbar("Error", snapshot.error);
                }

                return Container(
                    height: 200,
                    width: 200,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator());
              }),
        ),
      ],
    );
  }
}

class AlignedGrid extends StatelessWidget {
  List items;
  final double runSpacing = 4;
  final double spacing = 4;
  final int listSize = 15;
  final columns = 4;

  AlignedGrid({this.items});
  @override
  Widget build(BuildContext context) {
    final w = (MediaQuery.of(context).size.width - runSpacing * (columns - 1)) /
        columns;
    return SingleChildScrollView(
        child: GridView.count(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      crossAxisCount: 4,
      childAspectRatio: 1.0,
      mainAxisSpacing: 0.0,
      crossAxisSpacing: 0.0,
      children: List.generate(
          items.length,
          (index) => Material(
                color: Colors.white,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.grey[100], width: 0.5)),
                    child: Center(
                        child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.network(
                            items[index]["lowResolutionImage"][0]["url"],
                            height: 40,
                            width: 40,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            items[index]["name"],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: AnbySize.baseFontSize * 1.3,
                                color: Colors.black,
                                fontFamily: AnbyfontFamily.anbyFontRegular),
                          )
                        ],
                      ),
                    )),
                  ),
                ),
              )),
    ));
  }
}
