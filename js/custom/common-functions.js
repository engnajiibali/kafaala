
//////// Date Formats //////
var dateFormats = {
    dayMonthYear: "dd/mm/yyyy",
    monthDayYear: "mm/dd/yyyy",
    yearMonthDay: "yyyy/mm/dd",
    yearDayMonth: "yyyy/dd/mm"
};

/////// Default dateFormat ////////
var defaultDateFormat = dateFormats.dayMonthYear;

var datepickerOptions = {
    todayBtn: "linked",
    orientation: $('body').hasClass('right-to-left') ? "auto right" : 'auto auto',
    format: window.defaultDateFormat
}

/* ========= Clear jQuery Datatable Data ========= */
function ClearDataTableData(dataTableID) {
    var dataTable = $("#" + dataTableID).DataTable();

    dataTable.fnClearTable();
    dataTable.fnDraw();
    dataTable.fnDestroy();
}

/* ========= Save Form Data to the Database ========= */
function SendDataViaAjax(url, data, buttonID) {
    
    $.ajax({
        type: "POST",
        url: url,
        data: JSON.stringify(data),
        contentType: "application/json",
        dataType: "json",
        async: false,
        success: function (data) {
            var dataReturned = $.parseJSON(data.d);
            var MessageType = dataReturned._MessageType;
            var ClearFields = dataReturned._ClearFields;

            switch (MessageType.trim()) {
                case 'Success':
                    ShowMessage(dataReturned._Message, dataReturned._MessageType, dataReturned._NotificationPlugin);
                    $("#" + buttonID).removeAttr("disabled");
                    if (ClearFields == true) {
                        clearTextBox();
                    }
                    break;
                case 'Error':
                    ShowMessage(dataReturned._Message, dataReturned._MessageType, dataReturned._NotificationPlugin);
                    $("#" + buttonID).removeAttr("disabled");
                    if (ClearFields == true) {
                        clearTextBox();
                    }
                    break;
                case 'Warning':
                    ShowMessage(dataReturned._Message, dataReturned._MessageType, dataReturned._NotificationPlugin);
                    $("#" + buttonID).removeAttr("disabled");
                    if (ClearFields == true) {
                        clearTextBox();
                    }
                    break;
                default:
                    ShowMessage(dataReturned._Message, dataReturned._MessageType, dataReturned._NotificationPlugin);
                    $("#" + buttonID).removeAttr("disabled");
                    if (ClearFields == true) {
                        clearTextBox();
                    }
            }

        },
        error: function (xhr, status, e) {
            //alert("Error while inserting : " + xhr.responseText);
            console.log(xhr.responseText);
            var errorMsg = "Error while inserting : " + xhr.responseText;
            var msgType = "Error";
            var msgPlugin = "Toastr";
            ShowMessage(errorMsg, msgType, msgPlugin);
        }
    }); //End: AJAX
    
}

/* ========= Save Form Data to the Database ========= */
function SendDataViaAjaxWithFeedback(url, data, buttonID) {

    $.ajax({
        type: "POST",
        url: url,
        data: JSON.stringify(data),
        contentType: "application/json",
        dataType: "json",
        async: false,
        success: function (data) {
            var dataReturned = $.parseJSON(data.d);
            
            //console.log(dataReturned);
            
            switch (dataReturned.MessageType.trim()) {
                case 'Success':
                    ShowMessage(dataReturned.ReturnMessage, dataReturned.MessageType, dataReturned.PluginName);
                    $("#" + buttonID).removeAttr("disabled");
                    clearTextBox();
                    break;
                case 'Error':
                    ShowMessage(dataReturned.ReturnMessage, dataReturned.MessageType, dataReturned.PluginName);
                    $("#" + buttonID).removeAttr("disabled");
                    ResetSaveButton();
                    break;
                case 'Warning':
                    ShowMessage(dataReturned.ReturnMessage, dataReturned.MessageType, dataReturned.PluginName);
                    $("#" + buttonID).removeAttr("disabled");
                    ResetSaveButton();
                    break;
                default:
                    ShowMessage(dataReturned.ReturnMessage, dataReturned.MessageType, dataReturned.PluginName);
                    $("#" + buttonID).removeAttr("disabled");
                    ResetSaveButton();
            }

        },
        error: function (xhr, status, e) {
            console.log(xhr.responseText);
            var errorMsg = "Error while inserting : " + xhr.responseText;
            var msgType = "Error";
            var msgPlugin = "Toastr";
            ShowMessage(errorMsg, msgType, msgPlugin);
        }
    }); //End: AJAX

}

