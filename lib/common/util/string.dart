
part of util;
String countFormat(int cout){
  String str = '';
  if (cout > 999999){
    str = "${((cout/1000000).toStringAsFixed(1))}ms";
  } else if (cout > 9999){
    str = "${((cout/10000).toStringAsFixed(1))}m";
  }else{
    str = cout.toString();
  }
  return str;
}