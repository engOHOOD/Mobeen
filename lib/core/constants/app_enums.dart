enum UserRole { supervisor, researcher, superAdmin, dataAnalyst }

enum LoadingState { initial, loading, success, error }

enum NetworkStatus { connected, disconnected, unknown }

enum StateLoadUser { local, remote }

enum AuthStatus { authenticated, unauthenticated, unknown }

enum LanguagesEnum {
  ar,
  en;

  String get displayCode => name.toUpperCase();
  String get displayName {
    switch (name) {
      case 'ar':
        return "العربية";
      default:
        return "English";
    }
  }
}

enum LocationViewType { map, list }

enum LocationStatus { active, disabled }

enum ShiftType { morning, evening }

enum TaskStatus { assigned, completed, absent }

enum QuestionType { text, number, mcq, checkbox, dropdown }

enum TeamViewType { management, live }

enum FormViewType { form, researcher }
