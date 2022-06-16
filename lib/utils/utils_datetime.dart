class UtilsDateTime{

  static String convertFormatDate(String date){

    String dateFormated = date[0]+date[1]+"/"+
                          date[2]+date[3]+"/"+
                          date[4]+date[5];

    return dateFormated;

  }

  static String convertDatetimeSepairWithBar(String datetime){

    List<String> datetimeSepair = datetime.split(" ");
    List<String> dateSepair = datetimeSepair[0].split("-");

    String dateFormated = dateSepair[2]+dateSepair[1]+dateSepair[0][2]+dateSepair[0][3];

    return dateFormated;

  }

  static DateTime convertStringToDatetime(String date){

    String day = date[0]+date[1];
    String month = date[2]+date[3];
    String year = "20"+date[4]+date[5];

    return DateTime.parse(
        year+"-"+month+"-"+day
    );

  }

  static String getDatetimeNow(){

    DateTime dateNow = DateTime.now();
    String day = addZeroIfNecessary(dateNow.day.toString());
    String month = addZeroIfNecessary(dateNow.month.toString());
    String year = dateNow.year.toString()[2] + dateNow.year.toString()[3];

    return day+month+year;

  }

  static String getHoursNow() {

    DateTime dateNow = DateTime.now();
    String hour = addZeroIfNecessary(dateNow.hour.toString());
    String minute = addZeroIfNecessary(dateNow.minute.toString());

    return hour+":"+minute;

  }

  static String addZeroIfNecessary(var value){

    return  value.toString().length == 1 ? "0"+value.toString() : value.toString();

  }

  static int calculateAge(String date) {
    List<String> dateSepair = date.split("/");

    DateTime birthDate = DateTime.parse(
      dateSepair[2]+"-"+dateSepair[1]+"-"+dateSepair[0],
    );

    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }

}