abstract class UserNameHelper {
  static String getNameInitials(String userName) {
    List<String> names = userName.split(' ');

    return '${names.first.substring(0, 1)}${names.last.substring(0, 1)}';
  }

  static String getFirstAndLastNames(String userName) {
    List<String> names = userName.split(' ');
    return '${names.first} ${names.last}';
  }
}
