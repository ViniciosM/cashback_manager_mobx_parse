import 'package:brasil_fields/brasil_fields.dart';
import 'package:cashback_mobx/stores/customer_store.dart';
import 'package:cashback_mobx/style/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FormCustomer extends StatelessWidget {
  const FormCustomer({Key? key, this.edit}) : super(key: key);
  final bool? edit;

  @override
  Widget build(BuildContext context) {
    int? _radioValue = 1;
    late ThemeData themeData;
    themeData = Theme.of(context);
    CustomerStore customerStore = GetIt.I<CustomerStore>();
    return Scaffold(
      appBar: AppBar(
        title: edit == true && edit != null ? const Text(
          'Editar cliente',
        ) : const Text(
          'Novo cliente',
        ),
      ),
      body: Container(
          color: themeData.backgroundColor,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(
                            left: 0, right: 16, top: 0, bottom: 8),
                        child: Text("Informações pessoais",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle1,
                                fontWeight: 600)),
                      ),
                      Observer(builder: (_) {
                        return Container(
                          margin: EdgeInsets.only(top: 0),
                          child: TextFormField(
                            controller: customerStore.nameController,
                            decoration: InputDecoration(
                              errorText: customerStore.nameError,
                              enabled: !customerStore.loading,
                              labelText: "Nome completo *",
                              border: themeData.inputDecorationTheme.border,
                              enabledBorder:
                                  themeData.inputDecorationTheme.border,
                              focusedBorder:
                                  themeData.inputDecorationTheme.focusedBorder,
                              prefixIcon:
                                  Icon(MdiIcons.accountOutline, size: 24),
                            ),
                            onChanged: customerStore.setName,
                          ),
                        );
                      }),
                      Container(
                        padding: EdgeInsets.only(top: 16),
                        child: Text("Contato",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle1,
                                fontWeight: 600)),
                      ),
                      Observer(builder: (_) {
                        return Container(
                          margin: EdgeInsets.only(top: 8),
                          child: TextFormField(
                              controller: customerStore.phoneController,
                              decoration: InputDecoration(
                                errorText: customerStore.phoneError,
                                enabled: !customerStore.loading,
                                labelText: "Telefone *",
                                border: themeData.inputDecorationTheme.border,
                                enabledBorder:
                                    themeData.inputDecorationTheme.border,
                                focusedBorder: themeData
                                    .inputDecorationTheme.focusedBorder,
                                prefixIcon: Icon(
                                  MdiIcons.phoneOutline,
                                  size: 24,
                                ),
                              ),
                              onChanged: customerStore.setPhone,
                              inputFormatters: [
                                // obrigatório
                                FilteringTextInputFormatter.digitsOnly,
                                TelefoneInputFormatter(),
                              ]),
                        );
                      }),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: TextFormField(
                          controller: customerStore.emailController,
                          decoration: InputDecoration(
                            enabled: !customerStore.loading,
                            labelText: "Email",
                            border: themeData.inputDecorationTheme.border,
                            enabledBorder:
                                themeData.inputDecorationTheme.border,
                            focusedBorder:
                                themeData.inputDecorationTheme.focusedBorder,
                            prefixIcon: Icon(
                              MdiIcons.emailOutline,
                              size: 24,
                            ),
                          ),
                          onChanged: customerStore.setEmail,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 16),
                        child: Text("Outras informações",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle1,
                                fontWeight: 600)),
                      ),
                      Observer(builder: (_) {
                        return Container(
                          margin: EdgeInsets.only(top: 8),
                          child: TextFormField(
                            controller: customerStore.cpfController,
                            decoration: InputDecoration(
                              enabled: !customerStore.loading,
                              labelText: "CPF / CNPJ",
                              border: themeData.inputDecorationTheme.border,
                              enabledBorder:
                                  themeData.inputDecorationTheme.border,
                              focusedBorder:
                                  themeData.inputDecorationTheme.focusedBorder,
                              prefixIcon:
                                  Icon(MdiIcons.cardTextOutline, size: 24),
                            ),
                            inputFormatters: [
                              // obrigatório
                              FilteringTextInputFormatter.digitsOnly,
                              CpfOuCnpjFormatter(),
                            ],
                            onChanged: customerStore.setCpf,
                          ),
                        );
                      }),
                      Observer(
                        builder: (_) {
                          return Container(
                            margin: EdgeInsets.only(top: 8),
                            child: TextFormField(
                              controller: customerStore.noteController,
                              decoration: InputDecoration(
                                enabled: !customerStore.loading,
                                labelText: "Observação",
                                border: themeData.inputDecorationTheme.border,
                                enabledBorder:
                                    themeData.inputDecorationTheme.border,
                                focusedBorder: themeData
                                    .inputDecorationTheme.focusedBorder,
                                prefixIcon:
                                    Icon(MdiIcons.messageOutline, size: 24),
                              ),
                              onChanged: customerStore.setNote,
                            ),
                          );
                        },
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    themeData.colorScheme.primary.withAlpha(28),
                                blurRadius: 4,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Observer(builder: (_) {
                            if (edit == false || edit == null) {
                              return ElevatedButton(
                                  onPressed: customerStore.loading == false &&
                                          customerStore.validForm
                                      ? customerStore.savePressed
                                      : null,
                                  child: customerStore.loading == true
                                      ? CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                      : Text("SALVAR",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText2,
                                              fontWeight: 700,
                                              letterSpacing: 0.2,
                                              color: themeData
                                                  .colorScheme.onPrimary)));
                            } else {
                              return ElevatedButton(
                                  onPressed: customerStore.loading == false &&
                                          customerStore.validForm
                                      ? customerStore.updatePressed
                                      : null,
                                  child: customerStore.loading == true
                                      ? CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                      : Text("ATUALIZAR",
                                          style: AppTheme.getTextStyle(
                                              themeData.textTheme.bodyText2,
                                              fontWeight: 700,
                                              letterSpacing: 0.2,
                                              color: themeData
                                                  .colorScheme.onPrimary)));
                            }
                          }),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
