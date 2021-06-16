abstract class Validator {
  static String validateEmail(String email) {
    if (email == null || email.isEmpty) return 'Campo obrigatório';
    if (!email.contains('@')) {
      return 'Email deve estar no formato correto';
    }
    return null;
  }

  static String validatePassword(String password) {
    if (password == null || password.isEmpty) return 'Campo obrigatório';
    if (password.length < 6) return 'Senha deve conter pelo menos 6 dígitos';
    return null;
  }

  static String validateName(String name) {
    if (name == null || name.isEmpty) return 'Campo obrigatório';
    if (name.length < 3) return 'Nome deve conter pelo menos 3 dígitos';
    if (name.split(' ').length < 2)
      return 'Nome deve conter pelo menos nome e sobrenome';
    return null;
  }
}
