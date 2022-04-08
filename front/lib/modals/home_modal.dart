import 'package:flutter/material.dart';
import 'package:front/components/underline_widget.dart';
import 'package:front/style/themes.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeModal extends StatefulWidget {
  const HomeModal({Key? key, this.body, this.minHeight = 0.0})
      : super(key: key);

  final Widget? body;
  final double minHeight;

  @override
  State<HomeModal> createState() => _HomeModalState();
}

class _HomeModalState extends State<HomeModal> with TickerProviderStateMixin {
  late final Animation<double> _animation;
  late Tween<double> _tween;
  late final AnimationController _animationController;

  double _minHeight = 0.0;
  double _panelOffset = 0.0;
  late final TabController _tabController;
  int _selectedTab = 0;
  final PanelController _panelController = PanelController();

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _animationController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    )..addListener(() {
        _panelController.animatePanelToPosition(0);
      });
    _tween = Tween(begin: 0.0, end: _minHeight);
    _animation = _tween.animate(_animationController);
    super.initState();
  }

  double _getAnimatedHeight() {
    if (_panelOffset >= 0.5) return 1;
    return _panelOffset * 2;
  }

  double _getAnimatedOpacity() {
    if (_panelOffset <= 0.5) return 0;
    return (_panelOffset - 0.5) * 2;
  }

  _buildPanelMinHeight() {
    if (widget.minHeight != _minHeight) {
      WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
        _tween.begin = _tween.end;
        _tween.end = widget.minHeight;
        _animationController.forward();
        setState(() {
          _minHeight = widget.minHeight;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _buildPanelMinHeight();
    var screen = MediaQuery.of(context);
    return WillPopScope(
      onWillPop: () async {
        if (_panelController.isPanelOpen) {
          _panelController.close();
          return false;
        }
        return true;
      },
      child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, animation) {
            return SlidingUpPanel(
              controller: _panelController,
              minHeight: _animation.value,
              maxHeight: screen.size.height,
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular((1 - _panelOffset) * 20)),
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
                    top: _panelOffset * screen.padding.top,
                  ),
                  color: MyDarkTheme.card,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (_panelController.isPanelOpen) {
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
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 32, bottom: 10),
                                    child: InkWell(
                                      onTap: () => _panelController.close(),
                                      child: const Text(
                                        "Fermer",
                                        style: MyDarkTheme.textLink,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 10),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Hier",
                              style: MyDarkTheme.appBarTitle,
                            ),
                            UnderlineWidget(
                              textLength: "hier".length,
                            ),
                          ],
                        ),
                      ),
                      Builder(builder: (context) {
                        var listHeight = _animation.value -
                            80 +
                            _panelOffset *
                                (screen.size.height - 150 - _animation.value);
                        if (listHeight < 0) listHeight = 0;
                        return SizedBox(
                          height: listHeight,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(30)),
                              child: SingleChildScrollView(
                                padding: const EdgeInsets.only(
                                  left: 16,
                                  right: 32,
                                ),
                                physics: const BouncingScrollPhysics(),
                                child: ListView.builder(
                                  padding: const EdgeInsets.only(
                                    bottom: 100,
                                  ),
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: 50,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      contentPadding: const EdgeInsets.all(0.0),
                                      leading: const SizedBox.square(
                                        dimension: 56,
                                        child: Center(
                                          child: Icon(
                                            Icons.attach_money,
                                            color: MyDarkTheme.primaryText,
                                            size: 64,
                                          ),
                                        ),
                                      ),
                                      title: const Text(
                                        'Salaire',
                                        style: MyDarkTheme.listTitle,
                                      ),
                                      subtitle: const Text(
                                        "Mar. 1 Mars à 12:46",
                                        style: MyDarkTheme.listSubtitle,
                                      ),
                                      trailing: Text(
                                        "+ 1000.77 €",
                                        style: MyDarkTheme.listAction.copyWith(
                                            color: MyDarkTheme.success),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
              body: widget.body,
            );
          }),
    );
  }
}
