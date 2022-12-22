
/* **************************************************************************
   **************************** COMMON METHODS ******************************
   ************************************************************************** */

/* ========= Fill Document Types With Dropdown List ========== */
function FillDocumentTypesWithDropdown(DropdownListID) {
    if (DropdownListID !== undefined) {
        ajaxifyToDropDown(DropdownListID, "DataLoader.aspx/FillDocumentTypesWithDropdown", DropdownListID);
    } else {
        ShowMessage("Error: FillDocumentTypesWithDropdown() method requires DropdownListID!", "Error", GetActiveNotificationPlugin());
    }
}

/* ========= Fill Currencies With Dropdown List ========== */
function FillCurrenciesWithDropdown(DropdownListID) {
    if (DropdownListID !== undefined) {
        ajaxifyToDropDownWithDefault(DropdownListID, "DataLoader.aspx/FillCurrenciesWithDropdown", DropdownListID);
    } else {
        ShowMessage("Error: FillCurrenciesWithDropdown() method requires DropdownListID!", "Error", GetActiveNotificationPlugin());
    }
}

/* ========= Fill Accounts With Dropdown List ========== */
function FillAccountsWithDropdown(DropdownListID) {
    if (DropdownListID !== undefined) {
        ajaxifyToDropDown(DropdownListID, "DataLoader.aspx/FillAccountsWithDropdown", DropdownListID);
    } else {
        ShowMessage("Error: FillAccountsWithDropdown() method requires DropdownListID!", "Error", GetActiveNotificationPlugin());
    }
}






/* **************************************************************************
   **************************** HELPER METHODS ******************************
   ************************************************************************** */

/* ========= Get Active Notification Plugin Name ========== */
function GetActiveNotificationPlugin() {
    var ActivePlugin = "Toastr";
    $.ajax({
        type: "POST",
        url: "DataLoader.aspx/GetActiveNotificationPlugin",
        contentType: "application/json",
        dataType: "json",
        async: false,
        cache: false,
        success: function (data) {
            //var dataReturned = $.parseJSON(data.d);            
            ActivePlugin = data.d;
        },
        error: function (xhr, status, e) {
            ShowMessage(xhr.responseText, "Error", ActivePlugin);
        }
    }); // end: ajax

    return ActivePlugin;
}

/* ========= Load DropdownList Value From the Database ========= */
function ajaxifyToDropDown(dropdownID, url, preloaderElemID) {
    var ddlElement = $("#" + dropdownID);
    ddlElement.empty();
    $.ajax({
        type: "POST",
        url: url,
        contentType: "application/json",
        dataType: "json",
        async: true,
        cache: false,
        beforeSend: function () {
            /// enable loader
            ShowPreloader(dropdownID);
        },
        success: function (data) {
            var dataReturned = $.parseJSON(data.d);
            //ddlElement.append($('<option/>', { value: -1, text: '... Select Option ...' }));
            ddlElement.append($('<option/>', { value: "", text: "" }));

            $(dataReturned).each(function (index, d) {
                ddlElement.append($('<option/>', { value: d.OptionValue, text: d.OptionText }));
            });
        },
        error: function (xhr, status, e) {
            ShowMessage("An Error occur while fetching data, please try again!", "Error", GetActiveNotificationPlugin());
        },
        complete: function () {
            /// Apply to Select2 functionality
            $("#" + dropdownID).select2({
                width: '100%'
            });

            /// disable loader
            HidePreloader(dropdownID);
        }
    }); // end: ajax
}

/* ========= Load DropdownList Value From the Database ========= */
function ajaxifyToDropDownWithDefault(dropdownID, url, preloaderElemID) {
    var ddlElement = $("#" + dropdownID);
    ddlElement.empty();
    $.ajax({
        type: "POST",
        url: url,
        contentType: "application/json",
        dataType: "json",
        async: true,
        cache: false,
        beforeSend: function () {
            /// enable loader
            ShowPreloader(dropdownID);
        },
        success: function (data) {
            var dataReturned = $.parseJSON(data.d);
            ddlElement.append($('<option/>', { value: -1, text: '... Select Option ...' }));
            //ddlElement.append($('<option/>', { value: "", text: "" }));

            $(dataReturned).each(function (index, d) {
                ddlElement.append($('<option/>', { value: d.OptionValue, text: d.OptionText }));
            });
        },
        error: function (xhr, status, e) {
            ShowMessage("An Error occur while fetching data, please try again!", "Error", GetActiveNotificationPlugin());
        },
        complete: function () {
            /// Apply to Select2 functionality
            $("#" + dropdownID).select2({
                width: '100%'
            });

            /// disable loader
            HidePreloader(dropdownID);
        }
    }); // end: ajax
}

/* ========= Load DropdownList Value From the Database ========= */
function ajaxifyToDropDowns(dropdownListIDStartsWith, url) {
    $.ajax({
        type: "POST",
        url: url,
        contentType: "application/json",
        dataType: "json",
        async: true,
        cache: true,
        beforeSend: function () {
            /// enable loader
            $('[id^="' + dropdownListIDStartsWith + '"]').each(function () {
                ShowPreloader(this.id);
            });
        },
        success: function (data) {
            var dataReturned = $.parseJSON(data.d);

            $('[id^="' + dropdownListIDStartsWith+'"]').each(function () {

                var ddlElement = $("#" + this.id);
                ddlElement.append($('<option/>', { value: -1, text: '... Select Option ...' }));

                $(dataReturned).each(function (index, d) {
                    ddlElement.append($('<option/>', { value: d.OptionValue, text: d.OptionText }));
                });

                /// Apply to Select2 functionality
                ddlElement.select2();
            });
        },
        error: function (xhr, status, e) {
            ShowMessage("An Error occur while fetching data, please try again!", "Error", GetActiveNotificationPlugin());
        },
        complete: function () {
            /// disable loader
            $('[id^="' + dropdownListIDStartsWith + '"]').each(function () {
                HidePreloader(this.id);
            });
        }
    }); // end: ajax
}


