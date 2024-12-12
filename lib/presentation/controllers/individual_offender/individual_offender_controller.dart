import 'package:cvms/domain/usecases/individual_offender/add_offender.dart';
import 'package:cvms/domain/entities/individual_offender/individual_offender.dart';
import 'package:cvms/domain/usecases/individual_offender/get_all_offenders.dart';

class IndividualOffenderController {
  // Declare an instance of AddOffender use case
  final AddOffender addOffender;

  // Constructor for the controller that takes an AddOffender instance
  IndividualOffenderController(this.addOffender);

  // Function to create an offender by calling the AddOffender use case
  Future<void> createOffender(IndividualOffender offender) async {
    // Call the execute() function from AddOffender use case
    await addOffender.execute(offender);
  }
}


class IndividualOffenderController_two{
  final GetAllOffenders _getAllOffenders;

  IndividualOffenderController_two(this._getAllOffenders);

  // Method that fetches the offenders
  Future<List<IndividualOffender>> fetchOffenders() async {
    return await _getAllOffenders.execute(); // Assuming execute() method fetches the data
  }
}