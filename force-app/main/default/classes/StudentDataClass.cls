public class StudentDataClass {
    public static void studentAddData(Integer Age, String Name){
        Studentt__c newStudent = new Studentt__c();
        newStudent.Age__c=Age;
        newStudent.Name=Name;
        Insert newStudent;
    }
    
    public static List<Id> olderStudentIds = new List<Id>();
    public static void olderThan_18(List<Studentt__c> students) {
        for (Studentt__c stud : students) {          
            if (stud.Age__c > 18) {
                olderStudentIds.add(stud.Id);
            }
        }        
        System.debug('olderStudentIds'+olderStudentIds);
    }
}


/*List<Studentt__c>  stu = [Select Id, Age__c from Studentt__c];
StudentDataClass.olderThan_18(stu);
System.debug(StudentDataClass.olderStudentIds);*/