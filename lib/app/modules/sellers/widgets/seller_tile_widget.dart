import 'package:cabconsumidor/app/core/models/seller_model.dart';
import 'package:cabconsumidor/app/core/services/formatters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SellerTileWidget extends StatelessWidget {
  final SellerModel seller;
  const SellerTileWidget({super.key, required this.seller});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed('/home/sellers/seller_details', arguments: seller);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 10,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  seller.isFavorite! ? Icons.favorite : Icons.favorite_border,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.3),
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                      child: Image.network(
                        seller.logo!,
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.2,
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/images/empty_store_logo.png',
                            height: MediaQuery.of(context).size.width * 0.2,
                            width: MediaQuery.of(context).size.width * 0.2,
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  child: Text(
                                    seller.name!,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                  ),
                                ),
                                // const SizedBox(height: 10),
                                // SizedBox(
                                //   child: Row(
                                //     mainAxisAlignment:
                                //         MainAxisAlignment.spaceBetween,
                                //     mainAxisSize: MainAxisSize.max,
                                //     children: [
                                //       Text(
                                //         'Código: ',
                                //         overflow: TextOverflow.ellipsis,
                                //         style: Theme.of(context)
                                //             .textTheme
                                //             .displayMedium!
                                //             .copyWith(
                                //               fontSize: 10,
                                //               color: Colors.black,
                                //             ),
                                //       ),
                                //       Text(
                                //         seller.pk!.toString(),
                                //         overflow: TextOverflow.ellipsis,
                                //         style: Theme.of(context)
                                //             .textTheme
                                //             .displayMedium!
                                //             .copyWith(
                                //               fontSize: 10,
                                //               color: Colors.black,
                                //               fontWeight: FontWeight.bold,
                                //             ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                if (seller.distance! > 0)
                                  const SizedBox(height: 5),
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
                                                  fontSize: 10,
                                                  color: Colors.black,
                                                ),
                                          ),
                                          Text(
                                            Formatters.formatDistance(
                                              seller.distance!,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium!
                                                .copyWith(
                                                  fontSize: 10,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Visibility(
                                      visible: seller.address!.isNotEmpty ||
                                          seller.number!.isNotEmpty ||
                                          seller.neighborhood!.isNotEmpty,
                                      child: const SizedBox(height: 5),
                                    ),
                                    Visibility(
                                      visible: seller.address!.isNotEmpty ||
                                          seller.number!.isNotEmpty ||
                                          seller.neighborhood!.isNotEmpty,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              size: 15,
                                              color: Colors.grey.shade400,
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              '${seller.address!}, ${seller.number!} - ${seller.neighborhood}',
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium!
                                                  .copyWith(
                                                    fontSize: 10,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ],
                                        ),
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
                                          Formatters
                                              .formatPhoneToParentesisFormat(
                                            seller.phone!,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium!
                                              .copyWith(
                                                fontSize: 10,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
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
                                          Formatters
                                              .formatPhoneToParentesisFormat(
                                            seller.whatsapp!,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium!
                                              .copyWith(
                                                fontSize: 10,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
