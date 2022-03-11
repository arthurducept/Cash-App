import 'package:flutter/material.dart';
import 'package:front/components/buttons/circle_icon_button.dart';
import 'package:front/components/selectable_chip.dart';
import 'package:front/style/themes.dart';

class TransactionModal extends StatefulWidget {
  const TransactionModal({Key? key, this.context}) : super(key: key);

  final BuildContext? context;

  @override
  State<TransactionModal> createState() => _TransactionModalState();
}
class _TransactionModalState extends State<TransactionModal> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(widget.context ?? context).padding.top,
          right: 16, left: 16,
        ),
        color: MyDarkTheme.modalBackground,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {},
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
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Text("Annuler", style: MyDarkTheme.textLink,),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Nouv. Transaction", style: MyDarkTheme.title,),
                  CircleIconButton(
                    onTap: () {},
                    color: MyDarkTheme.buttonBackground,
                    child: const Icon(Icons.arrow_upward),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                padding: const EdgeInsets.only(left: 32),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: MyDarkTheme.card,
                ),
                child: Column(
                  children:  [
                    const TextField(
                      style: MyDarkTheme.inputText,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Intitulé",
                        hintStyle: MyDarkTheme.inputHint,
                      ),
                    ),
                    const Divider(
                      endIndent: 0,
                      height: 1.0,
                      thickness: 1.0,
                      color: MyDarkTheme.chip,
                    ),
                    const TextField(
                      style: MyDarkTheme.inputText,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Montant",
                        hintStyle: MyDarkTheme.inputHint,
                      ),
                    ),
                    const Divider(
                      endIndent: 0,
                      height: 1.0,
                      thickness: 1.0,
                      color: MyDarkTheme.chip,
                    ),
                    const TextField(
                      style: MyDarkTheme.inputText,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Commentaire",
                        hintStyle: MyDarkTheme.inputHint,
                      ),
                    ),
                    const Divider(
                      endIndent: 0,
                      height: 1.0,
                      thickness: 1.0,
                      color: MyDarkTheme.chip,
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 16.0),
                      height: 50,
                      child: Row(
                        children: [
                          const Expanded(
                            child: Text("Date", style: MyDarkTheme.inputText,),
                          ),
                          Container(
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: MyDarkTheme.chip,
                            ),
                            child: const Text("13 févr. 2022", style: MyDarkTheme.listTitle,),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      endIndent: 0,
                      height: 1.0,
                      thickness: 1.0,
                      color: MyDarkTheme.chip,
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 16.0),
                      height: 50,
                      child: Row(
                        children: [
                          const Expanded(
                            child: Text("Récurrence", style: MyDarkTheme.inputText,),
                          ),
                          Row(
                            children: const [
                              Text("Jamais", style: MyDarkTheme.appBarSubtitle,),
                              SizedBox(width: 5.0,),
                              Icon(Icons.chevron_right, color: MyDarkTheme.secondaryText,),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      endIndent: 0,
                      height: 1.0,
                      thickness: 1.0,
                      color: MyDarkTheme.chip,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 16, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Text("Tags", style: MyDarkTheme.inputText,),
                          ),
                          Wrap(
                            spacing: 5.0,
                            runSpacing: 5.0,
                            children: const [
                              SelectableChip(
                                title: "Ecole",
                              ),
                              SelectableChip(
                                title: "Sorties",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                padding: const EdgeInsets.only(left: 32),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: MyDarkTheme.card,
                ),
                child: Column(
                  children:  [
                    Container(
                      padding: const EdgeInsets.only(right: 16.0),
                      height: 50,
                      child: Row(
                        children: [
                          const Expanded(
                            child: Text("Dépense habituelle", style: MyDarkTheme.inputText,),
                          ),
                          Row(
                            children: const [
                              Text("", style: MyDarkTheme.appBarSubtitle,),
                              SizedBox(width: 5.0,),
                              Icon(Icons.chevron_right, color: MyDarkTheme.secondaryText,),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      endIndent: 0,
                      height: 1.0,
                      thickness: 1.0,
                      color: MyDarkTheme.chip,
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 16.0),
                      height: 50,
                      child: Row(
                        children: [
                          const Expanded(
                            child: Text("Pointer une récurrence", style: MyDarkTheme.inputText,),
                          ),
                          Row(
                            children: const [
                              Text("", style: MyDarkTheme.appBarSubtitle,),
                              SizedBox(width: 5.0,),
                              Icon(Icons.chevron_right, color: MyDarkTheme.secondaryText,),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
