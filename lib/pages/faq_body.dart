import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:voting_dapp/models/faq_model.dart';
import 'package:voting_dapp/res/app_colors.dart';
import 'package:voting_dapp/res/style_text.dart';

List<FaqModel> generateItems() {
  List<FaqModel> faqs = [];

  faqs.add(FaqModel(
      headerName: "How to use Election सेतु?", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."));
  faqs.add(FaqModel(
      headerName: "How to create Election?", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"));
  faqs.add(FaqModel(
      headerName: "How to cast my vote?", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"));

  return faqs;
}

List<ExpansionPanel> _getExpansionPanels(List<FaqModel> _items) {
  return _items.map<ExpansionPanel>((FaqModel item) {
    return ExpansionPanel(
      headerBuilder: (BuildContext context, bool isExpanded) {
        return ListTile(
          title: Text(
            item.headerName,
            style: AppTextStyle.subtitle1(
                txtColor: AppColors.greyDark, wFont: FontWeight.w500),
          ),
        );
      },
      body: ListTile(
        title: Text(item.description),
      ),
      isExpanded: item.isExpanded,
    );
  }).toList();
}

class FAQBodyPage extends StatefulWidget {
  @override
  _FAQBodyPageState createState() {
    return _FAQBodyPageState();
  }
}

class _FAQBodyPageState extends State<FAQBodyPage> {
  final List<FaqModel> faqs = generateItems();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        animationDuration: const Duration(milliseconds: 300),
        children: _getExpansionPanels(faqs),
        expansionCallback: (panelIndex, isExpanded) {
          faqs[panelIndex].isExpanded = !isExpanded;
          setState(() {});
        },
        expandedHeaderPadding: EdgeInsets.symmetric(vertical: 2),
      ),
    );
  }
}
