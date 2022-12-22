///////////// Report Levels in Pixels ////////////
var LevelPixels = {
    Level1: {
        'margin-left': '9px',
        'padding-left': '5px'
    },
    Level2: {
        'margin-left': '18px',
        'padding-left': '5px'
    },
    Level3: {
        'margin-left': '27px',
        'padding-left': '7px'
    },
    Level4: {
        'margin-left': '36px',
        'padding-left': '9px'
    },
    Level5: {
        'margin-left': '45px',
        'padding-left': '11px'
    },
    Level6: {
        'margin-left': '54px',
        'padding-left': '13px'
    },
    Level7: {
        'margin-left': '63px',
        'padding-left': '15px'
    }
};

function GetLevel1Markup(arrayContent, originalArray) {
    var output = '';
    
    if (arrayContent === undefined || arrayContent === null || arrayContent.length == 0) {
        // array empty or does not exist
        return output;
    } else {

        arrayContent.forEach(function (arrayElem, index) {

            output += '   <div role="row" class="dgrid-row dgrid-row-even ui-state-default rootHeader" data-total="$' + numberWithCommas((arrayElem.Balance).toFixed(window.decimalPoints)) + '">';
            output += '       <table class="dgrid-row-table" role="presentation">';
            output += '           <tbody>';
            output += '               <tr>';
            output += '                   <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-0 black left " role="gridcell" style="padding-left: ' + LevelPixels.Level1["padding-left"] + ';">';
            output += '                       <div class="dgrid-expando-icon ui-icon ui-icon-triangle-1-se" style="margin-left: ' + LevelPixels.Level1["margin-left"] + '; float: left;">&nbsp;</div>';
            output += '                       ' + arrayElem.AccountName;
            output += '                   </td>';
            output += '                   <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-1 black left wrap" role="gridcell"></td>';
            output += '               </tr>';
            output += '           </tbody>';
            output += '       </table>';
            output += '   </div>';

            output += '   <div class="dgrid-tree-container" style="display: block;">';

            output += GetLevel2Markup(arrayElem.ChildAccountDetails);

            //////////// Group Total /////////////
            output += '   <div role="row" class="dgrid-row ui-state-default dgrid-row-even">';
            output += '       <table class="dgrid-row-table" role="presentation">';
            output += '           <tbody>';
            output += '               <tr>';
            output += '                   <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-0 black left  totalRow bold" role="gridcell" style="padding-left: ' + LevelPixels.Level1["padding-left"] + ';">';
            output += '                       <div class="dgrid-expando-icon" style="margin-left: ' + LevelPixels.Level1["margin-left"] + '; float: left;">&nbsp;</div>';
            output += '                       Total ' + arrayElem.AccountName;
            output += '                   </td>';
            output += '                   <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-1 right wrap totalRow bold" role="gridcell">';
            output += '                       <a class="black" style="float: right;">$' + numberWithCommas((arrayElem.Balance).toFixed(window.decimalPoints)) + '</a>';
            output += '                   </td>';
            output += '               </tr>';
            output += '           </tbody>';
            output += '       </table>';
            output += '   </div>';

            output += '   </div>'; // end of /.dgrid-tree-container

        });

        return output;
    }
}

