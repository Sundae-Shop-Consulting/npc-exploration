/**
 * @description Reorders the App Menu to put a specific list of apps at the top, in the given order.
 *               All other apps stay in their existing relative order.
 * @author Laura Meerkatz
 * @date 2025-10-31
 */
private static String FUNDRAISING_STRATEGY = 'FundraisingStrategy';
private static String FUNDRAISING_OPERATIONS = 'FundraisingOperationsConsole';
private static String DONOR_ENGAGEMENT = 'DonorEngagement';
private static String PROGRAM_MANAGEMENT = 'ProgramManagementConsole';
private static String VOLUNTEER_MANAGEMENT = 'VolunteerManagement';

// Put these at the top, in this order
private static List<String> PRIORITY_APPS = new List<String>{
    FUNDRAISING_STRATEGY,
    FUNDRAISING_OPERATIONS,
    DONOR_ENGAGEMENT,
    PROGRAM_MANAGEMENT,
    VOLUNTEER_MANAGEMENT
};

public static void applyOrgAppOrder() {
    // 1) Get current org-visible app menu items in current order
    //    (you used this query in your version)
    List<UserAppMenuItem> current = [
        SELECT ApplicationId, Name
        FROM UserAppMenuItem
        ORDER BY SortOrder
    ];

    // We'll build two lists:
    // - priorityIds: the ones in PRIORITY_APPS, in that exact order
    // - otherIds: everything else, in the original order
    Map<String, Id> nameToAppId = new Map<String, Id>();

    // Build name -> id from what the org actually has
    for (UserAppMenuItem item : current) {
        nameToAppId.put(item.Name, item.ApplicationId);
    }

    // 2) Add priority ones first, but only if they actually exist in current menu
    List<Id> finalOrder = new List<Id>();
    Set<Id> alreadyAdded = new Set<Id>();

    for (String wantedName : PRIORITY_APPS) {
        Id appId = nameToAppId.get(wantedName);
        if (appId != null) {
            finalOrder.add(appId);
            alreadyAdded.add(appId);
        }
    }

    // 3) Then append the rest, preserving original order
    for (UserAppMenuItem item : current) {
        if (!alreadyAdded.contains(item.ApplicationId)) {
            finalOrder.add(item.ApplicationId);
        }
    }

    // 4) Write it back at the org level
    AppLauncher.AppMenu.setOrgSortOrder(finalOrder);
}
