library(salesforcer)
library(knitr)
library(RForcecom)
username <- "christine.iyer@maine.edu"
password <- "1Edithandoliver"
securityToken <- "iFhpXgaXnuP3L5PQr69Zw2yOy"
instanceURL <- "https://login.salesforce.com/"
apiVersion <- "44.0"

#auth <- sf_auth(username = username, password = password, security_token = securityToken,
#login_url = getOption("https://login.salesforce.com/"))



session <- sf_auth(username, password, securityToken, instanceURL, apiVersion)
username <- "christine.iyer@maine.edu"
password <- "1EdithandoliveriFhpXgaXnuP3L5PQr69Zw2yOy"
#securityToken <- ""
instanceURL <- "https://na24.salesforce.com/"
apiVersion <- "44.0"





session <- rforcecom.login(username, password, instanceURL,apiVersion  ) 

my_soql <- sprintf("SELECT Id,
                           CreatedDate,
                           Email, 
                           FirstName, 
                           LastName,
                           TargetX_SRMb__Status__c, TargetX_SRMb__Student_Type__c,
                           TargetX_SRMb__Anticipated_Start_Term__c,
                           TargetX_SRMb__Anticipated_Start_Term_Year__c, 
                           TargetX_SRMb__Anticipated_Start_Year__c,
                           App_Application_Date__c,  
                           TargetX_SRMb__Gender__c,  
                           TargetX_SRMb__Last_Data_Input_Source__c,                                                                Initial_Source_Date__c, 
                           Initial_Referral_Source__c, 
                           Recruiting_Category__c,
                           Ref__c, 
                           Primary_State_Code__c
                           
                    FROM Contact 
                    WHERE DAY_ONLY(CreatedDate) > 2019-12-01 AND DAY_ONLY(CreatedDate) < 2019-12-06 AND TargetX_SRMb__Status__c != 'Lead' 
                    AND Recruiting_Category__c != ' '")

queried_records <- sf_query(my_soql)
write.csv(queried_records,"C:/Users/christine.iyer/Box/GeneralPurposeSearch/SF_Requests/FYNovember.csv")
