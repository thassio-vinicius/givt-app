import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:givt_app/features/children/family_history/models/child_donation.dart';
import 'package:givt_app/features/children/family_history/models/child_donation_helper.dart';
import 'package:givt_app/utils/datetime_extension.dart';

class ActionedDonationWidget extends StatelessWidget {
  const ActionedDonationWidget(
      {required this.donation, required this.size, super.key});
  final ChildDonation donation;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          if (donation.state != DonationState.pending)
            SvgPicture.asset(DonationState.getPicture(donation.state)),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\$${donation.amount.toStringAsFixed(2)} by ${donation.name}',
                style: TextStyle(
                  color: DonationState.getAmountColor(donation.state),
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                width: donation.medium == DonationMediumType.nfc
                    ? size.width * 0.55
                    : size.width * 0.75,
                child: Text(
                  donation.organizationName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: const TextStyle(
                    color: Color(0xFF2E2957),
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Text(
                donation.date.formatDate(),
                style: TextStyle(
                  color: donation.state == DonationState.pending
                      ? DonationState.getAmountColor(donation.state)
                      : const Color(0xFF2E2957),
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const Spacer(),
          if (donation.medium == DonationMediumType.nfc)
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Opacity(
                  opacity: donation.state == DonationState.pending ? 0.6 : 1,
                  child: SvgPicture.asset('assets/images/coin.svg')),
            )
        ],
      ),
    );
  }
}
