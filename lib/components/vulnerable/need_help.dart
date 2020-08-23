import 'package:covidhelper_v2/components/vendor/vendor_card.dart';
import 'package:covidhelper_v2/components/vulnerable/help_person_card.dart';
import 'package:covidhelper_v2/models/vendor.dart';
import 'package:covidhelper_v2/pages/volunteer/home_volunteer/fav_person_card.dart';
import 'package:covidhelper_v2/services/firestore_service.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:covidhelper_v2/utils/pics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class NeedHelp extends StatefulWidget {
  @override
  _NeedHelpState createState() => _NeedHelpState();
}

class _NeedHelpState extends State<NeedHelp> {
  List<Vendor> vendors;

  @override
  void initState() {
    super.initState();
  }

  void getVendors() async {
    vendors = await Provider.of<List<Vendor>>(context);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    getVendors();

    List vendors_widgets = List.generate(0, (index) {
      return Container();
    });

    if (vendors != null) {
      vendors_widgets = List.generate(vendors.length <= 4 ? vendors.length : 4, (index) {
        return VendorCard(vendor: vendors[index], size:  size);
      });
    }

    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
          Column(
            children: [
             Container(
               margin: EdgeInsets.only(bottom: 20),
               height: 300,
               child: Stack(
                 children: [
                   Container(
                     height: 273,
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.only(
                         bottomLeft: Radius.circular(36),
                         bottomRight: Radius.circular(36),
                       ),
                     ),
                     child: Padding(
                       padding: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 15.0),
                       child: Column(
                         children: <Widget>[
                           ClipRRect(
                             borderRadius:
                             BorderRadius.vertical(top: Radius.circular(25.0)),
                             child: Container(
                               width: double.maxFinite,
                               height: 60.0,
                               color: AppTheme.lightAccent,
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: <Widget>[
                                   Padding(
                                     padding: const EdgeInsets.fromLTRB(
                                         15.0, 15.0, 10.0, 5.0),
                                     child: Text(
                                       'In caz ca ai nevoie urgenta de ceva, apasa butonul',
                                       style: eGrey,
                                       overflow: TextOverflow.ellipsis,
                                       maxLines: 3,
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                           ),
                           ClipRRect(
                             borderRadius: BorderRadius.vertical(
                                 bottom: Radius.circular(25.0)),
                             child: Container(
                               width: double.maxFinite,
                               height: 130.0,
                               color: Colors.grey[200],
                               child: HelpPersonCard(),
                             ),
                           ),
                         ],
                       ),
                     ),
                   ),

                   Positioned(
                     bottom: 0,
                     right: 0,
                     left: 0,
                     child: Container(
                       alignment: Alignment.center,
                       margin: EdgeInsets.symmetric(horizontal: 20),
                       padding: EdgeInsets.symmetric(horizontal: 20),
                       height: 54,
                       decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(20),
                         boxShadow: [
                           BoxShadow(
                             offset: Offset(0, 10),
                             blurRadius: 50,
                             color: Colors.grey.withOpacity(0.23),
                           )
                         ]
                       ),
                       child: Row(
                         children: [
                           Expanded(
                             child: TextField(
                               onChanged: (value) {},
                               decoration: InputDecoration(
                                 hintText: "Cauta produse",
                                 hintStyle: TextStyle(
                                     color: Colors.grey.withOpacity(0.5)
                                 ),
                                 enabledBorder: InputBorder.none,
                                 focusedBorder: InputBorder.none,
                               ),
                             ),
                           ),
                           SvgPicture.asset("assets/icons/search.svg"),
                         ],
                       ),
                     ),
                   ),
                 ],
               ),
             ),
             Row(
               children: [
                 Container(
                   height: 24,
                   child: Stack(
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(left:  20),
                         child: Text(
                           "Magazine recomandate",
                           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                         ),
                       ),

                     ],
                   ),
                 ),
                 Spacer(),
                 Padding(
                   padding: const EdgeInsets.only(right: 20.0),
                   child: FlatButton(
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(20),
                     ),
                     color: AppTheme.lightAccent,
                     onPressed: () {},
                     child: Text(
                       "More",
                       style: TextStyle(color: Colors.white),
                     ),
                   ),
                 )
               ],
             ),
             SizedBox(
               height: 20,
             ),

           ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (int i = 0; i < vendors_widgets.length; i += 2)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  vendors_widgets[i],
                  if (i + 1 < vendors_widgets.length)
                    vendors_widgets[i + 1],
                ],
              ),
          ],
        ),

      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
