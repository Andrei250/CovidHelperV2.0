import 'package:covidhelper_v2/pages/vendor/vendor_stock/vendor_add_product_card.dart';
import 'package:covidhelper_v2/pages/volunteer/home_volunteer/fav_person_card.dart';
import 'package:covidhelper_v2/pages/vendor/vendor_produtcs.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as slideDialog;
import 'package:covidhelper_v2/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:covidhelper_v2/pages/vendor/vendor_back.dart';

class VendorAddProducts extends StatefulWidget {
//
//  Volunteer volunteer;
//
//
//  VendorAddProducts({ this.volunteer });

  @override
  _VendorAddProductsState createState() => _VendorAddProductsState();
}

class _VendorAddProductsState extends State<VendorAddProducts> {
  int _currentIndex = 0;
  PageController _pageController;

  final VendorBack vend = VendorBack();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String getInitials(String name) {
      name = name.trim();
      String initials = name[0];
      int i = 0;
      for (int i = 1; i < name.length; i++) {
        if (name[i - 1] == ' ' && name[i] != ' ') {
          initials += name[i];
        }
      }
      return initials.toUpperCase();
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
//        theme: AppTheme.darkTheme,
        home: Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.white,
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 55.0, 5.0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Actualizeaza stocul magazinului:',
                          style: eTitle,
                        ),
                        IconButton(
                            icon: new Icon(
                              Icons.info_outline,
                              color: Colors.grey[600],
                              size: 30,
                            ),
                            onPressed: (){
                              _showInstructions();
                            }
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child:
                      ListView(scrollDirection: Axis.vertical, children: [
                        VendorAddProductCard(name: 'Apa', category: 'Generale', categoryDoc: 'Produse alimentare'),
                        VendorAddProductCard(name: 'Apa minerala', category: 'Generale', categoryDoc: 'Produse alimentare'),
                        VendorAddProductCard(name: 'Lapte', category: 'Lactate', categoryDoc: 'Produse alimentare'),
                        VendorAddProductCard(name: 'Iaurt', category: 'Lactate', categoryDoc: 'Produse alimentare'),
                        VendorAddProductCard(name: 'Iarut de baut', category: 'Lactate', categoryDoc: 'Produse alimentare'),
                        VendorAddProductCard(name: 'Cascaval', category: 'Lactate', categoryDoc: 'Produse alimentare'),
                        VendorAddProductCard(name: 'Branza', category: 'Lactate', categoryDoc: 'Produse alimentare'),
                        VendorAddProductCard(name: 'Salam', category: 'Carne', categoryDoc: 'Produse alimentare'),
                        VendorAddProductCard(name: 'Sunca presata', category: 'Carne', categoryDoc: 'Produse alimentare'),
                        VendorAddProductCard(name: 'Carnati', category: 'Carne', categoryDoc: 'Produse alimentare'),
                        VendorAddProductCard(name: 'Rosii', category: 'Legume', categoryDoc: 'Produse alimentare'),
                        VendorAddProductCard(name: 'Castraveti', category: 'Legume', categoryDoc: 'Produse alimentare'),
                        VendorAddProductCard(name: 'Cartofi', category: 'Legume', categoryDoc: 'Produse alimentare'),
                        VendorAddProductCard(name: 'Ceapa', category: 'Legume', categoryDoc: 'Produse alimentare'),
                        VendorAddProductCard(name: 'Usturoi', category: 'Legume', categoryDoc: 'Produse alimentare'),
                        VendorAddProductCard(name: 'Fasole', category: 'Legume', categoryDoc: 'Produse alimentare'),
                        VendorAddProductCard(name: 'Mazare', category: 'Legume', categoryDoc: 'Produse alimentare'),
                        VendorAddProductCard(name: 'Banane', category: 'Fructe', categoryDoc: 'Produse alimentare'),
                        VendorAddProductCard(name: 'Portocale', category: 'Fructe', categoryDoc: 'Produse alimentare'),
                        VendorAddProductCard(name: 'Mere', category: 'Fructe', categoryDoc: 'Produse alimentare'),
                        VendorAddProductCard(name: 'Faina Alba', category: 'Generale', categoryDoc: 'Produse alimentare'),
                        VendorAddProductCard(name: 'Malai', category: 'Generale', categoryDoc: 'Produse alimentare'),
                        VendorAddProductCard(name: 'Drojdie', category: 'Generale', categoryDoc: 'Produse alimentare'),
                        VendorAddProductCard(name: 'Oua', category: 'Generale', categoryDoc: 'Produse alimentare'),
                        VendorAddProductCard(name: 'Paine', category: 'Generale', categoryDoc: 'Produse alimentare'),
                        VendorAddProductCard(name: 'Carne de porc', category: 'Carne', categoryDoc: 'Produse alimentare'),
                        VendorAddProductCard(name: 'Carne de vita', category: 'Carne', categoryDoc: 'Produse alimentare'),
                        VendorAddProductCard(name: 'Carne de pui', category: 'Carne', categoryDoc: 'Produse alimentare'),
                        VendorAddProductCard(name: 'Carne tocata', category: 'Carne', categoryDoc: 'Produse alimentare'),
                        VendorAddProductCard(name: 'Conserva de peste', category: 'Carne', categoryDoc: 'Produse alimentare'),
                        VendorAddProductCard(name: 'Ciocolata', category: 'Dulciuri', categoryDoc: 'Produse alimentare'),
                        VendorAddProductCard(name: 'Napolitane', category: 'Dulciuri', categoryDoc: 'Produse alimentare'),
                        VendorAddProductCard(name: 'Servetele nazale', category: 'Ingrijire Personala', categoryDoc: 'Produse de ingrijire si curatenie'),
                        VendorAddProductCard(name: 'Rola de servetele', category: 'Curatenie', categoryDoc: 'Produse de ingrijire si curatenie'),
                        VendorAddProductCard(name: 'Servetele umede', category: 'Curatenie', categoryDoc: 'Produse de ingrijire si curatenie'),
                        VendorAddProductCard(name: 'Hartie igienica', category: 'Ingrijire Personala', categoryDoc: 'Produse de ingrijire si curatenie'),
                        VendorAddProductCard(name: 'Absorbante', category: 'Ingrijire Personala', categoryDoc: 'Produse de ingrijire si curatenie'),
                        VendorAddProductCard(name: 'Spirt', category: 'Curatenie', categoryDoc: 'Produse de ingrijire si curatenie'),
                        VendorAddProductCard(name: 'Pasta de dinti', category: 'Ingrijire Personala', categoryDoc: 'Produse de ingrijire si curatenie'),
                        VendorAddProductCard(name: 'Periuta de dinti', category: 'Ingrijire Personala', categoryDoc: 'Produse de ingrijire si curatenie'),
                        VendorAddProductCard(name: 'Sapun', category: 'Ingrijire Personala', categoryDoc: 'Produse de ingrijire si curatenie'),
                        VendorAddProductCard(name: 'Sampon', category: 'Ingrijire Personala', categoryDoc: 'Produse de ingrijire si curatenie'),
                      ])),
                ])));
  }

  void _showInstructions() {
    slideDialog.showSlideDialog(
      context: context,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                  child: Icon(
                    Icons.info_outline,
                    color: AppTheme.lightAccent,
                    size: 50,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Instructiuni:',
                    style: eTitle,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(25.0, 15.0, 10.0, 5.0),
                  child: Text(
                    '1.Mai jos aveti o lista cu toate produsele ce pot fi inregistrate in aplicatia noastra',
                    style: eWelcome,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(25.0, 0.0, 10.0, 5.0),
                    child: Text(
                      '2.Pentru a aduaga cantitate disponibila inserati in campurile corespunzatoare fiecarui produs pretul si cantitatea pe care o aveti',
                      style: eWelcome,
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(25.0, 0.0, 10.0, 5.0),
                    child: Text(
                      '3.Apasati pe butonul "Actualizeaza" din dreapta fiecarui produs si produsul dumneavoastra va fi actualizat imediat',
                      style: eWelcome,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
