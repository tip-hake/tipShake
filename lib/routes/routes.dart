import 'package:tipShake/view/auth/forgot_password/forgot_password_screen.dart';
import 'package:tipShake/view/auth/forgot_password/reset_password_screen.dart';
import 'package:tipShake/view/auth/forgot_password/verify_screen.dart';
import 'package:tipShake/view/auth/login_screen.dart';
import 'package:tipShake/view/auth/otp/email_verification_screen.dart';
import 'package:tipShake/view/auth/register_screen.dart';
import 'package:tipShake/view/dashboard_screen.dart';
import 'package:tipShake/view/drawer/change_password_screen.dart';
import 'package:tipShake/view/drawer/deposit/deposit_log_screen.dart';
import 'package:tipShake/view/drawer/deposit/deposit_screen.dart';
import 'package:tipShake/view/drawer/exchange_money_screen.dart';
import 'package:tipShake/view/drawer/kyc_verification_screen.dart';
import 'package:tipShake/view/drawer/profile_screen.dart';
import 'package:tipShake/view/drawer/request_money_screen.dart';
import 'package:tipShake/view/drawer/send_money_screen.dart';
import 'package:tipShake/view/drawer/support/conversation_screen.dart';
import 'package:tipShake/view/drawer/support/create_new_ticket_screen.dart';
import 'package:tipShake/view/drawer/support/support_screen.dart';
import 'package:tipShake/view/drawer/transfer_log_screen.dart';
import 'package:tipShake/view/drawer/two_fa_screen.dart';
import 'package:tipShake/view/drawer/withdraw/withdraw_log_screen.dart';
import 'package:tipShake/view/drawer/withdraw/withdraw_screen.dart';
import 'package:tipShake/view/onboard/onboard_screen.dart';
import 'package:tipShake/view/payment_preview_screen.dart';
import 'package:tipShake/view/splash_screen.dart';
import 'package:get/get.dart';

class Routes {
  static const String splashScreen = '/splashScreen';
  static const String onboardScreen = '/onboardScreen';
  static const String loginScreen = '/loginScreen';
  static const String registerScreen = '/registerScreen';
  static const String emailVerificationScreen = '/emailVerificationScreen';
  static const String forgotPasswordScreen = '/forgotPasswordScreen';
  static const String verifyScreen = '/verifyScreen';
  static const String resetPasswordScreen = '/resetPasswordScreen';
  static const String dashboardScreen = '/dashboardScreen';
  static const String exchangeMoneyScreen = '/exchangeMoneyScreen';
  static const String depositLogScreen = '/depositLogScreen';
  static const String withdrawLogScreen = '/withdrawLogScreen';
  static const String transferLogScreen = '/transferLogScreen';
  static const String changePasswordScreen = '/changePasswordScreen';
  static const String depositScreen = '/depositScreen';
  static const String withdrawScreen = '/withdrawScreen';
  static const String paymentPreviewScreen = '/paymentPreviewScreen';
  static const String sendMoneyScreen = '/sendMoneyScreen';
  static const String requestMoneyScreen = '/requestMoneyScreen';
  static const String twoFAScreen = '/twoFAScreen';
  static const String kycVerificationScreen = '/kycVerificationScreen';
  static const String profileScreen = '/profileScreen';
  static const String supportScreen = '/supportScreen';
  static const String createNewTicketScreen = '/createNewTicketScreen';
  static const String conversationScreen = '/conversationScreen';

  static var list = [
    GetPage(
        name: splashScreen,
        page: () => const SplashScreen(),

    ),
    GetPage(
        name: onboardScreen,
        page: () => const OnboardScreen(),

    ),
    GetPage(
        name: loginScreen,
        page: () => const LoginScreen(),
    ),
    GetPage(
        name: registerScreen,
        page: () => const RegisterScreen(),
    ),
    GetPage(
      name: emailVerificationScreen,
      page: () => const EmailVerificationScreen(),
    ),
    GetPage(
      name: forgotPasswordScreen,
      page: () => const ForgotPasswordScreen(),
    ),
    GetPage(
      name: verifyScreen,
      page: () => const VerifyScreen(),
    ),
    GetPage(
      name: resetPasswordScreen,
      page: () => const ResetPasswordScreen(),
    ),
    GetPage(
        name: dashboardScreen,
        page: () => const DashboardScreen(),
    ),
    GetPage(
      name: exchangeMoneyScreen,
      page: () => const ExchangeMoneyScreen(),
    ),
    GetPage(
        name: depositLogScreen,
        page: () => const DepositLogScreen(),
    ),
    GetPage(
      name: withdrawLogScreen,
      page: () => const WithdrawLogScreen(),
    ),
    GetPage(
      name: transferLogScreen,
      page: () => const TransferLogScreen(),
    ),
    GetPage(
      name: changePasswordScreen,
      page: () => const ChangePasswordScreen(),
    ),
    GetPage(
      name: depositScreen,
      page: () => const DepositScreen(),
    ),
    GetPage(
      name: withdrawScreen,
      page: () => const WithdrawScreen(),
    ),
    GetPage(
      name: paymentPreviewScreen,
      page: () => const PaymentPreviewScreen(),
    ),
    GetPage(
      name: sendMoneyScreen,
      page: () => const SendMoneyScreen(),
    ),
    GetPage(
      name: requestMoneyScreen,
      page: () => const RequestMoneyScreen(),
    ),
    GetPage(
      name: twoFAScreen,
      page: () => const TwoFAScreen(),
    ),
    GetPage(
      name: kycVerificationScreen,
      page: () => const KYCVerificationScreen(),
    ),
    GetPage(
      name: profileScreen,
      page: () => const ProfileScreen(),
    ),
    GetPage(
      name: supportScreen,
      page: () => const SupportScreen(),
    ),
    GetPage(
      name: createNewTicketScreen,
      page: () => const CreateNewTicketScreen(),
    ),
    GetPage(
      name: conversationScreen,
      page: () => const ConversationScreen(),
    ),
  ];
}
