import 'package:covidhelper_v2/components/vendor/vendor_card.dart';
import 'package:covidhelper_v2/models/vendor.dart';
import 'package:covidhelper_v2/services/firestore_service.dart';
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class NeedHelp extends StatefulWidget {
  @override
  _NeedHelpState createState() => _NeedHelpState();
}

class _NeedHelpState extends State<NeedHelp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final vendors = Provider.of<List<Vendor>>(context);

    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
          Column(
            children: [
             Container(
               margin: EdgeInsets.only(bottom: 20),
               height: size.height * 0.2,
               child: Stack(
                 children: [
                   Container(
                     height: size.height * 0.2 - 27,
                     decoration: BoxDecoration(
                       color: AppTheme.lightAccent,
                       borderRadius: BorderRadius.only(
                         bottomLeft: Radius.circular(36),
                         bottomRight: Radius.circular(36),
                       ),
                     ),
                     child: Row(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Container(
                           child: RaisedButton.icon(
                               onPressed: () {},
                               icon: Icon(
                                   Icons.help,
                                   size: 30,
                               ),
                               label: Text(
                                   'Ajutor',
                                   style: TextStyle(
                                     fontSize: 20,
                                     fontFamily: 'quicksand',
                                   ),
                               ),
                               color: Colors.red[400],
                               padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                               shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                           ),
                         )
                       ],
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
                                 hintText: "Cauta magazin",
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
             SizedBox(
               height: size.height * 0.4,
               child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
                  itemCount: (vendors.length >= 4) ? 4 : vendors.length,
                  itemBuilder: (context, index) {
                    return VendorCard(vendor : vendors[index], size: size);
                  },
                ),
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
