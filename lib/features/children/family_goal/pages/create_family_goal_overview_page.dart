import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:givt_app/core/enums/enums.dart';
import 'package:givt_app/features/children/family_goal/cubit/create_family_goal_cubit.dart';
import 'package:givt_app/features/children/family_goal/widgets/family_goal_circle.dart';
import 'package:givt_app/features/children/family_goal/widgets/family_goal_creation_stepper.dart';
import 'package:givt_app/l10n/l10n.dart';
import 'package:givt_app/shared/widgets/custom_green_elevated_button.dart';
import 'package:givt_app/utils/utils.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateFamilyGoalOverviewPage extends StatelessWidget {
  const CreateFamilyGoalOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          context.l10n.familyGoalOverviewTitle,
          style: GoogleFonts.mulish(
            textStyle: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
          ),
        ),
        leading: BackButton(
          color: AppTheme.givtBlue,
          onPressed: () {
            AnalyticsHelper.logEvent(
              eventName: AmplitudeEvents.backClicked,
            );

            context.pop();
          },
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const FamilyGoalCreationStepper(
              currentStep: FamilyGoalCreationStatus.overview,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              child: Text(
                context.l10n.familyGoalStartMakingHabit,
                style: GoogleFonts.mulish(
                  textStyle:
                      Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppTheme.givtBlue,
                          ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const FamilyGoalCircle(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: CustomGreenElevatedButton(
          title: context.l10n.familyGoalCreate,
          onPressed: () {
            context.read<CreateFamilyGoalCubit>().moveToCause();
            AnalyticsHelper.logEvent(
              eventName: AmplitudeEvents.familyGoalCreateClicked,
            );
          },
        ),
      ),
    );
  }
}
