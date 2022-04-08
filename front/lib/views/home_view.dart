import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:front/components/bottom_bar.dart';
import 'package:front/components/buttons/circle_icon_button.dart';
import 'package:front/components/home_widgets.dart';
import 'package:front/components/underline_widget.dart';
import 'package:front/modals/home_modal.dart';
import 'package:front/modals/transaction_modal.dart';
import 'package:front/style/themes.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey _homeModalSpaceKey = GlobalKey();

  double _homeModalBaseHeight() {
    try {
      final RenderBox space =
          _homeModalSpaceKey.currentContext?.findRenderObject() as RenderBox;
      return space.size.height;
    } catch (e) {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    double modalMinHeight = _homeModalBaseHeight();
    if (modalMinHeight == 0) {
      WidgetsBinding.instance
          ?.addPostFrameCallback((timeStamp) => setState(() {}));
    }
    return GestureDetector(
      onTap: () {
        var currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(0.0),
                            onTap: () {},
                            leading: SizedBox.square(
                              dimension: kToolbarHeight,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Container(
                                  color: MyDarkTheme.primaryText,
                                ),
                              ),
                            ),
                            title: const Text("Bonjour Rémi",
                                style: MyDarkTheme.appBarTitle),
                            subtitle: const Text(
                              "Heureux de vous revoir !",
                              style: MyDarkTheme.appBarSubtitle,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: CircleIconButton(
                            color: MyDarkTheme.buttonBackground,
                            onTap: () => _showModal(),
                            child: const Icon(
                              Icons.add,
                              color: MyDarkTheme.primaryText,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    height: 43,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                          color: MyDarkTheme.secondaryText, width: 1.0),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.search,
                            color: MyDarkTheme.secondaryText, size: 30),
                        SizedBox(
                          width: 5.0,
                        ),
                        Expanded(
                          child: TextField(
                            style: MyDarkTheme.inputText,
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 13.0),
                              border: InputBorder.none,
                              hintText: "Rechercher",
                              hintStyle: MyDarkTheme.inputHint,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Transactions à venir",
                          style: MyDarkTheme.appBarTitle,
                        ),
                        UnderlineWidget(
                          textLength: "Transactions".length,
                          size: 9,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: SizedBox(
                      height: 80,
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: const [
                          HorizontalTransactionItem(
                            leading: Icon(
                              Icons.attach_money,
                              size: 50,
                              color: MyDarkTheme.primaryText,
                            ),
                            title: "Salaire Piwigo",
                            subtitle: "Mar. 1 Mars à 12:46",
                            secondarySubtitle: "Salaire",
                            amount: 1094.80,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          HorizontalTransactionItem(
                            leading: Icon(
                              Icons.attach_money,
                              size: 50,
                              color: MyDarkTheme.primaryText,
                            ),
                            title: "Loyer",
                            subtitle: "Jeu. 3 Mars à 9:30",
                            secondarySubtitle: "Loyer",
                            amount: -400.00,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          HorizontalTransactionItem(
                            leading: Icon(
                              Icons.attach_money,
                              size: 50,
                              color: MyDarkTheme.primaryText,
                            ),
                            title: "Orange Open Fibre",
                            subtitle: "Mar. 15 Mars à 7:05",
                            secondarySubtitle: "Internet",
                            amount: -29.99,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: HomeCard(
                            title: "Solde",
                            amount: 1304.37,
                            onTap: () {},
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: HomeCard(
                            title: "Epargne",
                            amount: 1304.37,
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox.expand(
                        key: _homeModalSpaceKey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            HomeModal(
              minHeight: modalMinHeight,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    height: 84,
                    decoration: BoxDecoration(
                      color: MyDarkTheme.bottomNavigationBar.withOpacity(0.6),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 10.0,
                        sigmaY: 10.0,
                        tileMode: TileMode.clamp,
                      ),
                      child: Row(
                        children: const [
                          BottomBarItem(
                            icon: Icons.dashboard,
                            title: "Dashboard",
                          ),
                          BottomBarItem(
                            icon: Icons.gamepad,
                            title: "Mon épargne",
                          ),
                          BottomBarItem(
                            icon: Icons.settings,
                            title: "Récurrences",
                          ),
                          BottomBarItem(
                            icon: Icons.person_outline,
                            title: "Mon compte",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (buildContext) {
        return TransactionModal(
          context: context,
        );
      },
    );
  }
}
