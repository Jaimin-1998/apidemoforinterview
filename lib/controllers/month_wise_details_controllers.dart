import 'package:api_demo/helper/loader.dart';
import 'package:api_demo/models/month_wise_details_model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../repositiry/month_wise_details_repository.dart';

class MonthWiseDetailsController extends ControllerMVC {
  User user = User();
  List<Report> reportList = [];
  int pending=0;

  Future<void> monthWiseDetailsControllers(int month) async {
    // FocusScope.of(context).unfocus();
    showLoader();
    await getMonthlyRecords(month).then((value) {
      if (value != null) {
          setState(() {
            user = value.user!;
            reportList = value.reports!;
            pending=0;
            for(int i=0;i<reportList.length;i++){
              reportList[i].optIns!.values.toList().forEach((element) {
                if(element.toString().toLowerCase()=="pending"){
                  pending++;
                }
              });
            }
          });
      }
    }).catchError((e) {
      hideLoader();
      print('catchError ->${e.toString()}');
    }).whenComplete(() {
      hideLoader();
    });
  }
}