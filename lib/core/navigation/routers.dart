class Routes {
  Routes._();
  static const String splash = '/';
  static const String logIn = '/login';

  // admin
  static const String adminHome = '/home';
  static const String adminProfile = '/profile';
  static const String createUser = '/createUser';
  static const String createOrganization = '/createOrganization';
  static const String viewUsers = '/viewUsers';
  static const String viewOrganization = '/viewOrganization';
  static const String homeAdmin = '/homeAdmin';

  // auth
  static const String setPassword = '/setPassword';
  static const String logInWithOtp = '/logInWithOtp';
  static const String logInWithPassword = '/logInWithPassword';

  // common pages
  static const String homeUser = '/homeUser';
  static const String userProfile = '/userProfile';

  // tab routes
  static const String secondTab = '/secondTab';
  static const String thirdTab = '/thirdTab';
  static const String supervisorExtra = '/supervisorExtra';

  static const String translate = '/translate';
  static const String location = '/location';
  static const String locationDetails = 'location_details';
  static const String team = '/team';
  static const String viewForms = '/viewForms';
  static const String createForm = 'createForm';
  static const String exportData = '/exportData';
  static const String fillForm = 'fillForm';
  static const String viewForm = 'viewForm';
  static const String assignForm = 'assignForm';
  static const String loading = '/loading';
  static const String resetPassword = '/resetPassword';
}
