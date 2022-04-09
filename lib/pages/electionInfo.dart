import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:voting_dapp/res/app_colors.dart';
import 'package:voting_dapp/res/style_text.dart';
import 'package:voting_dapp/services/smart_contract_functions.dart';
import 'package:voting_dapp/widgets/btn_filled.dart';
import 'package:voting_dapp/widgets/no_glow_behaviour.dart';
import 'package:voting_dapp/widgets/view_my_rich_text.dart';
import 'package:voting_dapp/widgets/view_my_rich_text_nr.dart';

class ElectionInfo extends StatefulWidget {
  final ethClient;
  final electionName;

  const ElectionInfo(
      {Key? key, required this.ethClient, required this.electionName})
      : super(key: key);

  @override
  _ElectionInfoState createState() => _ElectionInfoState();
}

class _ElectionInfoState extends State<ElectionInfo> {
  TextEditingController addCandidateController = TextEditingController();
  TextEditingController authVoterController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.electionName),
        ),
        body: SingleChildScrollView(
          child: ScrollConfiguration(
            behavior: NoGlowBehaviour(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                        color: AppColors.greyLight,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            FutureBuilder<List>(
                                future: getCandidatesNum(widget.ethClient),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                    return const Center(
                                      child: SpinKitThreeInOut(
                                        color: AppColors.primary,
                                      ),
                                    );
                                  }
                                  return Text(
                                    snapshot.data![0].toString(),
                                    style: AppTextStyle.headline4(
                                        wFont: FontWeight.w500,
                                        txtColor: AppColors.primary),
                                  );
                                }),
                            ViewMyRichText(
                              text1: "Total",
                              text2: "Candidate",
                              txtStyle1: AppTextStyle.subtitle2(
                                  txtColor: AppColors.primary),
                              txtStyle2: AppTextStyle.subtitle1(
                                  txtColor: AppColors.primary),
                            )
                          ],
                        ),
                        const Divider(
                          thickness: 2,
                        ),
                        Column(
                          children: [
                            FutureBuilder<List>(
                                future: getTotalVotes(widget.ethClient),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                      child: SpinKitThreeInOut(
                                        color: AppColors.primary,
                                      ),
                                    );
                                  }
                                  return Text(
                                    snapshot.data![0].toString(),
                                    style: AppTextStyle.headline4(
                                        wFont: FontWeight.w500,
                                        txtColor: AppColors.primary),
                                  );
                                }),
                            ViewMyRichText(
                              text1: "Total",
                              text2: "Votes",
                              txtStyle1: AppTextStyle.subtitle2(
                                  txtColor: AppColors.primary),
                              txtStyle2: AppTextStyle.subtitle1(
                                  txtColor: AppColors.primary),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: addCandidateController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter candidate name',
                          ),
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      BtnFilled(
                        title: "Add",
                        onBtnPressed: () {
                          addCandidate(
                            addCandidateController.text,
                            widget.ethClient,
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: authVoterController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter voter address',
                          ),
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      BtnFilled(
                        title: "Auth",
                        onBtnPressed: () {
                          authorizeVoter(
                            authVoterController.text,
                            widget.ethClient,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
