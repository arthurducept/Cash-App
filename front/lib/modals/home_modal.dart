import 'package:flutter/material.dart';
import 'package:front/components/underline_widget.dart';
import 'package:front/style/themes.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeModal extends StatefulWidget {
  const HomeModal({Key? key, this.body}) : super(key: key);

  final Widget? body;

  @override
  State<HomeModal> createState() => _HomeModalState();
}
class _HomeModalState extends State<HomeModal> with TickerProviderStateMixin {

  double _panelOffset = 0.0;
  late final TabController _tabController;
  int _selectedTab = 0;
  final PanelController _panelController = PanelController();

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  double _getAnimatedHeight() {
    if(_panelOffset >= 0.5) return 1;
    return _panelOffset*2;
  }

  double _getAnimatedOpacity() {
    if(_panelOffset <= 0.5) return 0;
    return (_panelOffset-0.5)*2;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if(_panelController.isPanelOpen) {
          _panelController.close();
          return false;
        }
        return true;
      },
      child: SlidingUpPanel(
        controller: _panelController,
        minHeight: MediaQuery.of(context).size.height-480,
        maxHeight: MediaQuery.of(context).size.height,
        borderRadius: BorderRadius.vertical(top: Radius.circular((1-_panelOffset)*20)),
        color: Colors.transparent,
        onPanelSlide: (offset) => setState(() {
          _panelOffset = offset;
        }),
        panel: ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular((1 - _panelOffset) * 20),
          ),
          child: Container(
            padding: EdgeInsets.only(
              top: _panelOffset * MediaQuery.of(context).padding.top,
            ),
            color: MyDarkTheme.card,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    if(_panelController.isPanelOpen) {
                      _panelController.close();
                    } else {
                      _panelController.open();
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 50,
                      height: 8.0,
                      decoration: BoxDecoration(
                        color: MyDarkTheme.chip,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                ClipRect(
                  child: SizedBox(
                    height: _getAnimatedHeight() * 120,
                    child: Opacity(
                      opacity: _getAnimatedOpacity(),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 32, bottom: 10),
                              child: InkWell(
                                onTap: () => _panelController.close(),
                                child: const Text("Fermer", style: MyDarkTheme.textLink,),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: MyDarkTheme.chip,
                            ),
                            child: TabBar(
                              controller: _tabController,
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: MyDarkTheme.card,
                              ),
                              onTap: (tab) => setState(() {
                                _selectedTab = tab;
                              }),
                              tabs: const [
                                Tab(text: "Semaine"),
                                Tab(text: "Mois"),
                                Tab(text: "3 Mois"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Hier", style: MyDarkTheme.appBarTitle,),
                      UnderlineWidget(textLength: "hier".length,),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 32),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 50,
                      itemBuilder: (context, index) {
                        return ListTile(
                          contentPadding: const EdgeInsets.all(0.0),
                          leading: const SizedBox.square(
                            dimension: 56,
                            child: Center(
                              child: Icon(Icons.attach_money, color: MyDarkTheme.primaryText, size: 64),
                            ),
                          ),
                          title: const Text('Salaire', style: MyDarkTheme.listTitle,),
                          subtitle: const Text("Mar. 1 Mars à 12:46", style: MyDarkTheme.listSubtitle,),
                          trailing: Text("+ 1000.77 €", style: MyDarkTheme.listAction.copyWith(color: MyDarkTheme.success),),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: widget.body,
      ),
    );
  }
}