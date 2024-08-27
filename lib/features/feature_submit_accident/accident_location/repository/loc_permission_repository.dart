
class LocPermissionRepository {
  bool isDenied;
  bool isGranted;
  bool isPermanentlyDenied;
  bool isUnknown;
  bool isReRequesting;

  LocPermissionRepository({
    required this.isDenied,
    required this.isGranted,
    required this.isPermanentlyDenied,
    required this.isUnknown,
    required this.isReRequesting,
  });

  LocPermissionRepository.granted()
      : isDenied = false,
        isGranted = true,
        isPermanentlyDenied = false,
        isUnknown = false,
        isReRequesting = false;

  LocPermissionRepository.denied()
      : isDenied = true,
        isGranted = false,
        isPermanentlyDenied = false,
        isUnknown = false,
        isReRequesting = false;

  LocPermissionRepository copyWith({
    bool? isDenied,
    bool? isGranted,
    bool? isPermanentlyDenied,
    bool? isUnknown,
    bool? isReRequesting,
  }) {
    return LocPermissionRepository(
      isDenied: isDenied ?? this.isDenied,
      isGranted: isGranted ?? this.isGranted,
      isPermanentlyDenied: isPermanentlyDenied ?? this.isPermanentlyDenied,
      isUnknown: isDenied ?? this.isUnknown,
      isReRequesting: isDenied ?? this.isReRequesting,
    );
  }
}
