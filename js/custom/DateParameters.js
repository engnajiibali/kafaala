/* =========== Get This Week date =========== */
function GetThisWeek() {
    var curr = new Date; // get current date
    var first = curr.getDate() - curr.getDay(); // First day is the day of the month - the day of the week
    var last = first + 6; // last day is the first day + 6

    var firstDay = new Date(curr.setDate(first)).toUTCString();
    var lastDay = new Date(curr.setDate(last)).toUTCString();

    alert(firstDay);
    alert(lastDay);
}

/* =========== Get This Week-to-date =========== */
function GetThisWeekToDate() {
    var dt = new Date(); // current date of week
    var currentWeekDay = dt.getDay();
    var lessDays = currentWeekDay == 0 ? 6 : currentWeekDay;
    var wkStart = new Date(new Date(dt).setDate(dt.getDate() - lessDays));
    var wkEnd = new Date(new Date(wkStart).setDate(wkStart.getDate() + 6));

    var weekStartDate = new Date(new Date(dt).setDate(dt.getDate() - lessDays));
    var toDate = dt;

    alert(wkStart);
    alert(toDate);
}

/* =========== Get This Month dates =========== */
function GetThisMonthDate() {
    var date = new Date();
    var firstDay = new Date(date.getFullYear(), date.getMonth(), 1);
    var lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);

    alert(firstDay);
    alert(lastDay);
}

/* =========== Get This Month-to-date dates =========== */
function GetThisMonthToDate() {
    var date = new Date();
    var firstDay = new Date(date.getFullYear(), date.getMonth(), 1); // Gets first date of this month
    var lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0); // Gets last date of this month

    alert(firstDay);
    alert(date);
}

/* =========== Get This Quarter dates =========== */
function GetThisQuarterDate() {
    var today = new Date();
    var currentYear = today.getFullYear(); // (new Date).getFullYear();
    var currentMonth = today.getMonth(); // (new Date).getMonth();
    var currentQuarter = Math.floor(((currentMonth + 11) / 3) % 4) + 1;

    var startDate;
    var endDate;

    switch (currentQuarter) {
        case 1:
            startDate = new Date(currentYear, (1 - 1), 1);
            endDate = new Date(currentYear, 3, 0);
            break;
        case 2:
            startDate = new Date(currentYear, (4 - 1), 1);
            endDate = new Date(currentYear, 6, 0);
            break;
        case 3:
            startDate = new Date(currentYear, (7 - 1), 1);
            endDate = new Date(currentYear, 9, 0);
            break;
        case 4:
            startDate = new Date(currentYear, (10 - 1), 1);
            endDate = new Date(currentYear, 12, 0);
            break;
    }

    //alert(currentQuarter);
    alert(startDate);
    alert(endDate);
}

/* =========== Get This Quarter-to-date dates =========== */
function GetThisQuarterToDate() {
    var today = new Date();
    var currentYear = today.getFullYear(); // (new Date).getFullYear();
    var currentMonth = today.getMonth(); // (new Date).getMonth();
    var currentQuarter = Math.floor(((currentMonth + 11) / 3) % 4) + 1;

    var startDate;
    var endDate;

    switch (currentQuarter) {
        case 1:
            startDate = new Date(currentYear, (1 - 1), 1);
            endDate = today;
            break;
        case 2:
            startDate = new Date(currentYear, (4 - 1), 1);
            endDate = today;
            break;
        case 3:
            startDate = new Date(currentYear, (7 - 1), 1);
            endDate = today;
            break;
        case 4:
            startDate = new Date(currentYear, (10 - 1), 1);
            endDate = today;
            break;
    }

    //alert(currentQuarter);
    alert(startDate);
    alert(endDate);
}

/* =========== Get This Year dates =========== */
function GetThisYearDate() {
    var startDate = new Date(new Date().getFullYear(), 0, 1); // Gets first date of the current year
    var endDate = new Date(new Date().getFullYear(), 11, 31); // Gets last date of the current year

    alert(startDate);
    alert(endDate);
}

/* =========== Get This Year-to-date dates =========== */
function GetThisYearToDate() {
    var startDate = new Date(new Date().getFullYear(), 0, 1); // Gets first date of the current year
    var endDate = new Date(); // Gets today's date of the current year

    alert(startDate);
    alert(endDate);
}

/* =========== Get This Year-to-last-month dates =========== */
function GetThisYearToLastMonthDate() {
    var startDate = new Date(new Date().getFullYear(), 0, 1); // Gets first date of the current year
    var endDate = new Date(new Date().getFullYear(), 11, 31); // Gets last date of the current year

    alert(startDate);
    alert(endDate);
}