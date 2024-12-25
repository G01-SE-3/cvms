// validators.dart

String? validateDateRange(DateTime? startDate, DateTime? endDate) {
  if (startDate != null && endDate != null && startDate.isAfter(endDate)) {
    return "Start date cannot be later than end date.";
  }
  else if(startDate == null && endDate == null )
  {
         return "Input  fields cannot be empty.";
  }
  return null;
 

}


String? validateInput(String input) {
  if (input.isEmpty) {
    return "This field cannot be empty.";
  } else if (double.tryParse(input) == null) {
    return "Please enter a valid number.";
  }
  return null; 
}
