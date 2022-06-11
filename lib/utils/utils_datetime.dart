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

  static String addZeroIfNecessary(var value){

    return  value.toString().length == 1 ? "0"+value.toString() : value.toString();

  }

}