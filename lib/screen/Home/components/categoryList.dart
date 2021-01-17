import 'dart:convert';

import 'package:anbyshop/util/colors.dart';
import 'package:anbyshop/util/size.dart';
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
      children: [
        Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(AnbySize.basePadding * 2),
            child: Text(
              "Categories",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: AnbySize.headingFontSize,
                  fontFamily: AnbyfontFamily.anbyFontMedium),
            )),
        SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: FutureBuilder(
                future: _getCateoryList(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.count(
                      crossAxisCount: 4,
                      childAspectRatio: 1.0,
                      padding: const EdgeInsets.all(4.0),
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 4.0,
                      children: List.generate(
                          items.length,
                          (index) => Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey[400], width: 0.5)),
                                child: Center(
                                    child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.network(
                                        items[index]["lowResolutionImage"][0]
                                            ["url"],
                                        height: 25,
                                        fit: BoxFit.cover,
                                      ),
                                      Text(
                                        items[index]["name"],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize:
                                                AnbySize.baseFontSize * 1.5,
                                            color: Colors.black,
                                            fontFamily:
                                                AnbyfontFamily.anbyFontMedium),
                                      )
                                    ],
                                  ),
                                )),
                              )),
                    );
                  }

                  if (snapshot.hasError) {
                    Get.snackbar("Error", snapshot.error);
                  }

                  return CircularProgressIndicator();
                }),
          ),
        ),
      ],
    );
  }
}