function GetLevel2Markup(arrayContent) {
    var output = '';
    
    if (arrayContent === undefined || arrayContent === null || arrayContent.length == 0) {
        // array empty or does not exist
        return output;
    } else {

        arrayContent.forEach(function (arrayElem, index) {
            
            if (arrayElem.AccountPosition == "GENERAL") {
                
                output += '   <div role="row" class="dgrid-row dgrid-row-even ui-state-default rootHeader" data-total="$' + numberWithCommas((arrayElem.Balance).toFixed(window.decimalPoints)) + '">';
                output += '       <table class="dgrid-row-table" role="presentation">';
                output += '           <tbody>';
                output += '               <tr>';
                output += '                   <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-0 black left " role="gridcell" style="padding-left: ' + LevelPixels.Level2["padding-left"] + ';">';
                output += '                       <div class="dgrid-expando-icon ui-icon ui-icon-triangle-1-se" style="margin-left: ' + LevelPixels.Level2["margin-left"] + '; float: left;">&nbsp;</div>';
                output += '                       ' + arrayElem.AccountName;
                output += '                   </td>';
                output += '                   <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-1 black left wrap" role="gridcell"></td>';
                output += '               </tr>';
                output += '           </tbody>';
                output += '       </table>';
                output += '   </div>';

                output += '   <div class="dgrid-tree-container" style="display: block;">';

                output += GetLevel3Markup(arrayElem.ChildAccountDetails, arrayElem.AccountName, arrayElem.Balance);

                output += '   </div>';
            }

            if (arrayElem.AccountPosition == "DETAIL") {
                
                output += '   <div role="row" class="dgrid-row dgrid-row-odd ui-state-default">';
                output += '       <table class="dgrid-row-table" role="presentation">';
                output += '           <tbody>';
                output += '               <tr>';
                output += '                   <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-0 black left " role="gridcell" style="padding-left: ' + LevelPixels.Level2["padding-left"] + ';">';
                output += '                       <div class="dgrid-expando-icon" style="margin-left: ' + LevelPixels.Level2["margin-left"] + '; float: left;">&nbsp;</div>';
                output += '                       ' + arrayElem.AccountName;
                output += '                   </td>';
                output += '                   <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-1 right wrap" role="gridcell">';
                output += '                       <a class="black" style="float: right;">' + numberWithCommas((arrayElem.Balance).toFixed(window.decimalPoints)) + '</a>';
                output += '                   </td>';
                output += '               </tr>';
                output += '           </tbody>';
                output += '       </table>';
                output += '   </div>';
            }

        });

        return output;
    }
}

function GetLevel3Markup(arrayContent, accountName, accountBalance) {
    var output = '';
    
    if (arrayContent === undefined || arrayContent === null || arrayContent.length == 0) {
        // array empty or does not exist
        return output;
    } else {

        arrayContent.forEach(function (arrayElem, index) {

            if (arrayElem.AccountPosition == "GENERAL") {
                output += '   <div role="row" class="dgrid-row dgrid-row-even ui-state-default rootHeader" data-total="$' + numberWithCommas((arrayElem.Balance).toFixed(window.decimalPoints)) + '">';
                output += '       <table class="dgrid-row-table" role="presentation">';
                output += '           <tbody>';
                output += '               <tr>';
                output += '                   <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-0 black left " role="gridcell" style="padding-left: ' + LevelPixels.Level3["padding-left"] + ';">';
                output += '                       <div class="dgrid-expando-icon ui-icon ui-icon-triangle-1-se" style="margin-left: ' + LevelPixels.Level3["margin-left"] + '; float: left;">&nbsp;</div>';
                output += '                       ' + arrayElem.AccountName;
                output += '                   </td>';
                output += '                   <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-1 black left wrap" role="gridcell"></td>';
                output += '               </tr>';
                output += '           </tbody>';
                output += '       </table>';
                output += '   </div>';

                output += '   <div class="dgrid-tree-container" style="display: block;">';

                output += GetLevel4Markup(arrayElem.ChildAccountDetails, arrayElem.AccountName, arrayElem.Balance);

                output += '   </div>';
            }

            if (arrayElem.AccountPosition == "DETAIL") {
                output += '   <div role="row" class="dgrid-row dgrid-row-odd ui-state-default">';
                output += '       <table class="dgrid-row-table" role="presentation">';
                output += '           <tbody>';
                output += '               <tr>';
                output += '                   <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-0 black left " role="gridcell" style="padding-left: ' + LevelPixels.Level3["padding-left"] + ';">';
                output += '                       <div class="dgrid-expando-icon" style="margin-left: ' + LevelPixels.Level3["margin-left"] + '; float: left;">&nbsp;</div>';
                output += '                       ' + arrayElem.AccountName;
                output += '                   </td>';
                output += '                   <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-1 right wrap" role="gridcell">';
                output += '                       <a class="black" style="float: right;">' + numberWithCommas((arrayElem.Balance).toFixed(window.decimalPoints)) + '</a>';
                output += '                   </td>';
                output += '               </tr>';
                output += '           </tbody>';
                output += '       </table>';
                output += '   </div>';
            }

        });


        output += '   <div role="row" class="dgrid-row ui-state-default dgrid-row-odd">';
        output += '       <table class="dgrid-row-table" role="presentation">';
        output += '           <tbody>';
        output += '               <tr>';
        output += '                   <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-0 black left  totalRow bold " role="gridcell" style="padding-left: ' + LevelPixels.Level2["padding-left"] + ';">';
        output += '                       <div class="dgrid-expando-icon" style="margin-left: ' + LevelPixels.Level2["margin-left"] + '; float: left;">&nbsp;</div>';
        output += '                       Total ' + accountName;
        output += '                   </td>';
        output += '                   <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-1 right wrap totalRow bold" role="gridcell">';
        output += '                       <a class="black" href="' + window.TransactionReportURL + '" style="float: right;">$' + numberWithCommas((accountBalance).toFixed(window.decimalPoints)) + '</a>';
        output += '                   </td>';
        output += '               </tr>';
        output += '           </tbody>';
        output += '       </table>';
        output += '   </div>';

        return output;
    }

}

