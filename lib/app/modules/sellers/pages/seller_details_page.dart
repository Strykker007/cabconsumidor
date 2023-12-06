import 'package:cabconsumidor/app/core/models/seller_model.dart';
import 'package:cabconsumidor/app/core/services/formatters.dart';
import 'package:cabconsumidor/app/core/shared/widgets/appbar/app_bar_widget.dart';
import 'package:cabconsumidor/app/core/shared/widgets/button/bottom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SellerDetailsPage extends StatelessWidget {
  final SellerModel seller;

  const SellerDetailsPage({super.key, required this.seller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Vendedor',
        backgroundColor: Colors.transparent,
      ).build(context) as AppBar,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Código: ',
                      overflow: TextOverflow.ellipsis,
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                fontSize: 14,
                                color: Colors.grey.withOpacity(0.7),
                              ),
                    ),
                    Text(
                      seller.pk!.toString(),
                      overflow: TextOverflow.ellipsis,
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Image.network(
                    seller.logo ?? '',
                    height: 150,
                    width: 150,
                    fit: BoxFit.fill,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return SvgPicture.asset(
                        'assets/profile/profile_image.svg',
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Divider(
              color: Colors.grey.withOpacity(0.7),
            ),
            Text(
              seller.name!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: seller.distance! > 0,
                      child: Row(
                        children: [
                          Text(
                            'Distância: ',
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                          ),
                          Text(
                            Formatters.formatDistance(seller.distance!),
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Endereço e Contato',
                      overflow: TextOverflow.ellipsis,
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${seller.address!}, ${seller.number!} - ${seller.neighborhood}',
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          Icons.phone,
                          size: 15,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          Formatters.formatPhoneToParentesisFormat(
                            seller.phone!,
                          ),
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(
                          Icons.message,
                          size: 15,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          Formatters.formatPhoneToParentesisFormat(
                            seller.whatsapp!,
                          ),
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomButtonWidget(
        onPressed: () {
          Modular.to.pushNamed(
            '/home/payment',
            arguments: {
              'vendedor': seller,
              'title': 'Pagamento',
            },
          );
        },
        text: 'Pagar este vendedor',
      ),
    );
  }
}