function ReloadPage() {
    window.location.reload(1);
}

function ResetSaveButton(buttonId) {
    $('button[id="' + buttonId + '"], input[id="' + buttonId + '"]').prop('disabled', false);
    $('button[id="' + buttonId + '"], input[id="' + buttonId + '"]').text("Save changes");
}

function ShowMessage(message, messagetype, plugin) {
    var cssclass;

    if (plugin == "Bootstrap") {
        switch (messagetype) {
            case 'Success':
                cssclass = 'alert-success'
                break;
            case 'Error':
                cssclass = 'alert-danger'
                break;
            case 'Warning':
                cssclass = 'alert-warning'
                break;
            default:
                cssclass = 'alert-info'
        }
        $('#AlertContainer').append('<div class="alert fade in ' + cssclass + '"><button class="close" data-dismiss="alert">×</button><strong>' + messagetype + '!</strong> <span>' + message + '</span></div>');
    }

    if (plugin == "Toastr") {
        switch (messagetype) {
            case 'Success':
                toastr["success"](message, "Success Message");
                break;
            case 'Error':
                toastr["error"](message, "Error Message");
                break;
            case 'Warning':
                toastr["warning"](message, "Warning Message");
                break;
            case 'Info':
                toastr["info"](message, "Information Message");
                break;
            default:
                toastr["info"](message, "Information Message");
        }
    }

    if (plugin == "Lobibox") {
        switch (messagetype) {
            case 'Success':
                cssclass = 'success'
                break;
            case 'Error':
                cssclass = 'error'
                break;
            case 'Warning':
                cssclass = 'warning'
                break;
            case 'info':
                cssclass = 'info'
                break;
            default:
                cssclass = 'info'
        }

        Lobibox.notify(cssclass, {
            showClass: 'rollIn',
            hideClass: 'rollOut',
            position: 'bottom right',
            delay: 4000,
            msg: message
        });
    }

    if (plugin == "Overhang" || plugin == "OverHang" || plugin == "OverhangJS" || plugin == "OverHangJS") {
        switch (messagetype) {
            case 'Success':
                cssclass = 'success'
                break;
            case 'Error':
                cssclass = 'error'
                break;
            case 'Warning':
                cssclass = 'warn'
                break;
            case 'info':
                cssclass = 'info'
                break;
            default:
                cssclass = 'info'
        }

        $("body").overhang({
            type: cssclass,
            message: message,
            duration: 3,
            overlay: true,
            closeConfirm: "false"
        });
    }
}

function DisplayBreadcrumbMenus(pageURL) {
    DataToSend = {
        PageURL: pageURL
    };

    $.ajax({
        type: "POST",
        url: "WebService.asmx/ShowBreadcrumbMenus",
        data: JSON.stringify(DataToSend),
        contentType: "application/json",
        dataType: "json",
        success: function (data) {
            for (var i = 0; i < data.d.length; i++) {
                $(".page_title").text(data.d[i].MenuName);
                $("#page_menu_name").text(data.d[i].MainMenuName);
            }
        },
        error: function (xhr, status, e) { alert("Error occur while fetching Menu Breadcrumb : " + xhr.responseText); }
    });
}

function ShowPreloader(elementID) {
    $("#" + elementID).LoadingOverlay("show", {
        background: "rgba(165, 190, 100, 0.5)"
    });
}

function HidePreloader(elementID) {
    $("#" + elementID).LoadingOverlay("hide", true);
}

function InitializeCKEditor() {
    // Replace the <textarea id="editor1"> with a CKEditor
    // instance, using default configuration.
    CKEDITOR.replace('txtTemplateText', {
        height: ['500px']
    });
    // Set editor width to 100% and height to 350px.
    //CKEDITOR.instances['txtTemplateText'].resize('100%', '350', true);
}

function DestroyCKEditor() {
    for (instance in CKEDITOR.instances) {
        CKEDITOR.instances[instance].destroy();
    }
}

function ClearCKEditor() {
    for (instance in CKEDITOR.instances) {
        //CKEDITOR.instances[instance].updateElement();
        CKEDITOR.instances[instance].setData(' ');
    }
}

