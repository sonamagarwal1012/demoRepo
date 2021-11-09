public with sharing class calculateSum {
    public calculateSum() {

    }
    @AuraEnabled(cacheable=true)
    public static Integer calculateSumResult (integer firstNumber, integer secondNumber){
        return firstNumber+secondNumber;
    }
}