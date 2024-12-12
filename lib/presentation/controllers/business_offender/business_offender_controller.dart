import 'package:cvms/domain/usecases/business_offender/add_offender.dart';
import 'package:cvms/domain/usecases/business_offender/get_all_offenders.dart';
import 'package:cvms/domain/entities/business_offender/business_offender.dart';

class BusinessOffenderController {
  // Declare an instance of AddOffender use case
  final AddOffender addOffender;

  // Constructor for the controller that takes an AddOffender instance
  BusinessOffenderController(this.addOffender);

  // Function to create an offender by calling the AddOffender use case
  Future<void> createOffender(BusinessOffender offender) async {
    // Call the execute() function from AddOffender use case
    await addOffender.execute(offender);
  }

}
class BusinessOffenderController_two{
  final GetAllOffenders _getAllOffenders;

  BusinessOffenderController_two(this._getAllOffenders);

  // Method that fetches the offenders
  Future<List<BusinessOffender>> fetchOffenders() async {
    return await _getAllOffenders.execute(); // Assuming execute() method fetches the data
  }
}