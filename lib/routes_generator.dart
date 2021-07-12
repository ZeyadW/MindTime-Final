import 'package:flutter/material.dart';
import 'package:medico/pages/AORAppointment.dart';
import 'package:medico/pages/EditProfile.dart';
import 'package:medico/pages/appointment.dart';
import 'package:medico/pages/book-test-online3.dart';
import 'package:medico/pages/book-test-online4.dart';
import 'package:medico/pages/choosediary.dart';
//import 'package:medico/pages/choosediary.dart';
import 'package:medico/pages/doctor-book-1.dart';
import 'package:medico/pages/doctor-book-2.dart';
import 'package:medico/pages/drviewprofile.dart';
import 'package:medico/pages/emergencycontact.dart';
import 'package:medico/pages/health.dart';
import 'package:medico/pages/journal.dart';
import 'package:medico/pages/knowledgehub.dart';
import 'package:medico/pages/my-doctors.dart';
import 'package:medico/pages/Welcome.dart';
import 'package:medico/pages/chat.dart';
import 'package:medico/pages/createAccount.dart';
import 'package:medico/pages/docotr_acount.dart';
import 'package:medico/pages/doctors.dart';

import 'package:medico/pages/login.dart';
import 'package:medico/pages/questionairescreen.dart';
import 'package:medico/pages/signup.dart';
import 'package:medico/pages/statsscreen.dart';
import 'package:medico/pages/tabs.dart';
import 'package:medico/pages/verification_number.dart';
import 'package:medico/pages/viewappointmentsUser.dart';
import 'package:medico/pages/viewappointmentsdoctor.dart';
import 'package:medico/pages/viewjournals.dart';
import 'package:medico/pages/AnalysisPage.dart';
//import 'package:medico/widgets/stats/stat.dart';
import 'package:medico/pages/erq.dart';
import 'package:medico/pages/bmis.dart';
import 'package:medico/pages/foal.dart';
import 'package:medico/pages/viewmypatients.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Welcome());
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignUp());

      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/verification':
        return MaterialPageRoute(
            builder: (_) => VerificationNumber(data: args));
      case '/createaccount':
        return MaterialPageRoute(builder: (_) => SignupPage());
      case '/home':
        return MaterialPageRoute(
            builder: (_) => TabsWidget(
                //acountInfos: args,
                ));
      case '/chat':
        return MaterialPageRoute(builder: (_) => ChatWidget());
      case '/doctors':
        return MaterialPageRoute(builder: (_) => DoctorsList());
      case '/doctorProfil':
        return MaterialPageRoute(builder: (_) => DoctorAcount());
      case '/firstDoctorBook':
        return MaterialPageRoute(builder: (_) => DoctorBookFirstStep());
      case '/journals':
        return MaterialPageRoute(builder: (_) => ChooseDiary());
      case '/addjournaltext':
        return MaterialPageRoute(builder: (_) => Journal());
      case '/viewjournalstext':
        return MaterialPageRoute(builder: (_) => ViewJournals());

      case '/secondeDoctorBook':
        return MaterialPageRoute(builder: (_) => DoctorBookSecondeStep());
      case '/thirdBookTest':
        return MaterialPageRoute(builder: (_) => BookTestsOnlineThirdStep());
      case "/fourthBookTest":
        return MaterialPageRoute(builder: (_) => BookTestsOnlineFourthStep());
      case '/mydoctors':
        return MaterialPageRoute(builder: (_) => MyDoctorsList());
      case '/mypatients':
        return MaterialPageRoute(builder: (_) => Viewmypatients());
      case '/AOR':
        return MaterialPageRoute(builder: (_) => AORAppointment());

      case '/appointment':
        return MaterialPageRoute(builder: (_) => ViewAppointmentsUser());
      case '/drmyappointment':
        return MaterialPageRoute(builder: (_) => ViewAppointmentsDoctor());
      case '/health':
        return MaterialPageRoute(builder: (_) => HealthTips());
      case '/analysispage':
        return MaterialPageRoute(builder: (_) => AnalysisPage());

      case '/knowledge':
        return MaterialPageRoute(builder: (_) => Knowledgehub());
      case '/requests':
        return MaterialPageRoute(builder: (_) => AORAppointment());
      case '/tests':
        return MaterialPageRoute(builder: (_) => Questioanires());
      case '/bmis':
        return MaterialPageRoute(builder: (_) => Bmisl());
      case '/foal':
        return MaterialPageRoute(builder: (_) => Foal());
      case '/erql':
        return MaterialPageRoute(builder: (_) => Erql());

      case '/logout':
        return MaterialPageRoute(builder: (context) => Welcome());
      case '/emerge':
        return MaterialPageRoute(
            builder: (context) => ViewEmergencyContactscreen());
      case '/editprofile':
        return MaterialPageRoute(builder: (context) => EditProfilePage());
      case '/doctorprofile':
        return MaterialPageRoute(builder: (context) => Viewdr());
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Page not found'),
        ),
      );
    });
  }
}
