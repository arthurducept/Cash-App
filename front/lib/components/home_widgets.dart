import 'package:flutter/material.dart';
import 'package:front/components/underline_widget.dart';
import 'package:front/style/themes.dart';

import 'buttons/circle_icon_button.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({Key? key, this.title = '', this.amount, this.onTap
  }) : super(key: key);

  final String title;
  final double? amount;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: MyDarkTheme.card,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: MyDarkTheme.appBarTitle,),
                  UnderlineWidget(textLength: title.length,),
                ],
              ),
              CircleIconButton(
                color: MyDarkTheme.buttonBackground,
                onTap: onTap,
                child: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Text('${amount ?? 0} €', style: MyDarkTheme.cardAmount,
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}

class HorizontalTransactionItem extends StatelessWidget {
  const HorizontalTransactionItem({Key? key, this.leading, this.title,
    this.subtitle, this.secondarySubtitle, this.amount}) : super(key: key);

  final Widget? leading;
  final String? title;
  final String? subtitle;
  final String? secondarySubtitle;
  final double? amount;

  String _getAmountText() {
    if(amount == null || amount == 0) return '0 €';
    return '${amount!.isNegative ? '-' : '+'} ${amount!.abs()} €';
  }

  TextStyle _getAmountStyle() {
    if(amount == null || amount!.isNegative) return MyDarkTheme.listTitle;
    return MyDarkTheme.listAction.copyWith(color: MyDarkTheme.success);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: MyDarkTheme.card,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            child: leading,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(title ?? '', style: MyDarkTheme.listTitle,
                          overflow: TextOverflow.clip,
                          softWrap: true,
                          maxLines: 2,
                        ),
                      ),
                      Text(_getAmountText(), style: _getAmountStyle()),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(subtitle ?? '', style: MyDarkTheme.listSubtitle,
                          overflow: TextOverflow.clip,
                          softWrap: true,
                          maxLines: 2,
                        ),
                      ),
                      Text(secondarySubtitle ?? '', style: MyDarkTheme.listSubtitle,),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}