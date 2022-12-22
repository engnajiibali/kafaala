<%@ Page Title="Daily Posting - Kafaala Cash Management System" Language="C#" MasterPageFile="~/SiteMasterPage.Master" AutoEventWireup="true" CodeBehind="DailyPosting.aspx.cs" Inherits="KafaalaSystem.DailyPosting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
    <style>
        .hideDiv {
            display: none;
        }

        .showDiv {
            display: block;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="server">

    <div class="pageheader">
        <h2><i class="fa fa-calendar"></i>Daily Posting <span>Daily Journal Closing</span></h2>
        <div class="breadcrumb-wrapper">
            <span class="label">You are here:</span>
            <ol class="breadcrumb">
                <li><a href="javascript:void(0);">Posting</a></li>
                <li class="active">Daily Posting</li>
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
                <h3 class="panel-title">Daily Posting</h3>
            </div>
            <div class="panel-body">

                <div class="row">
                    <div id="leftSection" class="col-md-8">
                        <div class="row">
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label for="txtJournalDate" class="col-sm-3 control-label">Journal Date *:</label>
                                    <div class="col-sm-5">
                                        <input type="text" id="txtJournalDate" placeholder="dd/MM/yyyy" onchange="GetJourID();" class="form-control input-sm" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label for="txtJournalID" class="col-sm-3 control-label">Journal ID *:</label>
                                    <div class="col-sm-8">
                                        <input type="text" id="txtJournalID" class="form-control input-sm" readonly="readonly" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label for="txtPostedBy" class="col-sm-3 control-label">Posted By :</label>
                                    <div class="col-sm-8">
                                        <input type="text" id="txtPostedBy" placeholder="User posted" class="form-control input-sm" readonly="readonly" value='<%= String.Concat(user.FullName, " (", user.UserID, ")")  %>' />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /col-md-8 left section -->
                    <div id="rightSection" class="col-md-4">
                        <%--<div class="row">
                            <div class="col-md-7 pull-right">
                                <div class="form-group">
                                    <button type="button" id="btnCalculate" class="btn btn-warning btn-sm pull-right">
                                        <span class="glyphicon glyphicon-random"></span>&nbsp;&nbsp;Calculate Daily Balance
                                    </button>
                                </div>
                            </div>
                        </div>--%>
                    </div>
                    <!-- /col-md-4 right section -->
                </div>
                <%--<div class="row">
                    <div class="col-md-9"></div>
                    <div class="col-md-3 pull-right">
                        <div class="form-group">
                            <button type="button" id="btnCalculate" class="btn btn-warning btn-sm pull-right">
                                <span class="glyphicon glyphicon-random"></span>&nbsp;&nbsp;Calculate Balance
                            </button>
                        </div>
                    </div>
                </div>--%>
                <%--<br />--%>
                <div class="row  " id="dvDetails">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table class="table table-bordered table-dark" id="tblList">
                                <thead>
                                    <tr>
                                        <th style="width: 3%;">SN</th>
                                        <th style="width: 10%;">Currency</th>
                                        <th style="width: 27%;">Last Balance</th>
                                        <th style="width: 16%;">Cash In</th>
                                        <th style="width: 16%;">Cash Out</th>
                                        <th style="width: 28%;">Closing Balance</th>
                                    </tr>
                                </thead>
                                <tbody data-bind="foreach: postingSummary">
                                    <tr>
                                        <td data-bind="text: SN"></td>
                                        <td>
                                            <input type="text" data-bind="value: CurrencyCode" placeholder="Currency (USD)" class="form-control input-sm" value="USD" readonly="readonly">
                                        </td>
                                        <td>
                                            <input type="text" data-bind="value: LastBalance" placeholder="Opening Balance" class="form-control input-sm NumbersAndDecimal" readonly="readonly">
                                        </td>
                                        <td>
                                            <input type="text" data-bind="value: CashIn" placeholder="Total Cash In" class="form-control input-sm NumbersAndDecimal" readonly="readonly">
                                        </td>
                                        <td>
                                            <input type="text" data-bind="value: CashOut" placeholder="Total Cash Out" class="form-control input-sm NumbersAndDecimal" readonly="readonly">
                                        </td>
                                        <td>
                                            <input type="text" data-bind="value: ClosingBalance" placeholder="Closing Balance" class="form-control input-sm NumbersAndDecimal" readonly="readonly">
                                        </td>
                                    </tr>
                                    <%--<tr>
                                        <td>2</td>
                                        <td>
                                            <input type="text" id="txtCurrency_2" placeholder="Currency (ZAR)" class="form-control input-sm" value="ZAR" readonly="readonly" />
                                        </td>
                                        <td>
                                            <input type="text" id="txtLastBalance_2" placeholder="Opening Balance" class="form-control input-sm NumbersAndDecimal" readonly="readonly">
                                        </td>
                                        <td>
                                            <input type="text" id="txtCashIn_2" placeholder="Total Cash In" class="form-control input-sm NumbersAndDecimal" readonly="readonly">
                                        </td>
                                        <td>
                                            <input type="text" id="txtCashOut_2" placeholder="Total Cash Out" class="form-control input-sm NumbersAndDecimal" readonly="readonly">
                                        </td>
                                        <td>
                                            <input type="text" id="txtClosingBalance_2" placeholder="Closing Balance" class="form-control input-sm NumbersAndDecimal" readonly="readonly">
                                        </td>
                                    </tr>--%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="row  " id="dvSubmit">
                    <div class="col-md-10"></div>
                    <div class="col-md-2">
                        <input type="hidden" id="hdnID" value="0" />
                        <input type="hidden" id="hdnOp" value="I" />
                        <button type="button" id="btnSaveAndCloseJournal" class="btn btn-success btn-sm pull-right"><i class="fa fa-lock"></i>&nbsp;&nbsp;Save & Close Journal</button>
                    </div>
                </div>

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
    <script src="Scripts/knockout-3.5.1.js"></script>
    <script>
        var viewModel =
            {
                postingSummary: ko.observableArray([]),
            }

        jQuery(document).ready(function () {

            $("#txtJournalDate").val(GetCurrentDate());
            GetJourID();

            $("#txtJournalDate").datepicker({
                format: "dd/mm/yyyy",
                todayBtn: "linked",
                todayHighlight: true,
                autoclose: true
            });

            GetSummaryPostingData();

            $("#btnCalculate").on("click", function () {
                if ($("#dvDetails").hasClass("hideDiv")) {
                    GetSummaryPostingData();
                    $("#dvDetails").removeClass("hideDiv").addClass("showDiv").fadeIn();
                    $("#dvSubmit").removeClass("hideDiv").addClass("showDiv").fadeIn();
                }
                else {
                    $("#dvDetails").addClass("hideDiv").removeClass("showDiv").hide();
                    $("#dvSubmit").addClass("hideDiv").removeClass("showDiv").hide();
                }
            });

            $("#btnSaveAndCloseJournal").on("click", function () {
                CloseDailyJournal();
            });

        });

        /* ===============================================
         * ======== JAVASCRIPT FUNCTIONS SECTION =========
         * =============================================== */

        function GetJourID() {
            var JourDate = $("#txtJournalDate").val();

            $.ajax({
                type: "POST",
                url: "DataLoader.aspx/GetJournalIDAndJournalDate",
                data: "{JourDate: '" + JourDate + "'}",
                contentType: "application/json",
                dataType: "json",
                async: false,
                cache: false,
                beforeSend: function () {
                    //enable loader
                    ShowPreloader("txtJournalID");
                },
                success: function (data) {
                    try {
                        var dataReturned = $.parseJSON(data.d);
                        console.log(dataReturned);

                        $("#txtJournalID").val(dataReturned.JournalID);

                        //$.each(dataReturned, function (i, d) {
                        //    $("#txtJournalID").val(d.JournalID);
                        //});
                    } catch (err) {
                        ShowMessage("Failed to load journal data from the database!", "Error", GetActiveNotificationPlugin());
                    }
                },
                error: function (xhr, status, e) {
                    var errorMsg = "Error occur while loading journal data from the database! : " + xhr.responseText;
                    console.log(errorMsg);
                    ShowMessage("Error occur while loading journal data from the database!", "Error", GetActiveNotificationPlugin());
                },
                complete: function () {
                    ///disable loader
                    HidePreloader("txtJournalID");
                }
            }); // end: ajax

        }

        function GetSummaryPostingData() {
            //$("#tblList tbody").empty();
            $.ajax({
                url: "/api/Posting",
                contentType: "text/json",
                type: "GET",
                success: function (data) {
                    $.each(data, function (index) {
                        viewModel.postingSummary.push(ToKnockOutObservable(data[index]));
                    });
                    ko.applyBindings(viewModel);
                },
                error: function (data) {
                    var errorMsg = "Error occur while fetching daily balance : " + xhr.responseText;
                    console.log(errorMsg);
                    ShowMessage("Error occur while fetching daily balance!", "Error", GetActiveNotificationPlugin());
                },
                complete: function () {
                    ShowDetails();
                }
            });
        }

        function ToKnockOutObservable(posting) {
            return {
                SN: ko.observable(posting.SN),
                CurrencyCode: ko.observable(posting.CurrencyCode),
                LastBalance: ko.observable(posting.LastBalance).extend({ numeric: 2 }),
                CashIn: ko.observable(posting.CashIn).extend({ numeric: 2 }),
                CashOut: ko.observable(posting.CashOut).extend({ numeric: 2 }),
                ClosingBalance: ko.observable(posting.ClosingBalance).extend({ numeric: 2 }),
            };
        }

        function ShowDetails() {
            $("#dvDetails").fadeIn();
            $("#dvSubmit").fadeIn();
        }

        function HideDetails() {
            $("#dvDetails").hide();
            $("#dvSubmit").hide();
        }

        function CloseDailyJournal() {
            // Prevent Double form submitting
            $('button[id="btnSaveAndCloseJournal"]').prop('disabled', true);
            $("#btnSaveAndCloseJournal").text("Saving data...");

            try {

                var DailyPostingDetails = [];

                /* ======== DEPOSIT DETAILS INFO ========= */
                var table = $("#tblList tbody");

                table.find('tr').each(function (i, el) {

                    // Get Data from html table element
                    var $tds = $(this).find('td'),
                        CurrencyCode = $.trim($tds.eq(1).find("input").val()),
                        LastBalance = parseFloat($.trim($tds.eq(2).find("input").val())),
                        CashIn = parseFloat($.trim($tds.eq(3).find("input").val())),
                        CashOut = parseFloat($.trim($tds.eq(4).find("input").val())),
                        ClosingBalance = parseFloat($.trim($tds.eq(5).find("input").val()));


                    if ((CurrencyCode !== "") && (LastBalance !== "") && (CashIn !== "") && (CashOut !== "") && (ClosingBalance !== "")) {
                        // Create new PostingDetail object that holds each DailyPostingDetails value
                        var PostingDetail = {
                            DepositDetailID: 0,
                            DepositID: 0,
                            CurrencyCode: CurrencyCode,
                            LastBalance: LastBalance,
                            CashIn: CashIn,
                            CashOut: CashOut,
                            ClosingBalance: ClosingBalance,
                            ClosingBalanceInWords: null,
                            RowGuid: null
                        };

                        // Add List of DailyPostingDetails to the current PostingDetail object
                        DailyPostingDetails.push(PostingDetail);
                    }

                });

                /* ======== DEPOSIT INFO ========= */
                var DailyPosting = {
                    JournalID: $("#txtJournalID").val(),
                    //JournalDate: $("#txtJournalDate").val(),
                    IsAutomaticPosting: "N",
                    DailyPostingDetails: DailyPostingDetails
                };


                var DataToSend = {
                    dailyPosting: DailyPosting,
                    JournalDate: $("#txtJournalDate").val()
                };

                console.log(DataToSend);

                SendDataViaAjaxWithFeedback("DailyPosting.aspx/CloseDailyJournal", DataToSend, "btnSaveAndPrint");

            } catch (err) {
                console.log(err);
                ShowMessage(FeedBackMessages.failedToSaveDataMsg, "Error", GetActiveNotificationPlugin());
                ResetSaveButton("btnSaveAndCloseJournal");
            }

        }

        function clearTextBox() {
            window.location.reload();
        }
    </script>
    <script>
        ko.extenders.numeric = function (target, precision) {
            var result = ko.computed({
                read: function () {
                    return target().toFixed(precision);
                },
                write: target
            });

            result.raw = target;
            return result;
        };
    </script>
</asp:Content>

