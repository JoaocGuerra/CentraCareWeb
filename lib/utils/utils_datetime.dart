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

}