import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:givt_app/features/auth/cubit/auth_cubit.dart';
import 'package:givt_app/l10n/l10n.dart';

class FAQBottomSheet extends StatelessWidget {
  const FAQBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final locals = context.l10n;
    final userCountry =
        (context.read<AuthCubit>().state as AuthSuccess).user.country;
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            locals.needHelpTitle,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            locals.findAnswersToYourQuestions,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.73,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildQuestionTile(
                    question: locals.feedbackTitle,
                    answer: userCountry == 'US'
                        ? locals.faQantwoord0Us
                        : locals.faQantwoord0,
                  ),
                  _buildQuestionTile(
                    question: locals.faqHowDoesGivingWork,
                    answer: locals.answerHowDoesGivingWork,
                  ),
                  _buildQuestionTile(
                    question: locals.faqQuestion14,
                    answer: locals.faqAnswer14,
                  ),
                  _buildQuestionTile(
                    question: locals.faqWhyBluetoothEnabledQ,
                    answer: locals.faqWhyBluetoothEnabledA,
                  ),
                  _buildQuestionTile(
                    question: locals.faqHowDoesManualGivingWork,
                    answer: locals.answerHowDoesManualGivingWork,
                  ),
                  _buildQuestionTile(
                    question: locals.kerkdienstGemistQuestion,
                    answer: locals.kerkdienstGemistAnswer,
                  ),
                  _buildQuestionTile(
                    question: locals.faqVraag16,
                    answer: locals.faqAntwoord16,
                  ),
                  _buildQuestionTile(
                    question: locals.faQvraag5,
                    answer: locals.faQantwoord5,
                  ),
                  _buildQuestionTile(
                    question: locals.faqQuestion12,
                    answer: locals.faqAnswer12,
                  ),
                  _buildQuestionTile(
                    question: locals.faQvraag9,
                    answer: locals.faQantwoord9,
                  ),
                  _buildQuestionTile(
                    question: locals.faQvraag15,
                    answer: locals.faQantwoord15,
                  ),
                  _buildQuestionTile(
                    question: locals.faQvraag15,
                    answer: locals.faQantwoord15,
                  ),
                  _buildQuestionTile(
                    question: locals.questionHowDoesRegisteringWorks,
                    answer: locals.answerHowDoesRegistrationWork,
                  ),
                  _buildQuestionTile(
                    question: locals.faqQuestion11,
                    answer: locals.faqAnswer11,
                  ),
                  _buildQuestionTile(
                    question: locals.faqVraag10,
                    answer: locals.faqAntwoord10,
                  ),
                  _buildQuestionTile(
                    question: locals.faQvraag3,
                    answer: locals.faQantwoord3,
                  ),
                  _buildQuestionTile(
                    question: locals.faQvraag8,
                    answer: locals.faQantwoord8,
                  ),
                  _buildQuestionTile(
                    question: locals.faQvraag1,
                    answer: locals.faQantwoord1,
                  ),
                  _buildQuestionTile(
                    question: locals.faQvraag2,
                    answer: locals.faQantwoord2,
                  ),
                  _buildQuestionTile(
                    question: locals.faQvraag4,
                    answer: locals.faQantwoord4,
                  ),
                  _buildQuestionTile(
                    question: locals.faQvraag6,
                    answer: locals.faQantwoord6,
                  ),
                  _buildQuestionTile(
                    question: locals.faQvraag7,
                    answer: locals.faQantwoord7,
                  ),
                  // _buildQuestionTile(
                  //   question: locals.faQuestAnonymity,
                  //   answer: locals.faQanswerAnonymity,
                  // ),
                  _buildQuestionTile(
                    question: locals.questionWhyAreMyDataStored,
                    answer: locals.answerWhyAreMyDataStored,
                  ),
                  _buildQuestionTile(
                    question: locals.faQvraag18,
                    answer: locals.faqAntwoord18,
                  ),
                  _buildQuestionTile(
                    question: locals.termsTitle,
                    answer: userCountry == 'US'
                        ? locals.termsTextUs
                        : ['GB', 'GG', 'JE'].contains(userCountry)
                            ? locals.termsTextGb
                            : locals.termsText,
                  ),
                  _buildQuestionTile(
                    question: locals.privacyTitle,
                    answer: userCountry == 'US'
                        ? locals.policyTextUs
                        : ['GB', 'GG', 'JE'].contains(userCountry)
                            ? locals.policyTextGb
                            : locals.policyText,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ExpansionTile _buildQuestionTile({
    required String question,
    required String answer,
  }) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.all(5),
      title: Text(
        question,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      collapsedIconColor: Colors.white,
      iconColor: Colors.white,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Text(
            answer,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
