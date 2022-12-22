<%@ Page Title="Customers - Kafaala Cash Management System" Language="C#" MasterPageFile="~/SiteMasterPage.Master" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="KafaalaSystem.Customers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="server">

    <div class="pageheader">
        <h2><i class="fa fa-group"></i>Customers <span>Customer operations</span></h2>
        <div class="breadcrumb-wrapper">
            <span class="label">You are here:</span>
            <ol class="breadcrumb">
                <li><a href="javascript:void(0);">Registration</a></li>
                <li class="active">Customers</li>
            </ol>
        </div>
    </div>

    <div class="contentpanel">
        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="panel-btns">
                    <a href="#" data-toggle="modal" data-target="#myModalPage"><i class="fa fa-plus"></i>&nbsp;Add new Customer</a>
                </div>
                <h4 class="panel-title">Customers list</h4>
            </div>
            <div class="panel-body">

                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table class="table table-primary" id="tblList">
                                <thead>
                                    <tr>
                                        <th>SN</th>
                                        <th>Customer ID</th>
                                        <th>Customer Name</th>
                                        <th>Phone</th>
                                        <th>Balance (USD)</th>
                                        <th>Balance (ZAR)</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%--<tr>
                                        <td>1</td>
                                        <td>13001</td>
                                        <td>Maxamed Amiin Xaaji</td>
                                        <td>+252615720758</td>
                                        <td>1,500.00</td>
                                        <td>0.00</td>
                                        <td>
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-xs btn-success">Customer Actions</button>
                                                <button type="button" class="btn btn-xs btn-success dropdown-toggle" data-toggle="dropdown">
                                                    <span class="caret"></span>
                                                    <span class="sr-only">Toggle Dropdown</span>
                                                </button>
                                                <ul class="dropdown-menu" role="menu">
                                                    <li><a href="javascript:void(0);">Make Deposit</a></li>
                                                    <li><a href="javascript:void(0);">Make Withdrawal</a></li>
                                                    <li><a href="javascript:void(0);">Make Transfer</a></li>
                                                    <li><a href="javascript:void(0);">View Statement</a></li>
                                                    <li class="divider"></li>
                                                    <li><a href="javascript:void(0);">View Customer</a></li>
                                                    <li><a href="javascript:void(0);">Edit Customer</a></li>
                                                    <li><a href="javascript:void(0);">Delete Customer</a></li>
                                                </ul>
                                            </div>
                                            <!-- btn-group -->
                                        </td>
                                    </tr>--%>
                                </tbody>
                            </table>

                            <br />
                            <br />
                        </div>

                        <!-- Modal -->
                        <div id="myModalPage" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button aria-hidden="true" data-dismiss="modal" class="close" type="button">&times;</button>
                                        <h4 id="myModalHeader" class="modal-title">Account Registration</h4>
                                    </div>
                                    <div class="modal-body">
                                        <form id="basicForm" runat="server">
                                            <div id="AlertContainer"></div>

                                            <div class="row">
                                                <div class="form-group col-md-4">
                                                    <label for="txtFirstName">First Name *:</label>
                                                    <input type="text" id="txtFirstName" class="form-control input-sm" />
                                                </div>
                                                <div class="form-group col-md-4">
                                                    <label for="txtMiddleName">Middle Name *:</label>
                                                    <input type="text" id="txtMiddleName" class="form-control input-sm" />
                                                </div>
                                                <div class="form-group col-md-4">
                                                    <label for="txtLastName">Last Name *:</label>
                                                    <input type="text" id="txtLastName" class="form-control input-sm" />
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="form-group col-md-2">
                                                    <label for="txtDateOfBirth">Date Of Birth :</label>
                                                    <input type="text" id="txtDateOfBirth" class="form-control input-sm" />
                                                </div>
                                                <div class="form-group col-md-4">
                                                    <label for="txtPlaceOfBirth">Place Of Birth :</label>
                                                    <input type="text" id="txtPlaceOfBirth" class="form-control input-sm" />
                                                </div>
                                                <div class="form-group col-md-3">
                                                    <label for="txtCustomerPhone">Phone/Telephone *:</label>
                                                    <input type="text" id="txtCustomerPhone" class="form-control input-sm" data-mask="(999) 999-999999" />
                                                </div>
                                                <div class="form-group col-md-3">
                                                    <label for="txtCustomerEmail">Email :</label>
                                                    <input type="email" id="txtCustomerEmail" class="form-control input-sm" />
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="form-group col-md-4">
                                                    <label for="ddlDocumentType">Document Type *:</label>
                                                    <select id="ddlDocumentType" data-placeholder="Choose document type...">
                                                        <%--<option value="-1">&hellip; Choose option &hellip;</option>
                                                        <option value="Passport">Passport</option>
                                                        <option value="Driving Licence">Driving Licence</option>
                                                        <option value="Bill">Bill</option>
                                                        <option value="Other">Other</option>--%>
                                                    </select>
                                                </div>
                                                <div class="form-group col-md-3" id="divID">
                                                    <label for="txtDocumentNumber">Document Number *:</label>
                                                    <input type="text" id="txtDocumentNumber" class="form-control input-sm" />
                                                </div>
                                                <div class="form-group col-md-5">
                                                    <label for="txtIssuedBy">Issued By :</label>
                                                    <input type="text" id="txtIssuedBy" class="form-control input-sm" />
                                                </div>
                                            </div>

                                            <div class="row" id="divDates">
                                                <div class="form-group col-md-3">
                                                    <label for="txtIssuedDate">Issued Date *:</label>
                                                    <div class="input-group">
                                                        <input type="text" id="txtIssuedDate" class="form-control" placeholder="dd/mm/yyyy">
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-3">
                                                    <label for="txtExpireDate">Expire Date *:</label>
                                                    <div class="input-group">
                                                        <input type="text" id="txtExpireDate" class="form-control" placeholder="dd/mm/yyyy">
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                    </div>
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label for="txtCustomerAddress">Address :</label>
                                                    <input type="text" id="txtCustomerAddress" class="form-control input-sm" />
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <!-- /.modal-body -->
                                    <div class="modal-footer">
                                        <input type="hidden" id="hdnID" value="0" />
                                        <input type="hidden" id="hdnOp" value="I" />
                                        <button type="button" class="btn btn-default btn-sm pull-left" data-dismiss="modal">Close</button>
                                        <div class="btn-group  pull-right">
                                            <button type="button" id="btnSaveOption" data-saveoption="" class="btn btn-success btn-sm">Save and Close</button>
                                            <button type="button" class="btn btn-success btn-sm dropdown-toggle" data-toggle="dropdown"><i class="fa fa-caret-down"></i></button>
                                            <ul class="dropdown-menu">
                                                <li style="text-align: left;"><a href="javascript:void(0);" onclick="SelectThisSaveOption('SaveAndClose');">Save and Close</a></li>
                                                <li style="text-align: left;"><a href="javascript:void(0);" onclick="SelectThisSaveOption('SaveAndNew');">Save and New</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- /.modal-footer -->
                                </div>
                            </div>
                        </div>
                        <!-- /.modal -->


                        <div id="mdlConfirmation" class="modal hide fade " tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="false" style="display: block;">
                            <div class="modal-header" style="background-color: #c0392b; color: white;">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h3 id="myModalLabel3">Confirm Deleting</h3>
                            </div>
                            <div class="modal-body">
                                <h3>Are you sure you want to delete customer with ID of <strong><span id="spanDrugID"></span></strong></h3>
                            </div>
                            <div class="modal-footer" style="background-color: #e2c2be; color: white;">
                                <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                                <button data-dismiss="modal" class="btn btn-danger">Confirm</button>
                            </div>
                        </div>


                    </div>

                </div>
            </div>
            <!-- panel-body -->
        </div>
        <!-- panel -->
    </div>
    <!-- contentpanel -->

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphFooter" runat="server">
    <script src="js/accounting.js"></script>
    <script type="text/javascript">
        $(function () {
            $('#txtDateOfBirth, #txtIssuedDate, #txtExpireDate').datepicker({
                format: "dd/mm/yyyy",
                todayBtn: "linked",
                todayHighlight: true,
                autoclose: true
            });

            GetAllCustomers();
            FillDocumentTypesWithDropdown("ddlDocumentType");

        });

        /* ===============================================
         * ======== JAVASCRIPT FUNCTIONS SECTION =========
         * =============================================== */

        function GetAllCustomers() {
            var table = $("#tblList tbody");
            $("#tblList").find("tbody").empty();

            $.ajax({
                type: "POST",
                url: "Customers.aspx/GetAllCustomers",
                contentType: "application/json",
                dataType: "json",
                async: true,
                cache: true,
                beforeSend: function () {
                    //enable loader
                    ShowPreloader("tblList");
                },
                success: function (data) {
                    try {
                        var dataReturned = data.d; //$.parseJSON(data.d);
                        var html = "";
                        console.log(dataReturned);

                        $.each(dataReturned, function (i, d) {

                            html += '<tr>';
                            html += '    <td>' + (i + 1) + '</td>';
                            html += '    <td>' + d.CustomerID + '</td>';
                            html += '    <td>' + d.CustomerName + '</td>';
                            html += '    <td>' + d.CustomerPhone + '</td>';
                            html += '    <td>' + accounting.formatNumber(d.BalanceInUSD, 2, ",") + '</td>';
                            html += '    <td>' + accounting.formatNumber(d.BalanceInZAR, 2, ",") + '</td>';
                            html += '    <td>';
                            html += '        <div class="btn-group">';
                            html += '            <button type="button" class="btn btn-xs btn-success">Customer Actions</button>';
                            html += '            <button type="button" class="btn btn-xs btn-success dropdown-toggle" data-toggle="dropdown">';
                            html += '                <span class="caret"></span>';
                            html += '                <span class="sr-only">Toggle Dropdown</span>';
                            html += '            </button>';
                            html += '            <ul class="dropdown-menu" role="menu">';
                            html += '                <li><a href="Deposits.aspx">Make Deposit</a></li>';
                            html += '                <li><a href="Withdrawals.aspx">Make Withdrawal</a></li>';
                            html += '                <li><a href="Transfers.aspx">Make Transfer</a></li>';
                            html += '                <li><a href="javascript:void(0);">View Statement</a></li>';
                            html += '                <li class="divider"></li>';
                            html += '                <li><a href="javascript:void(0);">View Customer</a></li>';
                            html += '                <li><a href="javascript:void(0);">Edit Customer</a></li>';
                            html += '                <li><a href="javascript:void(0);">Delete Customer</a></li>';
                            html += '            </ul>';
                            html += '        </div>';
                            html += '        <!-- btn-group -->';
                            html += '    </td>';
                            html += '</tr>';

                            //html += '<tr>';
                            //html += '    <td>' + d.EmployeeID + '</td>';
                            //html += '    <td>' + d.IDCardNo + '</td>';
                            //html += '    <td>' + d.FirstName + '</td>';
                            //html += '    <td>' + d.MiddleName + '</td>';
                            //html += '    <td>' + d.LastName + '</td>';
                            //html += '    <td>' + d.Gender + '</td>';
                            //html += '    <td>' + d.Phone + '</td>';
                            //html += '    <td style="display:none;">' + FormatThisDateAsIWant(HandleSerializedCSharpDate(d.HireDate), window.defaultDateFormat) + '</td>';
                            //html += '    <td style="display:none;">' + FormatThisDateAsIWant(HandleSerializedCSharpDate(d.ReleaseDate), window.defaultDateFormat) + '</td>';
                            //html += '    <td style="display:none;">' + FormatThisDateAsIWant(HandleSerializedCSharpDate(d.DateOfBirth), window.defaultDateFormat) + '</td>';
                            //html += '    <td style="display:none;">' + d.Notes + '</td>';
                            //html += '    <td>';
                            //html += '        <button type="button" class="btn btn-success"><i class="fa fa-eye"></i></button>';
                            //html += '        &nbsp;';
                            //html += '        <button type="button" onclick="GetUpdateModal(this);" data-toggle="modal" data-target="#myModalPage" class="btn btn-primary"><i class="fa fa-edit"></i></button>';
                            //html += '        &nbsp;';
                            //html += '        <button type="button" onclick="ConfirmDeletion(this);" class="btn btn-danger"><i class="fa fa-trash-o"></i></button>';
                            //html += '    </td>';
                            //html += '</tr>';

                        });

                        table.append(html);
                    } catch (err) {
                        console.log(err);
                        ShowMessage(FeedBackMessages.errorWhileLoadingDataMsg("customer data"), "Error", GetActiveNotificationPlugin());
                    }
                },
                error: function (xhr, status, e) {
                    ShowMessage(FeedBackMessages.errorWhileFetchingDataMsg("customer data"), "Error", GetActiveNotificationPlugin());
                },
                complete: function () {
                    ///disable loader
                    HidePreloader("tblList");
                }
            }); // end: ajax
        }

        function SelectThisSaveOption(selectedOption) {
            if (selectedOption == "SaveAndClose") {
                $("#btnSaveOption").text("Save and Close");
                $("#btnSaveOption").attr("data-saveoption", "SaveAndClose");
                SaveAndClose();
            }
            else if (selectedOption == "SaveAndNew") {
                $("#btnSaveOption").text("Save and New");
                $("#btnSaveOption").attr("data-saveoption", "SaveAndNew");
                SaveAndNew();
            }
            else {
                $("#btnSaveOption").text("Save and Close");
                $("#btnSaveOption").attr("data-saveoption", "SaveAndClose");
                SaveAndClose();
            }
        }

        function SaveAndClose() {
            // Prevent Double form submitting
            $('button[id="btnSaveOption"]').prop('disabled', true);
            $("#btnSaveOption").text("Saving data...");

            if (ValidateFormFields() == 'Yes') {

                try {

                    var Customer = {
                        CustomerID: $('#hdnID').val(),
                        FirstName: $('#txtFirstName').val(),
                        MiddleName: $('#txtMiddleName').val(),
                        LastName: $('#txtLastName').val(),
                        PlaceOfBirth: $('#txtPlaceOfBirth').val(),
                        CustomerPhone: $('#txtCustomerPhone').val(),
                        CustomerEmail: $('#txtCustomerEmail').val(),
                        CustomerAddress: $('#txtCustomerAddress').val()
                    };

                    var CustomerDocuments = {
                        DocumentTypeID: $('#ddlDocumentType option:selected').val(),
                        DocumentNumber: $('#txtDocumentNumber').val(),
                        IssuedBy: $('#txtIssuedBy').val()
                    };

                    var DataAdapter = {
                        customer: Customer,
                        customerDocument: CustomerDocuments,
                        DateOfBirth: $.trim($('#txtDateOfBirth').val()),
                        IssuedDate: $.trim($('#txtIssuedDate').val()),
                        ExpireDate: $.trim($('#txtExpireDate').val()),
                        Op: $('#hdnOp').val()
                    };

                    SendDataViaAjax("Customers.aspx/CustomerOperations", DataAdapter, "btnSaveOption");
                    CloseOpenModal();
                    GetAllCustomers();
                    ResetSaveButtonText();
                    clearTextBox();
                    //setTimeout(function () {
                    //    ResetSaveButtonText();
                    //    clearTextBox();
                    //}, 4000);


                } catch (err) {
                    ShowMessage(FeedBackMessages.failedToSaveDataMsg, "Error", GetActiveNotificationPlugin());
                    ResetSaveButton("btnSaveOption");
                }

            }

            ResetSaveButtonText();
        }

        function SaveAndNew() {
            // Prevent Double form submitting
            $('button[id="btnSaveOption"]').prop('disabled', true);
            $("#btnSaveOption").text("Saving data...");

            if (ValidateFormFields() == 'Yes') {

                try {

                    var Customer = {
                        CustomerID: $('#hdnID').val(),
                        FirstName: $('#txtFirstName').val(),
                        MiddleName: $('#txtMiddleName').val(),
                        LastName: $('#txtLastName').val(),
                        PlaceOfBirth: $('#txtPlaceOfBirth').val(),
                        CustomerPhone: $('#txtCustomerPhone').val(),
                        CustomerEmail: $('#txtCustomerEmail').val(),
                        CustomerAddress: $('#txtCustomerAddress').val()
                    };

                    var CustomerDocuments = {
                        DocumentTypeID: $('#ddlDocumentType option:selected').val(),
                        DocumentNumber: $('#txtDocumentNumber').val(),
                        IssuedBy: $('#txtIssuedBy').val()
                    };

                    var DataAdapter = {
                        customer: Customer,
                        customerDocument: CustomerDocuments,
                        DateOfBirth: $.trim($('#txtDateOfBirth').val()),
                        IssuedDate: $.trim($('#txtIssuedDate').val()),
                        ExpireDate: $.trim($('#txtExpireDate').val()),
                        Op: $('#hdnOp').val()
                    };

                    SendDataViaAjax("Customers.aspx/CustomerOperations", DataAdapter, "btnSaveOption");
                    clearTextBox();
                    GetAllCustomers();
                    ResetSaveButtonText();



                } catch (err) {
                    ShowMessage(FeedBackMessages.failedToSaveDataMsg, "Error", GetActiveNotificationPlugin());
                    ResetSaveButton("btnSaveOption");
                }

            }

            ResetSaveButtonText();
        }

        function ValidateFormFields() {
            var IsValidated = 'Yes';

            if ($.trim($("#txtFirstName").val()) == "") {
                ShowMessage(FeedBackMessages.customErrorMsg("Fadlan geli magaca koowaad!"), "Error", GetActiveNotificationPlugin());
                $("#txtFirstName").focus();
                $("#btnSaveOption").removeAttr("disabled");
                IsValidated = 'No';
            }

            if ($.trim($("#txtMiddleName").val()) == "") {
                ShowMessage(FeedBackMessages.customErrorMsg("Fadlan geli magaca labaad!"), "Error", GetActiveNotificationPlugin());
                $("#txtMiddleName").focus();
                $("#btnSaveOption").removeAttr("disabled");
                IsValidated = 'No';
            }

            if ($.trim($("#txtLastName").val()) == "") {
                ShowMessage(FeedBackMessages.customErrorMsg("Fadlan geli magaca seddaxaad!"), "Error", GetActiveNotificationPlugin());
                $("#txtLastName").focus();
                $("#btnSaveOption").removeAttr("disabled");
                IsValidated = 'No';
            }

            if ($.trim($("#txtCustomerPhone").val()) == "") {
                ShowMessage(FeedBackMessages.customErrorMsg("Fadlan geli telephone lambarda shaqaalaha!"), "Error", GetActiveNotificationPlugin());
                $("#txtCustomerPhone").focus();
                $("#btnSaveOption").removeAttr("disabled");
                IsValidated = 'No';
            }

            return IsValidated;
        }

        function clearTextBox() {
            $('#hdnID').val(0);
            $('#hdnOp').val("I");

            $('#txtFirstName').val("");
            $('#txtMiddleName').val("");
            $('#txtLastName').val("");
            $('#txtDateOfBirth').val("");
            $('#txtPlaceOfBirth').val("");
            $('#txtCustomerPhone').val("");
            $('#txtCustomerEmail').val("");
            $('#txtCustomerAddress').val("");
            $('#ddlDocumentType').val("").trigger('change');
            $('#txtDocumentNumber').val("");
            $('#txtIssuedBy').val("");
            $('#txtIssuedDate').val("");
            $('#txtExpireDate').val("");

            $('#btnSaveOption').text("Save and Close").attr("data-saveoption", "SaveAndClose");
        }

        function ResetSaveButtonText() {
            var selectedOption = $.trim($('#btnSaveOption').attr("data-saveoption"));
            if (selectedOption == "SaveAndClose") {
                $('#btnSaveOption').text("Save and Close").attr("data-saveoption", "SaveAndClose");
            }
            else if (selectedOption == "SaveAndNew") {
                $('#btnSaveOption').text("Save and Close").attr("data-saveoption", "SaveAndNew");
            }
            else {
                $('#btnSaveOption').text("Save and Close").attr("data-saveoption", "SaveAndClose");
            }
        }

        function CloseOpenModal() {
            //hide the modal
            $('#myModalPage').modal('hide');

            //modal-open class is added on body so it has to be removed
            $('body').removeClass('modal-open');

            //need to remove div with modal-backdrop class
            $('.modal-backdrop').remove();
        }

    </script>
</asp:Content>
