import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:opinarti/views/access_management/components/create_user_header.dart';
import 'package:opinarti/views/components/default_button.dart';
import 'package:opinarti/views/components/default_text_field.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  final _nameEC = TextEditingController();
  final _lastNameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _phoneEC = TextEditingController();
  final _companyEC = TextEditingController();
  final _cnpjEC = TextEditingController();
  final _dateStartEC = TextEditingController();
  final _dateEndEC = TextEditingController();
  final _quantityEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _confirmPasswordEC = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameEC.dispose();
    _lastNameEC.dispose();
    _emailEC.dispose();
    _phoneEC.dispose();
    _companyEC.dispose();
    _cnpjEC.dispose();
    _dateStartEC.dispose();
    _dateEndEC.dispose();
    _quantityEC.dispose();
    _passwordEC.dispose();
    _confirmPasswordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 48,
        leading: InkWell(
          onTap: () => Navigator.pop(context, null),
          child: SvgPicture.asset(
            "assets/close.svg",
            fit: BoxFit.scaleDown,
          ),
        ),
        backgroundColor: Colors.transparent,
        titleSpacing: 0,
        title: Text(
          "Novo Usuário",
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w600,
            fontSize: 22,
            letterSpacing: -.02,
            color: const Color(0xFF1B1B1F),
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: ListView(
                  children: [
                    const CreateUserHeader(title: "Dados do usuário"),
                    Row(
                      children: [
                        Expanded(
                          child: DefaultTextField(
                            label: "Nome",
                            controller: _nameEC,
                            validator: (String? nome) {
                              if (nome == null || nome.isEmpty) {
                                return 'Insira uma nome';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: DefaultTextField(
                            label: "Sobrenome",
                            controller: _lastNameEC,
                            validator: (String? sobreNome) {
                              if (sobreNome == null || sobreNome.isEmpty) {
                                return 'Insira uma sobrenome';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    DefaultTextField(
                      label: 'E-mail',
                      controller: _emailEC,
                      validator: (String? email) {
                        if (email == null || email.isEmpty) {
                          return 'Insira uma email';
                        }
                        if (!email.isEmail) {
                          return 'Insira um email válido';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    DefaultTextField(
                      label: 'Telefone',
                      controller: _phoneEC,
                      validator: (String? telefone) {
                        if (telefone == null || telefone.isEmpty) {
                          return 'Insira uma telefone';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    const DefaultTextField(
                      label: 'Nível de acesso',
                    ),
                    const SizedBox(height: 16),
                    const CreateUserHeader(title: "Dados da empresa"),
                    DefaultTextField(
                      label: 'Empresa',
                      controller: _companyEC,
                      validator: (String? empresa) {
                        if (empresa == null || empresa.isEmpty) {
                          return 'Insira uma empresa';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    DefaultTextField(
                      label: 'CNPJ',
                      controller: _cnpjEC,
                      validator: (String? cnpj) {
                        if (cnpj == null || cnpj.isEmpty) {
                          return 'Insira um cnpj';
                        }
                        if (!cnpj.isCnpj) {
                          return 'Insira um cnpj válido';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    const CreateUserHeader(title: "Período da assinatura"),
                    Row(
                      children: [
                        Expanded(
                          child: DefaultTextField(
                            label: "Início",
                            controller: _dateStartEC,
                            validator: (String? inicio) {
                              if (inicio == null || inicio.isEmpty) {
                                return 'Insira uma data de início';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: DefaultTextField(
                            label: "Fim",
                            controller: _dateEndEC,
                            validator: (String? empresa) {
                              if (empresa == null || empresa.isEmpty) {
                                return 'Insira uma data de fim';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const CreateUserHeader(title: "Aparelhos na licença"),
                    DefaultTextField(
                      label: 'Quantidade',
                      controller: _quantityEC,
                      validator: (String? empresa) {
                        if (empresa == null || empresa.isEmpty) {
                          return 'Insira uma quatidade';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    const CreateUserHeader(title: "Criar Senha"),
                    DefaultTextField(
                      label: 'Senha',
                      controller: _passwordEC,
                      obscureText: true,
                      validator: (String? password) {
                        if (password == null || password.isEmpty) {
                          return 'Digite sua senha!';
                        }
                        if (password.length < 8) {
                          return "Digite uma senha com pelo menos 8 caracteres.";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    DefaultTextField(
                      label: 'Repetir Senha',
                      controller: _confirmPasswordEC,
                      obscureText: true,
                      validator: (String? confirmPassword) {
                        if (confirmPassword == null || confirmPassword.isEmpty) {
                          return 'Confirme sua senha!';
                        }
                        if (confirmPassword != _passwordEC.text) {
                          return "As senhas precisam ser iguais";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 64,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 32,
                      child: DefaultButtom(
                        text: "Cancelar",
                        activeButton: true,
                        onPressed: () => Navigator.pop(context, null),
                      ),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      height: 32,
                      child: DefaultButtom(
                        text: "Confirmar",
                        activeButton: true,
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            // TODO; implementar
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