/* ========= Get URL Parameters in jQuery ========= */
var getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = window.location.search.substring(1),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
        }
    }
};

/* ========= Get URL Parameters in jQuery. Usage var foo = getUrlParameterByName('foo'); ========= */
function getUrlParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, '\\$&');
    var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, ' '));
}

function PrintThis(DivID, TitleMsg) {
    var disp_setting = "toolbar=yes,location=no,";
    disp_setting += "directories=yes,menubar=yes,";
    disp_setting += "scrollbars=yes,width=650, height=600, left=100, top=25";
    var content_vlue = document.getElementById(DivID).innerHTML;
    var docprint = window.open("", "", disp_setting);
    docprint.document.open();
    docprint.document.write('<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"');
    //docprint.document.write('"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">');
    //docprint.document.write('<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">');
    docprint.document.write('<head><title>' + TitleMsg + '</title>');
    docprint.document.write('<style type="text/css">body{ margin:0px;');
    docprint.document.write('font-family:verdana,Arial;color:#000;');
    docprint.document.write('font-family:Verdana, Geneva, sans-serif; font-size:12px;}');
    docprint.document.write('a{color:#000;text-decoration:none;} </style>');
    docprint.document.write('</head><body onLoad="self.print()"><center>');
    docprint.document.write(content_vlue);
    docprint.document.write('</center></body></html>');
    docprint.document.close();
    docprint.focus();
}

/* Define function for escaping user input to be treated as 
   a literal string within a regular expression */
function escapeRegExp(string) {
    return string.replace(/[.*+?^${}()|[\]\\]/g, "\\$&");
}

/* Define functin to find and replace specified term with replacement string */
function replaceAll(str, term, replacement) {
    return str.replace(new RegExp(escapeRegExp(term), 'g'), replacement);
}


///// This function takes int/double values & returns as thousand comma separed values.
///// for example: if you pass 12500.00 it will return as 12,500.00
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
} // end of numberWithCommas function

function formatDate(date) {
    var monthNames = [
        "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"
    ];

    var day = date.getDate();
    var monthIndex = date.getMonth();
    var year = date.getFullYear();

    return (monthNames[monthIndex] + ' ' + day + ', ' + year);
}

function GetFirstDayOfCurrentMonth() {
    var date = new Date();
    var dd = '01'; //date.getDate();
    var mm = date.getMonth() + 1; //January is 0!
    var yyyy = date.getFullYear();

    if (mm < 10) {
        mm = '0' + mm
    }

    return GetDefaultDateFormat(yyyy, mm, dd);
}

function GetCurrentDate() {
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth() + 1; //January is 0!
    var yyyy = today.getFullYear();

    if (dd < 10) {
        dd = '0' + dd
    }

    if (mm < 10) {
        mm = '0' + mm
    }

    return GetDefaultDateFormat(yyyy, mm, dd);
}

function GetCurrentDateWithSpecificFormat(format) {
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth() + 1; //January is 0!
    var yyyy = today.getFullYear();

    if (dd < 10) {
        dd = '0' + dd
    }

    if (mm < 10) {
        mm = '0' + mm
    }

    return GetSpecificDateFormat(format, yyyy, mm, dd);
}

function GetSpecificDateFormat(format, yyyy, mm, dd) {
    var date = new Date();
    switch (format) {
        case dateFormats.dayMonthYear:
            date = dd + '/' + mm + '/' + yyyy;
            break;
        case dateFormats.monthDayYear:
            date = mm + '/' + dd + '/' + yyyy;
            break;
        case dateFormats.yearMonthDay:
            date = yyyy + '/' + mm + '/' + dd;
            break;
        case dateFormats.yearDayMonth:
            date = yyyy + '/' + dd + '/' + mm;
            break;
        default:
            date = dd + '/' + mm + '/' + yyyy;
    }
    return date;
}

//////// Get Default Date Format ///////
function GetDefaultDateFormat(yyyy, mm, dd) {
    var date = new Date();
    switch (window.defaultDateFormat) {
        case dateFormats.dayMonthYear:
            date = dd + '/' + mm + '/' + yyyy;
            break;
        case dateFormats.monthDayYear:
            date = mm + '/' + dd + '/' + yyyy;
            break;
        case dateFormats.yearMonthDay:
            date = yyyy + '/' + mm + '/' + dd;
            break;
        case dateFormats.yearDayMonth:
            date = yyyy + '/' + dd + '/' + mm;
            break;
        default:
            date = dd + '/' + mm + '/' + yyyy;
    }
    return date;
}