function GetLevel4Markup(arrayContent, accountName, accountBalance) {
    var output = '';

    if (arrayContent === undefined || arrayContent === null || arrayContent.length == 0) {
        // array empty or does not exist
        return output;
    } else {

        arrayContent.forEach(function (arrayElem, index) {

            if (arrayElem.AccountPosition == "GENERAL") {
                output += '   <div role="row" class="dgrid-row dgrid-row-even ui-state-default rootHeader" data-total="$' + numberWithCommas((arrayElem.Balance).toFixed(window.decimalPoints)) + '">';
                output += '       <table class="dgrid-row-table" role="presentation">';
                output += '           <tbody>';
                output += '               <tr>';
                output += '                   <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-0 black left " role="gridcell" style="padding-left: ' + LevelPixels.Level4["padding-left"] + ';">';
                output += '                       <div class="dgrid-expando-icon ui-icon ui-icon-triangle-1-se" style="margin-left: ' + LevelPixels.Level4["margin-left"] + '; float: left;">&nbsp;</div>';
                output += '                       ' + arrayElem.AccountName;
                output += '                   </td>';
                output += '                   <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-1 black left wrap" role="gridcell"></td>';
                output += '               </tr>';
                output += '           </tbody>';
                output += '       </table>';
                output += '   </div>';

                output += '   <div class="dgrid-tree-container" style="display: block;">';

                output += GetLevel5Markup(arrayElem.ChildAccountDetails, arrayElem.AccountName, arrayElem.Balance);

                output += '   </div>';
            }

            if (arrayElem.AccountPosition == "DETAIL") {
                output += '   <div role="row" class="dgrid-row dgrid-row-odd ui-state-default">';
                output += '       <table class="dgrid-row-table" role="presentation">';
                output += '           <tbody>';
                output += '               <tr>';
                output += '                   <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-0 black left " role="gridcell" style="padding-left: ' + LevelPixels.Level4["padding-left"] + ';">';
                output += '                       <div class="dgrid-expando-icon" style="margin-left: ' + LevelPixels.Level4["margin-left"] + '; float: left;">&nbsp;</div>';
                output += '                       ' + arrayElem.AccountName;
                output += '                   </td>';
                output += '                   <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-1 right wrap" role="gridcell">';
                output += '                       <a class="black" style="float: right;">' + numberWithCommas((arrayElem.Balance).toFixed(window.decimalPoints)) + '</a>';
                output += '                   </td>';
                output += '               </tr>';
                output += '           </tbody>';
                output += '       </table>';
                output += '   </div>';
            }

        });

        return output;
    }

}

