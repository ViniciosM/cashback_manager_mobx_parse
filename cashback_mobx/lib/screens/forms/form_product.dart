import 'package:brasil_fields/brasil_fields.dart';
import 'package:cashback_mobx/stores/product_store.dart';
import 'package:cashback_mobx/style/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FormProduct extends StatelessWidget {
  const FormProduct({Key? key, this.edit}) : super(key: key);
  final bool? edit;
  @override
  Widget build(BuildContext context) {
    int? _radioValue = 1;

    late ThemeData themeData;
    themeData = Theme.of(context);
    ProductStore _productStore = GetIt.I<ProductStore>();
    return Scaffold(
      appBar: AppBar(
        leading: Observer(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _productStore.clearFields();
                Navigator.pop(context);
              },
            );
          },
        ),
        title: edit != null && edit == true
            ? Text('Editar produto')
            : Text('Novo produto'),
      ),
      body: Container(
          color: themeData.backgroundColor,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(
                            left: 0, right: 16, top: 0, bottom: 8),
                        child: Text("Informações",
                            style: AppTheme.getTextStyle(
                                themeData.textTheme.subtitle1,
                                fontWeight: 600)),
                      ),
                      Observer(builder: (_) {
                        return Container(
                          margin: EdgeInsets.only(top: 0),
                          child: TextFormField(
                            controller: _productStore.descriptionController,
                            enabled: !_productStore.loading,
                            decoration: InputDecoration(
                              errorText: _productStore.descriptionError,
                              labelText: "Descrição *",
                              border: themeData.inputDecorationTheme.border,
                              enabledBorder:
                                  themeData.inputDecorationTheme.border,
                              focusedBorder:
                                  themeData.inputDecorationTheme.focusedBorder,
                              prefixIcon: const Icon(MdiIcons.cardTextOutline,
                                  size: 24),
                            ),
                            onChanged: _productStore.setDescription,
                          ),
                        );
                      }),
                      Container(
                          margin: const EdgeInsets.only(top: 8),
                          child: Observer(
                            builder: (_) {
                              return TextFormField(
                                controller: _productStore.priceController,
                                enabled: !_productStore.loading,
                                decoration: InputDecoration(
                                  errorText: _productStore.priceError,
                                  labelText: "Preço *",
                                  hintText: "Ex.: 34,50",
                                  border: themeData.inputDecorationTheme.border,
                                  enabledBorder:
                                      themeData.inputDecorationTheme.border,
                                  focusedBorder: themeData
                                      .inputDecorationTheme.focusedBorder,
                                  prefixIcon: const Icon(
                                    MdiIcons.currencyBrl,
                                    size: 24,
                                  ),
                                ),
                                inputFormatters: [
                                  // obrigatório
                                  FilteringTextInputFormatter.digitsOnly,
                                  RealInputFormatter(moeda: true),
                                ],
                                onChanged: _productStore.setPrice,
                              );
                            },
                          )),
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        child: Observer(
                          builder: (_) {
                            return TextFormField(
                              controller: _productStore.cashbackController,
                              enabled: !_productStore.loading,
                              decoration: InputDecoration(
                                errorText: _productStore.cashbackError,
                                labelText: "Cashback *",
                                hintText: "0",
                                border: themeData.inputDecorationTheme.border,
                                enabledBorder:
                                    themeData.inputDecorationTheme.border,
                                focusedBorder: themeData
                                    .inputDecorationTheme.focusedBorder,
                                prefixIcon: Icon(
                                  MdiIcons.percentOutline,
                                  size: 24,
                                ),
                              ),
                              inputFormatters: [
                                // obrigatório
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              onChanged: _productStore.setCashback,
                            );
                          },
                        ),
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
                            if(edit == false || edit == null){
                              return ElevatedButton(
                                onPressed: _productStore.loading == false &&
                                        _productStore.validForm
                                    ? _productStore.savePressed
                                    : null,
                                child: _productStore.loading == true
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
                            }else {
                              return ElevatedButton(
                                onPressed: _productStore.loading == false &&
                                        _productStore.validForm
                                    ? _productStore.updatePressed
                                    : null,
                                child: _productStore.loading == true
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
