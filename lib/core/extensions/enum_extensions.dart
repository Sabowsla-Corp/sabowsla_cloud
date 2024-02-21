enum ProjectSettingsTabs {
  general,
  cloudMessaging,
  integrations,
  serviceAccounts,
  dataPrivacy,
  usersAndPermissions,
}

extension ProjectSettingsTabsExtension on Enum {
  String getName() {
    if (this is ProjectSettingsTabs) {
      switch (this) {
        case ProjectSettingsTabs.general:
          return "General";
        case ProjectSettingsTabs.cloudMessaging:
          return "Cloud Messaging";
        case ProjectSettingsTabs.integrations:
          return "Integrations";
        case ProjectSettingsTabs.serviceAccounts:
          return "Service Accounts";
        case ProjectSettingsTabs.dataPrivacy:
          return "Data Privacy";
        case ProjectSettingsTabs.usersAndPermissions:
          return "Users & Permissions";
      }
    }

    return name;
  }
}
