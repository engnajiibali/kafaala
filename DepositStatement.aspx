<%@ Page Title="Deposit Statement - Kafaala Cash Management System" Language="C#" MasterPageFile="~/SiteMasterPage.Master" AutoEventWireup="true" CodeBehind="DepositStatement.aspx.cs" Inherits="KafaalaSystem.DepositStatement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
    <link href="css/reports/dgrid.css" rel="stylesheet" />
    <link href="<%=Fingerprint.Tag("/css/reports/professionalreports.css") %>" rel="stylesheet" />
    <link href="<%=Fingerprint.Tag("/css/reports/customProfessionalReportStyles.css") %>" rel="stylesheet" />
    <style type="text/css">
        .professionalreports .page-content .reportGridContainer {
            width: 854px;
            background-color: #fff;
            display: inline-block;
            margin-left: 1%;
            margin-right: 1%;
            margin-bottom: 40px;
            min-width: 50%;
            border: 1px solid #e3eaf3;
        }

            .professionalreports .page-content .reportGridContainer .reportToolBar {
                width: 854px;
                height: 38px;
                position: absolute;
                background-color: #fff;
                border-bottom: 1px solid #e3eaf3;
                border-left: 1px solid #e3eaf3;
                border-right: 1px solid #e3eaf3;
                margin-left: -1px;
            }
    </style>
    <style type="text/css">
        .dgrid-column-0-0 {
            width: 410px !important;
        }

        .dgrid-column-0-1 {
            width: 90px !important;
        }

        .dgrid-column-0-2 {
            width: 160px !important;
        }

        .dgrid-column-0-3 {
            width: 160px !important;
        }

        .bold {
            font-weight: bold;
        }

        .professionalreports .page-content .reportGridContainer .reportArea .reportsGrid .collapsedHeader {
            border-bottom: 1px solid #ccc !important;
        }

        .professionalreports .page-content .reportGridContainer .reportArea .reportsGrid .grandTotalRow {
            border-top: 1px solid #ccc !important;
            border-bottom-style: double !important;
            border-bottom-color: #000 !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="server">

    <div class="pageheader">
        <h2><i class="fa fa-money"></i>Deposit Statement <span>View Deposit Statements</span></h2>
        <div class="breadcrumb-wrapper">
            <span class="label">You are here:</span>
            <ol class="breadcrumb">
                <li><a href="javascript:void(0);">Reports</a></li>
                <li class="active">Deposit Statement</li>
            </ol>
        </div>
    </div>

    <div class="contentpanel">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <div class="panel-btns">
                    <a href="" class="panel-close">×</a>
                    <a href="" class="minimize">−</a>
                </div>
                <h3 class="panel-title">Deposit Statement</h3>
            </div>
            <div class="panel-body">


                <div class="row">
                    <div class="col-md-6">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="txtStartDate">From Date</label>
                                <input type="text" id="txtStartDate" name="txtStartDate" class="form-control input-sm mb15" placeholder="From" />
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="txtEndDate">To Date</label>
                                <input type="text" id="txtEndDate" name="txtEndDate" class="form-control input-sm mb15" placeholder="To" />
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <br />
                                <button type="button" onclick="GetDepositStatementReportData();" class="btn btn-primary btn-sm">Run Report</button>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                    </div>
                </div>

                <hr />


                <div class="row">
                    <div class="col-md-12">

                        <div class="professionalreports">
                            <div class="page-content">
                                <div class="reportGridContainer">
                                    <div class="report">
                                        <div class="reportToolBar">
                                            <div class="leftDiv"></div>
                                            <div class="rightDiv">
                                                <div role="button" id="btnExportToPDF" runat="server" class="pencilIcon hi hi-print" title="Export to PDF">
                                                    <img src="images/icons8-print-50.png" style="width: 20px; height: 20px; margin-top: -10px;" />
                                                </div>
                                                <div role="button" id="btnExportToExcel" runat="server" class="pencilIcon hi hi-print" title="Export to Excel">
                                                    <img src="images/icons8-microsoft-excel-80.png" style="width: 27px; height: 27px; margin-top: -10px;" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="reportArea">
                                            <div class="reportHeader">
                                                <div class="center">
                                                    <div class="companyNameRow">
                                                        <div class="companyName">Kafaala Express RSA</div>
                                                    </div>
                                                    <div class="titleRow">
                                                        <div class="reportName">Deposit Statement</div>
                                                    </div>
                                                    <div class="dateRangeRow">1 January - 22 July, 2019</div>
                                                </div>
                                            </div>
                                            <div id="reportData">
                                                <div class="dgrid dgrid-grid ui-widget dgrid-03 reportsGrid universal-grid reportsGridCompact" role="grid">
                                                    <div class="dgrid-header dgrid-header-row ui-widget-header" role="row">
                                                        <table class="dgrid-row-table" role="presentation" id="dgrid_0-header">
                                                            <tr class="dgrid-spacer-row">
                                                                <th class="dgrid-cell dgrid-cell-padding dgrid-column-0-0" role="columnheader">
                                                                    <div class="dgrid-resize-header-container">
                                                                        <div class="dgrid-resize-handle resizeNode-0-0"></div>
                                                                    </div>
                                                                </th>
                                                                <th class="dgrid-cell dgrid-cell-padding dgrid-column-0-1" role="columnheader">
                                                                    <div class="dgrid-resize-header-container">
                                                                        <div class="dgrid-resize-handle resizeNode-0-1"></div>
                                                                    </div>
                                                                </th>
                                                                <th class="dgrid-cell dgrid-cell-padding dgrid-column-0-2" role="columnheader">
                                                                    <div class="dgrid-resize-header-container">
                                                                        <div class="dgrid-resize-handle resizeNode-0-2"></div>
                                                                    </div>
                                                                </th>
                                                                <th class="dgrid-cell dgrid-cell-padding dgrid-column-0-3" role="columnheader">
                                                                    <div class="dgrid-resize-header-container">
                                                                        <div class="dgrid-resize-handle resizeNode-0-3"></div>
                                                                    </div>
                                                                </th>
                                                            </tr>
                                                            <tr>
                                                                <th class="dgrid-cell dgrid-cell-padding dgrid-column-0-0 left bold firstColumn dgrid-focus" role="columnheader" rowspan="1" tabindex="0">
                                                                    <div class="dgrid-resize-header-container">
                                                                        Account<div class="dgrid-resize-handle resizeNode-0-0"></div>
                                                                    </div>
                                                                </th>
                                                                <th class="dgrid-cell dgrid-cell-padding dgrid-column-0-1 left bold" role="columnheader" rowspan="1">
                                                                    <div class="dgrid-resize-header-container">
                                                                        Date<div class="dgrid-resize-handle resizeNode-0-1"></div>
                                                                    </div>
                                                                </th>
                                                                <th class="dgrid-cell dgrid-cell-padding dgrid-column-0-2 right bold" role="columnheader" rowspan="1">
                                                                    <div class="dgrid-resize-header-container">
                                                                        USD<div class="dgrid-resize-handle resizeNode-0-2"></div>
                                                                    </div>
                                                                </th>
                                                                <th class="dgrid-cell dgrid-cell-padding dgrid-column-0-3 right bold" role="columnheader" rowspan="1">
                                                                    <div class="dgrid-resize-header-container">
                                                                        ZAR<div class="dgrid-resize-handle resizeNode-0-3"></div>
                                                                    </div>
                                                                </th>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                    <div id="reportContent" class="dgrid-scroller">
                                                        <%--<div class="dgrid-content ui-widget-content">
                                                            <div role="row" class=" dgrid-row dgrid-row-even ui-state-default" id="dgrid_0-row-1">
                                                                <table class="dgrid-row-table" role="presentation">
                                                                    <tr>
                                                                        <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-0 black left " role="gridcell" tabindex="0">
                                                                            <div class="dgrid-expando-icon hide" style="margin-left: 0px; float: left;">&nbsp;</div>
                                                                            <a class="black">13880 - Max'ed Daahir Cabdulle</a></td>
                                                                        <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-1 left wrap" role="gridcell">02/12/2019</td>
                                                                        <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-2 right wrap" role="gridcell">2,500.00</td>
                                                                        <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-3 right wrap" role="gridcell"></td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                            <div role="row" class=" dgrid-row dgrid-row-odd ui-state-default" id="dgrid_0-row-2">
                                                                <table class="dgrid-row-table" role="presentation">
                                                                    <tr>
                                                                        <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-0 black left " role="gridcell">
                                                                            <div class="dgrid-expando-icon hide" style="margin-left: 0px; float: left;">&nbsp;</div>
                                                                            <a class="black">13885 - Bashiir Axmed Salaad</a></td>
                                                                        <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-1 left wrap" role="gridcell">02/12/2019</td>
                                                                        <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-2 right wrap" role="gridcell">1,000.00</td>
                                                                        <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-3 right wrap" role="gridcell"></td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                            <div role="row" class=" dgrid-row dgrid-row-even ui-state-default" id="dgrid_0-row-3">
                                                                <table class="dgrid-row-table" role="presentation">
                                                                    <tr>
                                                                        <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-0 black left " role="gridcell">
                                                                            <div class="dgrid-expando-icon hide" style="margin-left: 0px; float: left;">&nbsp;</div>
                                                                            <a class="black">13887 - Xasan Sheekh Maxamuud</a></td>
                                                                        <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-1 left wrap" role="gridcell">02/12/2019</td>
                                                                        <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-2 right wrap" role="gridcell"></td>
                                                                        <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-3 right wrap" role="gridcell">3,700.00</td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                            <div role="row" class=" dgrid-row dgrid-row-odd ui-state-default" id="dgrid_0-row-4">
                                                                <table class="dgrid-row-table" role="presentation">
                                                                    <tr>
                                                                        <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-0 black left " role="gridcell">
                                                                            <div class="dgrid-expando-icon hide" style="margin-left: 0px; float: left;">&nbsp;</div>
                                                                            <a class="black">13882 - Jaamac Ducaale Cumar</a></td>
                                                                        <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-1 left wrap" role="gridcell">02/12/2019</td>
                                                                        <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-2 right wrap" role="gridcell">200.00</td>
                                                                        <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-3 right wrap" role="gridcell"></td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                            <div role="row" class=" dgrid-row ui-state-default dgrid-row-even" id="dgrid_0-row-5">
                                                                <table class="dgrid-row-table" role="presentation">
                                                                    <tr>
                                                                        <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-0 black left  grandTotalRow topSummary" role="gridcell">
                                                                            <div class="dgrid-expando-icon hide" style="margin-left: 0px; float: left;">&nbsp;</div>
                                                                            TOTAL</td>
                                                                        <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-1 black right wrap grandTotalRow topSummary bold" role="gridcell"></td>
                                                                        <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-2 black right wrap grandTotalRow topSummary bold" role="gridcell">$3,700.00</td>
                                                                        <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-3 black right wrap grandTotalRow topSummary bold" role="gridcell">$3,700.00</td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                        </div>--%>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="reportFooter">
                                                <div id="reportFooter" class="center">
                                                    <div class="footerOption">Saturday, July 20, 2019</div>
                                                    <div class="footerOption">11:11 AM GMT+03:00</div>
                                                </div>
                                            </div>
                                            <!-- /.reportFooter -->
                                        </div>
                                        <!-- /.reportArea -->
                                    </div>
                                    <!-- /.report -->
                                </div>
                                <!-- /.reportGridContainer -->
                            </div>
                            <!-- /.page-content -->
                        </div>
                        <!-- /.professionalreports -->

                    </div>
                </div>

                <input type="hidden" id="hdnDateParams" name="hdnDateParams" value="" />
                <input type="hidden" id="hdnReportFooter" name="hdnReportFooter" value="" />
                <input type="hidden" id="hdnFromAccountText" name="hdnFromAccountText" value="All" />
                <input type="hidden" id="hdnToAccountText" name="hdnToAccountText" value="All" />


                <br />
                <br />
            </div>
            <!-- panel-body -->
        </div>
        <!-- panel -->
    </div>
    <!-- contentpanel -->

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphFooter" runat="server">
    <script src="<%=Fingerprint.Tag("/js/reports/reportScripts.js") %>"></script>
    <script>
        jQuery(document).ready(function () {

            $("#txtStartDate").val(GetFirstDayOfCurrentMonth());
            $("#txtEndDate").val(GetCurrentDate());

            var options = {
                todayBtn: "linked",
                orientation: $('body').hasClass('right-to-left') ? "auto right" : 'auto auto',
                format: 'dd/mm/yyyy',
                todayHighlight: true,
                autoclose: true
            }
            $('#txtStartDate').datepicker(options);
            $('#txtEndDate').datepicker(options);

            SetReportHeaderDateParameters();
            SetFooterDates();

            GetDepositStatementReportData();

        });

        /* ===============================================
         * ======== JAVASCRIPT FUNCTIONS SECTION =========
         * =============================================== */

        function GetDepositStatementReportData() {
            var reportContent = $("#reportContent");
            reportContent.empty();

            var dataAdapter = {
                AccountNo: "0",
                StartDate: $.trim($("#txtStartDate").val()),
                EndDate: $.trim($("#txtEndDate").val())
            };

            $.ajax({
                type: "POST",
                url: "DepositStatement.aspx/GetDepositStatementReportData",
                data: JSON.stringify(dataAdapter),
                contentType: "application/json",
                dataType: "json",
                async: true,
                cache: false,
                beforeSend: function () {
                    //enable loader
                    ShowPreloader("reportData");
                },
                success: function (data) {
                    try {
                        var dataReturned = data.d;
                        var html = "";

                        console.log(dataReturned);

                        html += '<div id="myTable" class="dgrid-content ui-widget-content">';

                        if (dataReturned === null || dataReturned === undefined || dataReturned.length == 0) {
                            html += '<div class="dgrid-no-data">This report does not contain any data.</div>';

                        } else {

                            var TotalUSD = 0;
                            var TotalZAR = 0;

                            dataReturned.forEach(function (arrayElem, index) {

                                html += '   <div role="row" class=" dgrid-row dgrid-row-even ui-state-default">';
                                html += '       <table class="dgrid-row-table" role="presentation">';
                                html += '           <tr>';
                                html += '               <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-0 black left " role="gridcell">';
                                html += '                   <div class="dgrid-expando-icon hide" style="margin-left: 0px; float: left;">&nbsp;</div>';
                                html += '                   <a class="black">' + arrayElem.AccountLabel + '</a></td>';
                                html += '               <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-1 left wrap" role="gridcell">' + HandleCSharpDateWithoutTime(arrayElem.DepositDate) + '</td>';
                                html += '               <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-2 right wrap" role="gridcell">' + accounting.formatMoney(arrayElem.USD, " ", window.decimalPoints, ",") + '</td>';
                                html += '               <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-3 right wrap" role="gridcell">' + accounting.formatMoney(arrayElem.ZAR, " ", window.decimalPoints, ",") + '</td>';
                                html += '           </tr>';
                                html += '       </table>';
                                html += '   </div>';

                                TotalUSD += parseFloat(arrayElem.USD);
                                TotalZAR += parseFloat(arrayElem.ZAR);

                            });

                            ////////////////////////// GENERATING GRAND TOTAL SALES ROW MARKUP ////////////////////
                            html += '   <div role="row" class=" dgrid-row ui-state-default dgrid-row-even" id="dgrid_0-row-5">';
                            html += '       <table class="dgrid-row-table" role="presentation">';
                            html += '           <tr>';
                            html += '               <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-0 black left  grandTotalRow topSummary" role="gridcell">';
                            html += '                   <div class="dgrid-expando-icon hide" style="margin-left: 0px; float: left;">&nbsp;</div>';
                            html += '                   TOTAL</td>';
                            html += '               <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-1 black right wrap grandTotalRow topSummary bold" role="gridcell"></td>';
                            html += '               <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-2 black right wrap grandTotalRow topSummary bold" role="gridcell">' + accounting.formatMoney(TotalUSD, " ", window.decimalPoints, ",") + '</td>';
                            html += '               <td class="dgrid-cell dgrid-cell-padding dgrid-column-0-3 black right wrap grandTotalRow topSummary bold" role="gridcell">' + accounting.formatMoney(TotalZAR, " ", window.decimalPoints, ",") + '</td>';
                            html += '           </tr>';
                            html += '       </table>';
                            html += '   </div>';

                        }

                        html += '</div>';

                        html += '<label class="notesLabel">' + BuildParametersList() + '</label>'; // Display Selected Parameters as footer notes

                        ////////////////////////// GENERATING PAGINATION MARKUP ////////////////////
                        html += '<nav aria-label="Page navigation">';
                        html += '   <ul id="myPager" class="pagination">';
                        html += '   </ul>';
                        html += '</nav>';

                        reportContent.append(html);
                    } catch (err) {
                        console.log(err);
                        ShowMessage(FeedBackMessages.failedToLoadDataMsg("Deposit Statement Data"), "Error", GetActiveNotificationPlugin());
                    }
                },
                error: function (xhr, status, e) {
                    var errorMsg = xhr.responseText; //"Error occur while fetching balancesheet data : " + xhr.responseText;
                    console.log(errorMsg);
                    ShowMessage(FeedBackMessages.errorWhileFetchingDataMsg("Deposit Statement Data"), "Error", GetActiveNotificationPlugin());
                },
                complete: function () {
                    //$('#myTable').kiasPager({ pagerSelector: '#myPager', showPrevNext: true, hidePageNumbers: false, perPage: 20 });

                    BuildParametersList();
                    SetReportHeaderDateParameters();
                    SetFooterDates();

                    ///disable loader
                    HidePreloader("reportData");
                }
            }); // end: ajax
        }

        function BuildParametersList() {
            var parametersList = '<strong>* Filtered Criteria of this Report is :- </strong> ';

            //parametersList += '<strong>From Account: </strong>' + $.trim($("#ddlFromAccount option:selected").text()) + ', ';
            //parametersList += '<strong>To Account: </strong>' + $.trim($("#ddlToAccount option:selected").text()) + ', ';
            parametersList += '<strong>From Date: </strong>' + $("#txtStartDate").val() + ', ';
            parametersList += '<strong>To Date: </strong>' + $("#txtEndDate").val();

            return parametersList;
        } // end of BuildParametersList()

        function SetReportHeaderDateParameters() {
            var fromDateText = $("#txtStartDate").val();
            var fromDateString = fromDateText.split("/").reverse().join("-"); // Convert date from dd/mm/yyyy to yyyy-mm-dd 

            var toDateText = $("#txtEndDate").val();
            var toDateString = toDateText.split("/").reverse().join("-"); // Convert date from dd/mm/yyyy to yyyy-mm-dd 

            var fromDate = new Date(Date.parse(fromDateString));
            var toDate = new Date(Date.parse(toDateString));

            $('.dateRangeRow').text(formatDate(fromDate) + ' - ' + formatDate(toDate));
            $('#hdnDateParams').val(formatDate(fromDate) + ' - ' + formatDate(toDate));
        }

        function SetFooterDates() {
            var dateOptions = {
                weekday: 'long', year: 'numeric', month: 'long', day: 'numeric'
            };
            var timeOptions = {
                hour12: true,
                hour: "2-digit",
                minute: "2-digit"
            };
            var today = new Date();

            var markup = '<div class="footerOption">' + today.toLocaleDateString("en-US", dateOptions) + '</div>';
            markup += '<div class="footerOption">' + today.toTimeString() + '</div>';

            $("#reportFooter").empty().html(markup);
            $("#hdnReportFooter").val(today.toLocaleDateString("en-US", dateOptions) + " " + today.toTimeString()); // This will be used when exporting to .xls
        }

    </script>
</asp:Content>

