public static void resetFundraisingData() {
    delete [ SELECT Id FROM GiftTransaction ];
    delete [ SELECT Id FROM OutreachSourceCode ];
}

public static void resetCaseManagementData() {
    delete [SELECT Id FROM GoalAssignment];
    delete [SELECT Id FROM CarePlanDetail];

    List<CarePlan> cps = [SELECT CarePlanTemplateId, Id FROM CarePlan WHERE CarePlanTemplateId != null];
    for (CarePlan cp : cps) {
        cp.CarePlanTemplateId = null;
    }
    update cps;

    List<CarePlanTemplate> cpts = [SELECT Id, Status FROM CarePlanTemplate];
    List<CarePlanTemplate> cptsToUpdate = new List<CarePlanTemplate>();
    for (CarePlanTemplate cpt : cpts) {
        if (cpt.Status == 'Published') {
            cpt.Status = 'Inactive';
            cptsToUpdate.add(cpt);
        }
    }
    if (!cptsToUpdate.isEmpty()) {
        update cptsToUpdate;
    }

    delete cpts;

    delete [SELECT Id FROM GoalDefinition];
    delete [SELECT Id FROM CodeSetBundle WHERE Name = 'Basic Stability Barriers'];
    delete [SELECT Id FROM CodeSet WHERE Code LIKE '%DEMO'];

}