<%@ Page Title="Transfers - Kafaala Cash Management System" Language="C#" MasterPageFile="~/SiteMasterPage.Master" AutoEventWireup="true" CodeBehind="Transfers.aspx.cs" Inherits="KafaalaSystem.Transfers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="server">

    <div class="pageheader">
        <h2><i class="fa fa-money"></i>Transfers <span>Account to Account</span></h2>
        <div class="breadcrumb-wrapper">
            <span class="label">You are here:</span>
            <ol class="breadcrumb">
                <li><a href="javascript:void(0);">Activity</a></li>
                <li class="active">Transfers</li>
            </ol>
        </div>
    </div>

    <div class="contentpanel">
        <div class="panel panel-success">
            <div class="panel-heading">
                <div class="panel-btns">
                    <a href="" class="panel-close">×</a>
                    <a href="" class="minimize">−</a>
                </div>
                <h3 class="panel-title">Transfers</h3>
                <p>Account to Account Transfer form</p>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div id="leftSection" class="col-md-8">
                        <div class="row">
                            <div class="col-md-7">
                                <div class="form-group">
                                    <label for="txtTransferDate" class="col-sm-4 control-label">Transfer Date *:</label>
                                    <div class="col-sm-5">
                                        <input type="text" id="txtTransferDate" placeholder="dd/MM/yyyy" class="form-control input-sm" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-7">
                                <div class="form-group">
                                    <label for="ddlFromAccountNo" class="col-sm-4 control-label">From Account Number *:</label>
                                    <div class="col-sm-8">
                                        <select id="ddlFromAccountNo" onchange="GetCustomerBalance(this)" data-placeholder="Choose account no...">
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-7">
                                <div class="form-group">
                                    <label for="ddlToAccountNo" class="col-sm-4 control-label">To Account Number *:</label>
                                    <div class="col-sm-8">
                                        <select id="ddlToAccountNo" data-placeholder="Choose account no...">
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-7">
                                <div class="form-group">
                                    <label for="txtRemarks" class="col-sm-4 control-label">Remarks :</label>
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
                                    <label class="control-label">Transferer Balance (USD):</label>
                                    <input type="text" id="txtBalanceUSD" placeholder="USD Balance" class="form-control input-sm" readonly="readonly" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-7 pull-right">
                                <div class="form-group">
                                    <label class="control-label">Transferer Balance (ZAR):</label>
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
                            <table class="table table-bordered table-dark" id="tblList">
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
                                                <%--<option value="-1">&hellip; Select Currency &hellip;</option>
                                                <option value="USD">United States Dollar (USD)</option>
                                                <option value="ZAR">South African Rand (ZAR)</option>--%>
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
                                                <%--<option value="-1">&hellip; Select Currency &hellip;</option>
                                                <option value="USD">United States Dollar (USD)</option>
                                                <option value="ZAR">South African Rand (ZAR)</option>--%>
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
                        <button type="button" id="btnSaveAndPrint" class="btn btn-success btn-sm pull-right"><span class="glyphicon glyphicon-print"></span>&nbsp;&nbsp;Save & Print Receipt</button>
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
    <script>
        $(function () {

            $("#txtTransferDate").val(GetCurrentDate());

            $(".select2").select2({
                width: '100%'
            });

            $("#txtTransferDate").datepicker({
                format: "dd/mm/yyyy",
                todayBtn: "linked",
                todayHighlight: true,
                //clearBtn: true,
                autoclose: true
            });

            FillAccountsWithDropdown("ddlFromAccountNo");
            FillAccountsWithDropdown("ddlToAccountNo");
            FillCurrenciesWithDropdown("ddlCurrency_1");
            FillCurrenciesWithDropdown("ddlCurrency_2");


            $(document).on("keyup", '[id^=txtAmount]', function () {

                var DepositAmount = Number($(this).val());
                var BalanceInUSD = Number($('#txtBalanceUSD').val());
                var BalanceInZAR = Number($('#txtBalanceZAR').val());

                //// Get ID after underscore
                var count = $.trim($(this).attr('id').split('_').pop());
                var currency = $("#ddlCurrency_" + count).find(":selected").val();

                var words = toWords(DepositAmount);
                var AmountInWords = ((currency == "USD") ? (words + "Dollar(s) Only") : (words + "rand(s) Only"));
                $("#txtAmountInWords_" + count).val(AmountInWords);

            });

            $("#btnSaveAndPrint").on("click", function () {
                TransferOperations();
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
                    ShowPreloader("ddlFromAccountNo");
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
                    HidePreloader("ddlFromAccountNo");
                }
            }); // end: ajax

        }

        function TransferOperations() {
            // Prevent Double form submitting
            $('button[id="btnSaveOption"]').prop('disabled', true);
            $("#btnSaveOption").text("Saving data...");

            if (ValidateFormFields() == 'Yes') {

                try {

                    var TransferDetails = [];

                    /* ======== DEPOSIT DETAILS INFO ========= */
                    $("#tblList tbody").find('tr').each(function (i, el) {

                        // Get Data from html table element
                        var $tds = $(this).find('td'),
                            SN = $tds.eq(0).text(),
                            CurrencyCode = $tds.eq(1).find("select").find(":selected").val(),
                            Amount = parseFloat($.trim($tds.eq(2).find("input").val())),
                            AmountInWords = $.trim($tds.eq(3).find("input").val());

                        if ((CurrencyCode !== "") && (Amount !== "") && (AmountInWords !== "")) {
                            // Create new TransferDetail object that holds each TransferDetail value
                            var TransferDetail = {
                                TransferDetailID: 0,
                                TransferID: 0,
                                CurrencyCode: CurrencyCode,
                                Amount: Amount,
                                AmountInWords: AmountInWords
                            };

                            // Add List of TransferDetails to the current TransferDetail object
                            TransferDetails.push(TransferDetail);
                        }

                    });

                    /* ======== DEPOSIT INFO ========= */
                    var Transfer = {
                        TransferID: $("#hdnID").val(),
                        FromAccount: $("#ddlFromAccountNo").val(),
                        ToAccount: $("#ddlToAccountNo").val(),
                        Description: $("#txtRemarks").val(),
                        TransferDetails: TransferDetails,
                        RowGuid: null
                    };


                    var DataToSend = {
                        transfer: Transfer,
                        TransferDate: $("#txtTransferDate").val(),
                        Op: $('#hdnOp').val()
                    };

                    //console.log(DataToSend);

                    SendDataViaAjaxWithFeedback("Transfers.aspx/TransferOperations", DataToSend, "btnSaveAndPrint");

                } catch (err) {
                    //alert(err);
                    ShowMessage(FeedBackMessages.failedToSaveDataMsg, "Error", GetActiveNotificationPlugin());
                    ResetSaveButton("btnSaveOption");
                }

            }

            //ResetSaveButtonText();
        }

        function ValidateFormFields() {
            var IsValidated = 'Yes';

            if ($.trim($("#txtTransferDate").val()) == "") {
                ShowMessage(FeedBackMessages.customErrorMsg("Please choose transfer date!"), "Error", GetActiveNotificationPlugin());
                $("#txtTransferDate").focus();
                $("#txtTransferDate").removeAttr("disabled");
                IsValidated = 'No';
            }

            if ($.trim($("#ddlFromAccountNo option:selected").val()) == "") {
                ShowMessage(FeedBackMessages.customErrorMsg("Please choose from account number!"), "Error", GetActiveNotificationPlugin());
                $("#ddlFromAccountNo").focus();
                $("#btnSaveAndPrint").removeAttr("disabled");
                IsValidated = 'No';
            }

            if ($.trim($("#ddlToAccountNo option:selected").val()) == "") {
                ShowMessage(FeedBackMessages.customErrorMsg("Please choose account number to transfer!"), "Error", GetActiveNotificationPlugin());
                $("#ddlToAccountNo").focus();
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

            $("#txtTransferDate").val(GetCurrentDate());
            $('#ddlFromAccountNo').val("").trigger('change');
            $('#ddlToAccountNo').val("").trigger('change');
            $('#txtRemarks').val("");


            $('*[id^="ddlCurrency"]').val("").trigger('change');
            $('*[id^="txtAmount"]').val("");
            $('*[id^="txtAmountInWords"]').val("");

            $('#btnSaveAndPrint').html("<span class='glyphicon glyphicon-print'></span>&nbsp;&nbsp;Save Withdrawal");
        }

    </script>
</asp:Content>
