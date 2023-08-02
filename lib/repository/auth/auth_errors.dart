String authErrorsString(String? code) {
  switch (code) {
    case 'Invalid username/password.':
      return 'Usuário ou senha incorreto.';

    case 'Invalid session token':
      return 'Token inválido';

    case 'Account already exists for this username.':
      return 'Usuário já cadastrado';

    case 'Cannot sign up user with an empty username.':
      return 'Usuário invalido';

    default:
      return 'Um erro indefinido ocorreu';
  }
}
