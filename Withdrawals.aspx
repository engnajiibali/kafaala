<%@ Page Title="Withdrawals - Kafaala Cash Management System" Language="C#" MasterPageFile="~/SiteMasterPage.Master" AutoEventWireup="true" CodeBehind="Withdrawals.aspx.cs" Inherits="KafaalaSystem.Withdrawals" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="server">

    <div class="pageheader">
        <h2><i class="fa fa-money"></i>Withdrawals <span>Customer withdrawals</span></h2>
        <div class="breadcrumb-wrapper">
            <span class="label">You are here:</span>
            <ol class="breadcrumb">
                <li><a href="javascript:void(0);">Activity</a></li>
                <li class="active">Withdrawals</li>
            </ol>
        </div>
    </div>

    <div class="contentpanel">
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="panel-btns">
                    <a href="" class="panel-close">×</a>
                    <a href="" class="minimize">−</a>
                </div>
                <h3 class="panel-title">Withdrawals</h3>
                <p>Customer withdrawals form</p>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div id="leftSection" class="col-md-8">
                        <div class="row">
                            <div class="col-md-7">
                                <div class="form-group">
                                    <label for="txtWithdrawalDate" class="col-sm-3 control-label">Withdrawal Date *:</label>
                                    <div class="col-sm-5">
                                        <input type="text" id="txtWithdrawalDate" placeholder="dd/MM/yyyy" class="form-control input-sm" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-7">
                                <div class="form-group">
                                    <label for="ddlAccountNo" class="col-sm-3 control-label">Account Number *:</label>
                                    <div class="col-sm-8">
                                        <select id="ddlAccountNo" onchange="GetCustomerBalance(this)" data-placeholder="Choose account no...">
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-7">
                                <div class="form-group">
                                    <label for="txtRemarks" class="col-sm-3 control-label">Remarks :</label>
                                    <div class="col-sm-8">
                                        <input type="text" id="txtRemarks" placeholder="" class="form-control input-sm" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /col-md-8 left section -->
                    <div id="rightSection" class="col-md-4">
                        <div class="row">
                            <div class="col-md-7 pull-right">
                                <div class="form-group">
                                    <label class="control-label">Account Balance (USD):</label>
                                    <input type="text" id="txtBalanceUSD" placeholder="USD Balance" class="form-control input-sm" readonly="readonly" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-7 pull-right">
                                <div class="form-group">
                                    <label class="control-label">Account Balance (ZAR):</label>
                                    <input type="text" id="txtBalanceZAR" placeholder="ZAR Balance" class="form-control input-sm" readonly="readonly" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /col-md-4 right section -->
                </div>
                <br />
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table class="table table-bordered table-primary" id="tblList">
                                <thead>
                                    <tr>
                                        <th style="width: 3%;">SN</th>
                                        <th style="width: 15%;">Currency</th>
                                        <th style="width: 10%;">Amount</th>
                                        <th style="width: 67%;">Amount in Words</th>
                                        <th style="width: 5%;">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>
                                            <select id="ddlCurrency_1" onchange="SelectThisCurrency(this);" data-placeholder="Choose currency type...">
                                            </select>
                                        </td>
                                        <td>
                                            <input type="text" id="txtAmount_1" placeholder="Amount " class="form-control input-sm NumbersAndDecimal" readonly="readonly" /></td>
                                        <td>
                                            <input type="text" id="txtAmountInWords_1" placeholder="Amount in Words" class="form-control input-sm" readonly="readonly" /></td>
                                        <td>
                                            <button type="button" class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i></button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>
                                            <select id="ddlCurrency_2" onchange="SelectThisCurrency(this);" data-placeholder="Choose currency type...">
                                            </select>
                                        </td>
                                        <td>
                                            <input type="text" id="txtAmount_2" placeholder="Amount " class="form-control input-sm NumbersAndDecimal" readonly="readonly" /></td>
                                        <td>
                                            <input type="text" id="txtAmountInWords_2" placeholder="Amount in Words" class="form-control input-sm" readonly="readonly" /></td>
                                        <td>
                                            <button type="button" class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i></button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-10"></div>
                    <div class="col-md-2">
                        <input type="hidden" id="hdnID" value="0" />
                        <input type="hidden" id="hdnOp" value="I" />
                        <button type="button" id="btnSaveAndPrint" class="btn btn-success btn-sm pull-right"><span class="glyphicon glyphicon-print"></span>&nbsp;&nbsp;Save Withdrawal</button>
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
    <script src="js/num-to-words.js"></script>
    <script>
        $(function () {

            $("#txtWithdrawalDate").val(GetCurrentDate());

            $(".select2").select2({
                width: '100%'
            });

            $("#txtWithdrawalDate").datepicker({
                format: "dd/mm/yyyy",
                todayBtn: "linked",
                todayHighlight: true,
                //clearBtn: true,
                autoclose: true
            });

            FillAccountsWithDropdown("ddlAccountNo");
            FillCurrenciesWithDropdown("ddlCurrency_1");
            FillCurrenciesWithDropdown("ddlCurrency_2");

            $(document).on("keyup", '[id^=txtAmount]', function () {

                //if ($.trim($("#txtBalanceUSD").val()) != "" && $.trim($("#txtBalanceZAR").val()) != "") {

                var DepositAmount = Number($(this).val());
                var BalanceInUSD = Number($('#txtBalanceUSD').val());
                var BalanceInZAR = Number($('#txtBalanceZAR').val());

                //// Get ID after underscore
                var count = $.trim($(this).attr('id').split('_').pop());
                var currency = $("#ddlCurrency_" + count).find(":selected").val();

                var words = toWords(DepositAmount);
                var AmountInWords = ((currency == "USD") ? (words + "Dollar(s) Only") : (words + "rand(s) Only"));
                $("#txtAmountInWords_" + count).val(AmountInWords);


                //} else {
                //    ShowMessage("Please choose customer first!", "Warning", "Overhang");
                //    $(this).val("");
                //}
            });

            $("#btnSaveAndPrint").on("click", function () {
                WithdrawalOperations();
            });

        });

        /* ===============================================
         * ======== JAVASCRIPT FUNCTIONS SECTION =========
         * =============================================== */

        function SelectThisCurrency(ddl) {
            var row = $(ddl).closest("tr");
            var currency = $("option:selected", ddl).val();

            if (currency != "-1") {
                $("td", row).eq(2).find("input").removeAttr("readonly");
                $("td", row).eq(2).find("input").attr("placeholder", "Amount in " + currency);
            }
            else {
                //ShowMessage("Please choose currency!", "Info", "Toastr");
                $("td", row).eq(2).find("input").prop('readonly', true);
                $("td", row).eq(2).find("input").attr("placeholder", "Amount ");
                $(ddl).focus();
            }
        }

        function GetCustomerBalance(ddl) {

            if ($.trim($("option:selected", ddl).val()) == "") {
                //ShowMessage(FeedBackMessages.customErrorMsg("Please choose account number!"), "Error", GetActiveNotificationPlugin());
                $("#txtBalanceUSD").val(accounting.formatNumber(0, 2, ","));
                $("#txtBalanceZAR").val(accounting.formatNumber(0, 2, ","));
                return false;
            }

            var DataAdapter = {
                AccountNo: $.trim($("option:selected", ddl).val())
            };

            $.ajax({
                type: "POST",
                url: "DataLoader.aspx/GetAccountBalanceByAccountNo",
                data: JSON.stringify(DataAdapter),
                contentType: "application/json",
                dataType: "json",
                async: false,
                cache: false,
                beforeSend: function () {
                    //enable loader
                    ShowPreloader("ddlAccountNo");
                },
                success: function (data) {
                    try {
                        var dataReturned = $.parseJSON(data.d);

                        //console.log(dataReturned);

                        $("#txtBalanceUSD").val(accounting.formatNumber(dataReturned.AmountInUSD, 2, ","));
                        $("#txtBalanceZAR").val(accounting.formatNumber(dataReturned.AmountInZAR, 2, ","));

                    } catch (err) {
                        ShowMessage("Failed to load account balance from the database!", "Error", GetActiveNotificationPlugin());
                    }
                },
                error: function (xhr, status, e) {
                    var errorMsg = "Error occur while fetching account balance : " + xhr.responseText;
                    console.log(errorMsg);
                    ShowMessage("Error occur while fetching account balance!", "Error", GetActiveNotificationPlugin());
                },
                complete: function () {
                    ///disable loader
                    HidePreloader("ddlAccountNo");
                }
            }); // end: ajax

        }

        function WithdrawalOperations() {
            // Prevent Double form submitting
            $('button[id="btnSaveAndPrint"]').prop('disabled', true);
            $("#btnSaveAndPrint").text("Saving data...");

            if (ValidateFormFields() == 'Yes') {

                try {

                    var WithdrawalDetails = [];

                    /* ======== WITHDRAWAL DETAILS INFO ========= */
                    $("#tblList tbody").find('tr').each(function (i, el) {

                        // Get Data from html table element
                        var $tds = $(this).find('td'),
                            SN = $tds.eq(0).text(),
                            CurrencyCode = $tds.eq(1).find("select").find(":selected").val(),
                            Amount = parseFloat($.trim($tds.eq(2).find("input").val())),
                            AmountInWords = $.trim($tds.eq(3).find("input").val());

                        if ((CurrencyCode !== "") && (Amount !== "") && (AmountInWords !== "")) {
                            // Create new WithdrawalDetail object that holds each WithdrawalDetail value
                            var WithdrawalDetail = {
                                WithDrawalDetailID: 0,
                                WithDrawalID: 0,
                                CurrencyCode: CurrencyCode,
                                Amount: Amount,
                                AmountInWords: AmountInWords
                            };

                            // Add List of WithdrawalDetails to the current WithdrawalDetail object
                            WithdrawalDetails.push(WithdrawalDetail);
                        }

                    });

                    /* ======== WITHDRAWAL INFO ========= */
                    var Withdrawal = {
                        WithDrawalID: $("#hdnID").val(),
                        AccountNo: $("#ddlAccountNo").val(),
                        Remarks: $("#txtRemarks").val(),
                        WithdrawalDetails: WithdrawalDetails,
                        RowGuid: null
                    };


                    var DataToSend = {
                        withdrawal: Withdrawal,
                        WithDrawalDate: $("#txtWithdrawalDate").val(),
                        Op: $('#hdnOp').val()
                    };

                    //console.log(DataToSend);

                    SendDataViaAjaxWithFeedback("Withdrawals.aspx/WithdrawalOperations", DataToSend, "btnSaveAndPrint");

                } catch (err) {
                    ShowMessage(FeedBackMessages.failedToSaveDataMsg, "Error", GetActiveNotificationPlugin());
                    ResetSaveButton("btnSaveOption");
                }

            }

            //ResetSaveButtonText();
        }

        function ValidateFormFields() {
            var IsValidated = 'Yes';

            if ($.trim($("#txtWithdrawalDate").val()) == "") {
                ShowMessage(FeedBackMessages.customErrorMsg("Please choose withdrawal date!"), "Error", GetActiveNotificationPlugin());
                $("#txtWithdrawalDate").focus();
                $("#txtWithdrawalDate").removeAttr("disabled");
                IsValidated = 'No';
            }

            if ($.trim($("#ddlAccountNo option:selected").val()) == "") {
                ShowMessage(FeedBackMessages.customErrorMsg("Please choose account number!"), "Error", GetActiveNotificationPlugin());
                $("#ddlAccountNo").focus();
                $("#btnSaveAndPrint").removeAttr("disabled");
                IsValidated = 'No';
            }

            var IsFirstLoop = "Y";

            $("#tblList tbody").find('tr').each(function (i, el) {
                // Get Data from html table element
                var $tds = $(this).find('td'),
                    SN = $tds.eq(0).text(),
                    CurrencyCode = $.trim($tds.eq(1).find("select").find(":selected").val()),
                    Amount = parseFloat($.trim($tds.eq(2).find("input").val())),
                    AmountInWords = $.trim($tds.eq(3).find("input").val());

                if (IsFirstLoop == "Y") {
                    //console.log(CurrencyCode);
                    //alert("first loop");
                    //alert(AmountInWords);
                    if (($.trim(CurrencyCode) == "") && ($.trim(Amount) == "") && ($.trim(AmountInWords) == "")) {
                        //alert("inside first loop if");
                        ShowMessage(FeedBackMessages.customErrorMsg("Please choose currency type!"), "Error", GetActiveNotificationPlugin());
                        $("#ddlAccountNo").focus();
                        $("#btnSaveAndPrint").removeAttr("disabled");
                        IsValidated = 'No';
                    } else {
                        //alert("inside first loop else");
                    }

                } else {
                    //alert("second loop");
                    if ((CurrencyCode == "") && (Amount !== "") && (AmountInWords !== "")) {
                        //alert("inside second loop if");
                        ShowMessage(FeedBackMessages.customErrorMsg("Please choose currency type!"), "Error", GetActiveNotificationPlugin());
                        $("#ddlAccountNo").focus();
                        $("#btnSaveAndPrint").removeAttr("disabled");
                        IsValidated = 'No';
                    } else {
                        //alert("inside second loop else");
                    }

                }

                IsFirstLoop = "N";
            });

            return IsValidated;
        }

        function clearTextBox() {
            $('#hdnID').val(0);
            $('#hdnOp').val("I");

            $("#txtWithdrawalDate").val(GetCurrentDate());
            $('#ddlAccountNo').val("").trigger('change');
            $('#txtRemarks').val("");


            $('*[id^="ddlCurrency"]').val("").trigger('change');
            $('*[id^="txtAmount"]').val("");
            $('*[id^="txtAmountInWords"]').val("");

            $('#btnSaveAndPrint').html("<span class='glyphicon glyphicon-print'></span>&nbsp;&nbsp;Save Withdrawal");
        }

        function ResetSaveButton() {
            $('#btnSaveAndPrint').prop('disabled', false);
            $('#btnSaveAndPrint').html("<span class='glyphicon glyphicon-print'></span>&nbsp;&nbsp;Save Withdrawal");
        }

    </script>
</asp:Content>
