import 'package:property_map/services/datasharing.dart';
import 'package:property_map/services/directoryservices.dart';

class LoadData {
  //loading firebase keymaps data in local directory file.
  getPlansData() {
    MapData(secName: "keyplans").getKeyPlans().then((data) {
      print("data is $data");
      DirServices().saveKeyPlans(data);
    });
  }
}