///// Removes slashes from C# DateTime value
function RemoveDateCharacters(string) {
    var str = string;
    str = str.substring(6); // Removing first 6 characters from string
    str = str.slice(0, -2); // Removing last character from string
    return str;
}

function FormatThisDate(DateInt, format) {
    var date = new Date(parseInt(DateInt));
    var dd = date.getDate();
    var mm = date.getMonth() + 1; //January is 0!
    var yyyy = date.getFullYear();

    if (dd < 10) {
        dd = '0' + dd
    }

    if (mm < 10) {
        mm = '0' + mm
    }

    switch (format) {
        case 'dd/mm/yyyy':
            date = dd + '/' + mm + '/' + yyyy;
            break;
        case 'mm/dd/yyyy':
            date = mm + '/' + dd + '/' + yyyy;
            break;
        case 'yyyy/mm/dd':
            date = yyyy + '/' + mm + '/' + dd;
            break;
        case 'yyyy/dd/mm':
            date = yyyy + '/' + dd + '/' + mm;
            break;
        default:
            date = dd + '/' + mm + '/' + yyyy;
    }
    return date;
}

function FormatThisDateAsIWant(date, format) {
    var returnDate = new Date(date);
    var dd = returnDate.getDate();
    var mm = returnDate.getMonth() + 1; //January is 0!
    var yyyy = returnDate.getFullYear();

    if (dd < 10) {
        dd = '0' + dd
    }

    if (mm < 10) {
        mm = '0' + mm
    }

    switch (format) {
        case 'dd/mm/yyyy':
            returnDate = dd + '/' + mm + '/' + yyyy;
            break;
        case 'mm/dd/yyyy':
            returnDate = mm + '/' + dd + '/' + yyyy;
            break;
        case 'yyyy/mm/dd':
            returnDate = yyyy + '/' + mm + '/' + dd;
            break;
        case 'yyyy/dd/mm':
            returnDate = yyyy + '/' + dd + '/' + mm;
            break;
        default:
            returnDate = dd + '/' + mm + '/' + yyyy;
    }
    return returnDate;
}

////// This function will handle conversion of serialized C# Date "/Date(1425408717000)/" into javascript specific date
function HandleSerializedCSharpDate(cSharpDate) {
    //var cSharpDate = "/Date(1425408717000)/"
    var jsDate = new Date(parseInt(cSharpDate.replace(/[^0-9 +]/g, '')));
    return jsDate;
}

/////////////////////////////////////////////////////
///////// C# DateTime to Javascript Date ///////////
//var dotNetDate = "/Date(1373555464883)/";
//var javaScriptDate = new Date(parseInt(dotNetDate.substr(6)));
//console.log(javaScriptDate);
//console.log(javaScriptDate.toLocaleFormat());

function HandleCSharpDate(CSharpDate) {
    var jsDate = new Date(parseInt(CSharpDate.substr(6)));
    var convertedJsDate = ((jsDate.getUTCDate() < 10) ? '0' + jsDate.getUTCDate() : jsDate.getUTCDate()) +
        "-" + (((jsDate.getMonth() + 1) < 10) ? '0' + (jsDate.getMonth() + 1) : (jsDate.getMonth() + 1)) +
        "-" + jsDate.getFullYear() + " " + jsDate.toLocaleTimeString();
    return convertedJsDate;
}

function HandleCSharpDateWithoutTime(CSharpDate) {
    var jsDate = new Date(parseInt(CSharpDate.substr(6)));
    var convertedJsDate = ((jsDate.getUTCDate() < 10) ? '0' + jsDate.getUTCDate() : jsDate.getUTCDate()) +
        "/" + (((jsDate.getMonth() + 1) < 10) ? '0' + (jsDate.getMonth() + 1) : (jsDate.getMonth() + 1)) +
        "/" + jsDate.getFullYear();
    return convertedJsDate;
}

////// Escaping Strings in JavaScript: For exmaple 
////// This is a demo string with 'single-quotes' and "double-quotes".
////// would become
//////This is a demo string with \'single-quotes\' and \"double-quotes\".
function addslashes(str) {
    return (str + '').replace(/[\\"']/g, '\\$&').replace(/\u0000/g, '\\0');
}