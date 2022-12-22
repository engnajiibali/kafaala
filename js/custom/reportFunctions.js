
//////// This function takes array list of ChartsOfAccount & returns single value.
///////  This function will return total revenues of that array list.
function GetTotalRevenue(arrayContent) {
    var totalRevenues = 0;

    ////////// Filter Revenue Accounts //////////
    var revenueAccounts = arrayContent.filter(function (acc) {
        return acc.AccountType == "Revenue";
    });

    ///////////// Calculate total Revenues ////////////
    revenueAccounts.forEach(function (account, index) {
        totalRevenues += (account.Balance);
    }); // end loop

    return totalRevenues;
}

//////// This function takes array list of ChartsOfAccount & returns single value.
///////  This function will return total expenses of that array list.
function GetTotalExpenses(arrayContent) {
    var totalExpenses = 0;

    ////////// Filter Expense Accounts //////////
    var expenseAccounts = arrayContent.filter(function (acc) {
        return acc.AccountType == "Expense";
    });

    ///////////// Calculate total Expense ////////////
    expenseAccounts.forEach(function (account, index) {
        totalExpenses += (account.Balance);
    }); // end loop

    return totalExpenses;
}

//////// This function takes array list of ChartsOfAccount & returns single value.
///////  This function will return total COGS of that array list.
function GetTotalCOGS(arrayContent) {
    var totalCOGS = 0;

    ////////// Filter Revenue Accounts //////////
    var cogsAccounts = arrayContent.filter(function (acc) {
        return acc.AccountType == "COGS";
    });

    ///////////// Calculate total COGS ////////////
    cogsAccounts.forEach(function (account, index) {
        totalCOGS += (account.Balance);
    }); // end loop

    return totalCOGS;
}

//////// This function takes array list of ChartsOfAccount & returns single value.
///////  This function will return total Expenses with COGS of that array list.
function GetTotalExpensesWithCOGS(arrayContent) {
    var totalExpensesWithCOGS = 0;

    ////////// Filter Ordinary Expense Accounts //////////
    var expensesWithoutCogsAccounts = arrayContent.filter(function (acc) {
        return acc.AccountType == "Expense";
    });

    ///////////// Calculate total Expenses with COGS ////////////
    expensesWithoutCogsAccounts.forEach(function (account, index) {
        totalExpensesWithCOGS += (account.Balance);
    }); // end loop

    return totalExpensesWithCOGS;
}

//////// This function takes array list of ChartsOfAccount & returns single value.
///////  This function will return total Expenses without COGS of that array list.
function GetTotalExpensesWithoutCOGS(arrayContent) {
    var totalExpensesWithoutCOGS = 0;

    ////////// Filter Ordinary Expense Accounts //////////
    var expensesWithoutCogsAccounts = arrayContent.filter(function (acc) {
        return acc.AccountType == "ExpenseWithoutCogs";
    });

    ///////////// Calculate total Expenses with COGS ////////////
    expensesWithoutCogsAccounts.forEach(function (account, index) {
        totalExpensesWithoutCOGS += parseFloat(account.Balance);
    }); // end loop

    return totalExpensesWithoutCOGS;
}

////// This function takes array list of ChartsOfAccount & returns single value.
/////  This function will return Profit & Loss of the current year.
function GetProfitLossCurrentYear(arrayContent) {
    var totalRevenues = GetTotalRevenue(arrayContent);
    var totalExpenses = GetTotalExpenses(arrayContent);

    var profitLossCurrentYear = (totalRevenues - totalExpenses);
    return profitLossCurrentYear;
}

//////// This function takes array list of ChartsOfAccount & returns single value.
///////  This function will return total Liabilities of that array list.
function GetTotalLiabilities(arrayContent) {
    var totalLiabilities = 0;

    ////////// Filter Liability Accounts //////////
    var liabilityAccounts = arrayContent.filter(function (acc) {
        return acc.AccountType == "Liability";
    });

    ///////////// Calculate total liabilities ////////////
    liabilityAccounts.forEach(function (account, index) {
        totalLiabilities += (account.Balance);
    }); // end 

    return totalLiabilities;
}

//////// This function takes array list of ChartsOfAccount & returns single value.
/////  This function will return total equity/capital of that array list.
function GetTotalEquity(arrayContent) {
    var totalEquities = 0;

    ////////// Filter Equity Accounts //////////
    var equityAccounts = arrayContent.filter(function (acc) {
        return acc.AccountType == "Equity";
    });

    ///////////// Calculate total liabilities ////////////
    equityAccounts.forEach(function (account, index) {
        totalEquities += (account.Balance);
    }); // end 

    return totalEquities;
}

//////// This function takes array list of ChartsOfAccount & returns single value.
/////  This function will return total equity/capital + profit/loss of that array list.
function GetTotalEquityPlusProfitLoss(arrayContent) {
    var equities = GetTotalEquity(arrayContent);
    var profitLoss = GetProfitLossCurrentYear(arrayContent);
    return (equities + profitLoss);
}

//////// This function takes array list of ChartsOfAccount & returns single value.
/////  This function will return total liabilities + total equity/capital of that array list.
function GetTotalLiabilitiesPlusEquity(arrayContent) {
    var totalLiabilities = GetTotalLiabilities(arrayContent);
    var totalEquity = GetTotalEquityPlusProfitLoss(arrayContent);
    return (totalLiabilities + totalEquity);
}

