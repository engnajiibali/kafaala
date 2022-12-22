<%@ Page Title="Knockout " Language="C#" MasterPageFile="~/SiteMasterPage.Master" AutoEventWireup="true" CodeBehind="KnockoutTest.aspx.cs" Inherits="KafaalaSystem.KnockoutTest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="server">


    <div class="pageheader">
        <h2><i class="fa fa-money"></i>Knockout.js <span>Knockout.js implementation</span></h2>
        <div class="breadcrumb-wrapper">
            <span class="label">You are here:</span>
            <ol class="breadcrumb">
                <li><a href="javascript:void(0);">Home</a></li>
                <li class="active">Knockout.js</li>
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
                <h3 class="panel-title">Knockout.js</h3>
            </div>
            <div class="panel-body">

                <div>
                    <h1>Knockout demo with asp.net web forms and asp.net webapi</h1>
                </div>

                <table class="table table-condensed">
                    <thead>
                        <tr>
                            <th>Account No</th>
                            <th>First Name</th>
                            <th>Middle Name</th>
                            <th>Last Name</th>
                        </tr>
                    </thead>
                    <tbody data-bind="foreach: accounts">
                        <tr>
                            <td data-bind="text: CustomerID"></td>
                            <td data-bind="text: FirstName"></td>
                            <td data-bind="text: MiddleName"></td>
                            <td data-bind="text: LastName"></td>
                        </tr>
                    </tbody>
                </table>

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
    <script type="text/javascript">
        var viewModel =
            {
                accounts: ko.observableArray([]),
            }
        $(document).ready(function () {
            $.ajax({
                url: "/api/Account",
                contentType: "text/json",
                type: "GET",
                success: function (data) {
                    $.each(data, function (index) {
                        viewModel.accounts.push(ToKnockOutObservable(data[index]));
                    });
                    ko.applyBindings(viewModel);
                },
                error: function (data) {
                    alert("error occured");
                }
            });

            function ToKnockOutObservable(account) {
                return {
                    CustomerID: ko.observable(account.CustomerID),
                    FirstName: ko.observable(account.FirstName),
                    MiddleName: ko.observable(account.MiddleName),
                    LastName: ko.observable(account.LastName),
                };
            }
        });
    </script>
    <script>

    </script>
</asp:Content>
