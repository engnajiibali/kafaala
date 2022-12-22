/* 
 *********** This file is used to setup and display custom feedback messages for the client side of the Notary App ********************
*/
var FeedBackMessages = {
    contactHaadICT: "contact HAAD ICT Solutions.",
    get failedToSaveDataMsg() {
        return "Failed to save data to the database, please try again or " + this.contactHaadICT
    },
    get failedToSaveClientLogDataMsg() {
        return "Failed to save log data to the database, please try again or " + this.contactHaadICT
    },
    fillAllRequiredFieldMsg: "Please fill all required form fields!",
    requiredTextBoxMsg: function (fieldName) {
        return "Please enter " + fieldName+" !";
    },
    selectOptionMsg: function (fieldName) {
        return "Please select " + fieldName + " !";
    },
    requiredTextBoxMsgSomali: function (fieldName) {
        return "Fadlan geli " + fieldName + " !";
    },
    customErrorMsg: function (msg) {
        return msg;
    },
    failedMsg: "Operation failed, please try again. ",
    successMsg: "Record Successfully Saved. ",
    failedToLoadDataMsg: function (dataContext) {
        return "Error : Failed to Load " + dataContext + ", please try again or " + this.contactHaadICT
    },
    errorWhileFetchingDataMsg: function (dataContext) {
        return "An error occur while fetching " + dataContext + ", please try again or " + this.contactHaadICT
    },
    errorWhileLoadingDataMsg: function (dataContext) {
        return "An error occur while loading " + dataContext + ", please try again or " + this.contactHaadICT
    },
    failedDeleteMsg: "Delete Operation Failed, please try Again Later.",
    get failedToInitializeControl() {
        return "Error : Failed to initialize controls, please try again or " + this.contactHaadICT
    },
    get failedToInitializeSomeControl() {
        return "Error : Failed to initialize some controls, please try again or " + this.contactHaadICT
    },
    invalidName: "Invalid Name, Please enter a valid Name",
    error_message: "An error occured, please contact HAAD ICT Solutions",
    loginFailed: "Login Failed ! ",
    invalidUsername: "Invalid Username",
    invalidPassword: "Invalid Password",
    accessDenied: "Access Denied, You are not permitted to access this page, please contact administration.",
    AdminPrevillagesNeeded: "Access Denied, you need admin privileges to access this page.",
    recordDoesntExist: function(id) {
        return "Error !.. Record with this id: " + id + " doesnt exists";
    },
    disabledUserAccountMsg: "Your account has been disabled, please contact your administrator!"
};

