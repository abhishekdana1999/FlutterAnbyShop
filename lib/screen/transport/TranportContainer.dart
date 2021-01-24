import 'package:anbyshop/util/colors.dart';
import 'package:anbyshop/util/inputWithIcon.dart';
import 'package:anbyshop/util/size_config.dart';
import 'package:anbyshop/widgets/Gap/anbyGap.dart';
import 'package:flutter/material.dart';

import 'package:mapbox_search_flutter/mapbox_search_flutter.dart';

class TranportContainer extends StatelessWidget {
  const TranportContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _startPointController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 16),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MapBoxPlaceSearchWidget(
                popOnSelect: false,
                country: "INDIA",
                apiKey:
                    "pk.eyJ1IjoibWFwbGVob21lIiwiYSI6ImNrazlybjA2NjBmcnMyd3BiaHM5YnpqM2MifQ.5CKVlbk3wtg-shMpxfQiHg",
                searchHint: 'Pickup Location',
                onSelected: (place) {
                  debugPrint(place.toString());
                },
                context: context,
              ),
              AnbyGap(
                color: Colors.transparent,
              ),
              CustomInputWithIcon(
                controller: null,
                disable: false,
                fontSize: AnbySize.baseFontSize,
                hint: "Destination",
                icon: Icons.pin_drop,
                isPassword: false,
                maxLength: null,
                suffix: null,
                type: null,
              ),
            ],
          ),
        ),
        Container(
            height: MediaQuery.of(context).size.height / 6,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: AnbyColors.PrimaryColor)),
      ]),
    );
  }
}
