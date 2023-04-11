import 'package:api_demo/controllers/month_wise_details_controllers.dart';
import 'package:api_demo/helper/loader.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class MonthlyOrderDetailsScreen extends StatefulWidget {
  const MonthlyOrderDetailsScreen({Key? key}) : super(key: key);

  @override
  MonthlyOrderDetailsScreenState createState() =>
      MonthlyOrderDetailsScreenState();
}

class MonthlyOrderDetailsScreenState
    extends StateMVC<MonthlyOrderDetailsScreen> {
  TextEditingController monthController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  MonthWiseDetailsController? _con;

  MonthlyOrderDetailsScreenState() : super(MonthWiseDetailsController()) {
    _con = controller as MonthWiseDetailsController;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    monthController.text = DateTime.now().month.toString();
    _con!.monthWiseDetailsControllers(DateTime.now().month);
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String>? optIns = {"": ""};
    var d = [];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0,
        centerTitle: true,
        title: const Text('Monthly wise Report'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                text: 'Hello, ',
                style: const TextStyle(fontSize: 15, color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                      text: _con!.user.fName.toString() +
                          _con!.user.lName.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Row(
                children: [
                  Flexible(
                    flex: 3,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: monthController,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          hintText: 'Please enter a month between 1 to 12',
                          hintStyle:
                              const TextStyle(color: Colors.grey, fontSize: 13),
                          labelText: 'Enter a Month',
                          labelStyle:
                              const TextStyle(color: Colors.grey, fontSize: 13),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  Flexible(
                    child: GestureDetector(
                      onTap: () {
                        _con!.monthWiseDetailsControllers(
                            int.parse(monthController.text));
                      },
                      behavior: HitTestBehavior.translucent,
                      child: Container(
                        height: 45,
                        margin: const EdgeInsets.only(left: 15),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.amber,
                        ),
                        child: const Center(
                          child: Text('Search',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: Text(
                  "This Month Fine is: " + (_con!.pending * 100).toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 16,
                      fontWeight: FontWeight.w500)),
            ),
            const SizedBox(height: 20),
            _con!.reportList == []
                ? showLoader()
                : Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: _con!.reportList.length,
                        itemBuilder: (BuildContext context, int i) {
                          final testMap = _con!.reportList[i].optIns;
                          return _con!.reportList[i].optIns.toString() == '{: }'
                              ? Container()
                              : Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.amber),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(bottom: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Date: ${_con!.reportList[i].date.toString()}',
                                        style: const TextStyle(
                                            fontSize: 15, color: Colors.black),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          timeChecker(
                                              _con!.reportList[i].optIns!,
                                              'assets/images/breakfast.png',
                                              'breakfast'),
                                          timeChecker(
                                              _con!.reportList[i].optIns!,
                                              'assets/images/lunch.png',
                                              'lunch'),
                                          timeChecker(
                                              _con!.reportList[i].optIns!,
                                              'assets/images/dinner.png',
                                              'dinner'),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                        }),
                  )
          ],
        ),
      ),
    );
  }

  Widget timeChecker(Map<String, dynamic> d, String image, String foodTime) {
    int i = -1;
    if (d.keys.toList().contains(foodTime)) {
      i = d.keys.toList().indexOf(foodTime);
    } else {
      i = -1;
    }
    if (i == -1) {
      return Container();
    } else {
      return Column(
        children: [
          Image.asset(image,
              height: MediaQuery.of(context).size.width * 0.1,
              width: MediaQuery.of(context).size.width * 0.1),
          const SizedBox(height: 10),
          Text(
            d.values.toList()[i],
            style: const TextStyle(
                color: Colors.deepOrange,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          )
        ],
      );
    }
  }
}
