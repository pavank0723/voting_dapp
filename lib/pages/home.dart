import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:voting_dapp/pages/electionInfo.dart';
import 'package:voting_dapp/res/app_colors.dart';
import 'package:voting_dapp/res/image_path.dart';
import 'package:voting_dapp/services/smart_contract_functions.dart';
import 'package:voting_dapp/utils/constants.dart';
import 'package:voting_dapp/widgets/app_back_nav_bar.dart';
import 'package:voting_dapp/widgets/btn_filled.dart';
import 'package:voting_dapp/widgets/btn_outline.dart';
import 'package:voting_dapp/widgets/img_with_app_name.dart';
import 'package:web3dart/web3dart.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //This are the clients that are going to interact with Smart Contract
  Client? httpClient;
  Web3Client? ethClient;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    httpClient = Client();
    ethClient = Web3Client(infura_url, httpClient!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppBackNavBar(txtTitle: "Start Election",imgUrl: AppImages.icBackArrow,),
                const SizedBox(
                  height: 50,
                ),
                const ImgWithAppName(),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: controller,
                      decoration: const InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(),
                        hintText: 'Enter election name',
                      ),
                      keyboardType: TextInputType.name,
                    ),

                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.42,
                          child: BtnOutline(title: "Reset"),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.42,
                          child: BtnFilled(
                            title: "Submit",
                            onBtnPressed: () async {
                              if (controller.text.length > 0) {
                                await startElection(
                                    controller.text, ethClient!); //With null check
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text('Added successfully!'),
                                ));
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
