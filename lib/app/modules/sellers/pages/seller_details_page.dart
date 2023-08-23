import 'package:cabconsumidor/app/core/models/seller_model.dart';
import 'package:cabconsumidor/app/core/services/formatters.dart';
import 'package:cabconsumidor/app/core/shared/widgets/appbar/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SellerDetailsPage extends StatelessWidget {
  final SellerModel seller;

  const SellerDetailsPage({super.key, required this.seller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: seller.name,
        backgroundColor: Colors.transparent,
      ).build(context) as AppBar,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(150),
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
                      width: 150,
                    );
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                seller.name!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
              ),
            ),
            const SizedBox(height: 20),
            const Divider(
              color: Colors.black,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Text(
                    seller.name!,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Código: ',
                        overflow: TextOverflow.ellipsis,
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  fontSize: 14,
                                  color: Colors.black,
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
                const SizedBox(height: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
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
                    const SizedBox(height: 5),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
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
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                Modular.to.pushNamed(
                  '/home/payment',
                  arguments: {
                    'vendedor': seller,
                    'title': 'Pagamento',
                  },
                );
              },
              child: SizedBox(
                height: 150,
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    height: 50,
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.payment,
                          size: 40,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Pagar este vendedor',
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Colors.black,
                                  ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