function GetLevel5Markup(arrayContent, accountName, accountBalance) {
    var output = '';

    if (arrayContent === undefined || arrayContent === null || arrayContent.length == 0) {
        // array empty or does not exist
        return output;
    } else {

        arrayContent.forEach(function (arrayElem, index) {

            if (arrayElem.AccountPosition == "GENERAL") {
                output += '   <div role="row" class="dgrid-row dgrid-row-even ui-state-default rootHeader" data-total="$' + numberWithCommas((arrayElem.Balance).toFixed(window.decimalPoints)) + '">';
                output += '       <table class="dgrid-row-table" role="presentation">';
                output += '           <tbody>';
                output += '               <tr>';
                output += '                   <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-0 black left " role="gridcell" style="padding-left: ' + LevelPixels.Level5["padding-left"] + ';">';
                output += '                       <div class="dgrid-expando-icon ui-icon ui-icon-triangle-1-se" style="margin-left: ' + LevelPixels.Level5["margin-left"] + '; float: left;">&nbsp;</div>';
                output += '                       ' + arrayElem.AccountName;
                output += '                   </td>';
                output += '                   <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-1 black left wrap" role="gridcell"></td>';
                output += '               </tr>';
                output += '           </tbody>';
                output += '       </table>';
                output += '   </div>';

                output += '   <div class="dgrid-tree-container" style="display: block;">';

                output += GetLevel6Markup(arrayElem.ChildAccountDetails, arrayElem.AccountName, arrayElem.Balance);

                output += '   </div>';
            }

            if (arrayElem.AccountPosition == "DETAIL") {
                output += '   <div role="row" class="dgrid-row dgrid-row-odd ui-state-default">';
                output += '       <table class="dgrid-row-table" role="presentation">';
                output += '           <tbody>';
                output += '               <tr>';
                output += '                   <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-0 black left " role="gridcell" style="padding-left: ' + LevelPixels.Level5["padding-left"] + ';">';
                output += '                       <div class="dgrid-expando-icon" style="margin-left: ' + LevelPixels.Level5["margin-left"] + '; float: left;">&nbsp;</div>';
                output += '                       ' + arrayElem.AccountName;
                output += '                   </td>';
                output += '                   <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-1 right wrap" role="gridcell">';
                output += '                       <a class="black" style="float: right;">' + numberWithCommas((arrayElem.Balance).toFixed(window.decimalPoints)) + '</a>';
                output += '                   </td>';
                output += '               </tr>';
                output += '           </tbody>';
                output += '       </table>';
                output += '   </div>';
            }

        });

        return output;
    }

}

function GetLevel6Markup(arrayContent, accountName, accountBalance) {
    var output = '';

    if (arrayContent === undefined || arrayContent === null || arrayContent.length == 0) {
        // array empty or does not exist
        return output;
    } else {

        arrayContent.forEach(function (arrayElem, index) {

            if (arrayElem.AccountPosition == "GENERAL") {
                output += '   <div role="row" class="dgrid-row dgrid-row-even ui-state-default rootHeader" data-total="$' + numberWithCommas((arrayElem.Balance).toFixed(window.decimalPoints)) + '">';
                output += '       <table class="dgrid-row-table" role="presentation">';
                output += '           <tbody>';
                output += '               <tr>';
                output += '                   <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-0 black left " role="gridcell" style="padding-left: ' + LevelPixels.Level6["padding-left"] + ';">';
                output += '                       <div class="dgrid-expando-icon ui-icon ui-icon-triangle-1-se" style="margin-left: ' + LevelPixels.Level6["margin-left"] + '; float: left;">&nbsp;</div>';
                output += '                       ' + arrayElem.AccountName;
                output += '                   </td>';
                output += '                   <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-1 black left wrap" role="gridcell"></td>';
                output += '               </tr>';
                output += '           </tbody>';
                output += '       </table>';
                output += '   </div>';

                output += '   <div class="dgrid-tree-container" style="display: block;">';

                output += GetLevel7Markup(arrayElem.ChildAccountDetails, arrayElem.AccountName, arrayElem.Balance);

                output += '   </div>';
            }

            if (arrayElem.AccountPosition == "DETAIL") {
                output += '   <div role="row" class="dgrid-row dgrid-row-odd ui-state-default">';
                output += '       <table class="dgrid-row-table" role="presentation">';
                output += '           <tbody>';
                output += '               <tr>';
                output += '                   <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-0 black left " role="gridcell" style="padding-left: ' + LevelPixels.Level6["padding-left"] + ';">';
                output += '                       <div class="dgrid-expando-icon" style="margin-left: ' + LevelPixels.Level6["margin-left"] + '; float: left;">&nbsp;</div>';
                output += '                       ' + arrayElem.AccountName;
                output += '                   </td>';
                output += '                   <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-1 right wrap" role="gridcell">';
                output += '                       <a class="black" style="float: right;">' + numberWithCommas((arrayElem.Balance).toFixed(window.decimalPoints)) + '</a>';
                output += '                   </td>';
                output += '               </tr>';
                output += '           </tbody>';
                output += '       </table>';
                output += '   </div>';
            }

        });

        return output;
    }

}

function GetLevel7Markup(arrayContent, accountName, accountBalance) {
    var output = '';

    if (arrayContent === undefined || arrayContent.length == 0) {
        // array empty or does not exist
        return output;
    } else {

        arrayContent.forEach(function (arrayElem, index) {
            output += '   <div role="row" class="dgrid-row dgrid-row-even ui-state-default">';
            output += '       <table class="dgrid-row-table" role="presentation">';
            output += '           <tbody>';
            output += '               <tr>';
            output += '                   <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-0 black left " role="gridcell" style="padding-left: ' + LevelPixels.Level7["padding-left"] + ';">';
            output += '                       <div class="dgrid-expando-icon" style="margin-left: ' + LevelPixels.Level7["margin-left"] + '; float: left;">&nbsp;</div>';
            output += '                       ' + arrayElem.AccountName;
            output += '                   </td>';
            output += '                   <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-1 right wrap" role="gridcell">';
            output += '                       <a class="black" href="' + window.TransactionReportURL + '" style="float: right;">' + numberWithCommas((arrayElem.Balance).toFixed(window.decimalPoints)) + '</a>';
            output += '                   </td>';
            output += '               </tr>';
            output += '           </tbody>';
            output += '       </table>';
            output += '   </div>';
        });

        output += '   <div role="row" class="dgrid-row ui-state-default dgrid-row-odd">';
        output += '       <table class="dgrid-row-table" role="presentation">';
        output += '           <tbody>';
        output += '               <tr>';
        output += '                   <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-0 black left  totalRow bold " role="gridcell" style="padding-left: ' + LevelPixels.Level7["padding-left"] + ';">';
        output += '                       <div class="dgrid-expando-icon" style="margin-left: ' + LevelPixels.Level7["margin-left"] + '; float: left;">&nbsp;</div>';
        output += '                       Total ' + accountName;
        output += '                   </td>';
        output += '                   <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-1 right wrap totalRow bold" role="gridcell">';
        output += '                       <a class="black" href="' + window.TransactionReportURL + '" style="float: right;">$' + numberWithCommas((accountBalance).toFixed(window.decimalPoints)) + '</a>';
        output += '                   </td>';
        output += '               </tr>';
        output += '           </tbody>';
        output += '       </table>';
        output += '   </div>';

        return output;
    }

}