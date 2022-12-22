<%@ Page Title="Dashboard - Kafaala Cash Management System" Language="C#" MasterPageFile="~/SiteMasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="KafaalaSystem.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="server">

    <div class="pageheader">
        <h2><i class="fa fa-home"></i>Dashboard <span>Home page</span></h2>
        <div class="breadcrumb-wrapper">
            <span class="label">You are here:</span>
            <ol class="breadcrumb">
                <li><a href="Default.aspx">Home</a></li>
                <li class="active">Dashboard</li>
            </ol>
        </div>
    </div>

    <div class="contentpanel">

        <div class="row">

            <div class="col-sm-6 col-md-3">
                <div class="panel panel-success panel-stat">
                    <div class="panel-heading">

                        <div class="stat">
                            <div class="row">
                                <div class="col-xs-4">
                                    <img src="images/is-user.png" alt="" />
                                </div>
                                <div class="col-xs-8">
                                    <small class="stat-label">Registered Accounts</small>
                                    <h1>10k+</h1>
                                </div>
                            </div>
                            <!-- row -->

                            <div class="mb15"></div>

                            <div class="row">
                                <div class="col-xs-6">
                                    <small class="stat-label">Old Accounts</small>
                                    <h4>7.80</h4>
                                </div>

                                <div class="col-xs-6">
                                    <small class="stat-label">% New Accounts</small>
                                    <h4>76.43%</h4>
                                </div>
                            </div>
                            <!-- row -->
                        </div>
                        <!-- stat -->

                    </div>
                    <!-- panel-heading -->
                </div>
                <!-- panel -->
            </div>
            <!-- col-sm-6 -->

            <div class="col-sm-6 col-md-3">
                <div class="panel panel-danger panel-stat">
                    <div class="panel-heading">

                        <div class="stat">
                            <div class="row">
                                <div class="col-xs-4">
                                    <img src="images/is-money.png" alt="" />
                                </div>
                                <div class="col-xs-8">
                                    <small class="stat-label">Withdrawal %</small>
                                    <h1>54.40%</h1>
                                </div>
                            </div>
                            <!-- row -->

                            <div class="mb15"></div>

                            <div class="row">
                                <div class="col-xs-6">
                                    <small class="stat-label">Credits (USD)</small>
                                    <h4>7.80%</h4>
                                </div>

                                <div class="col-xs-6">
                                    <small class="stat-label">Credits (ZAR)</small>
                                    <h4>76.43%</h4>
                                </div>
                            </div>
                            <!-- row -->

                        </div>
                        <!-- stat -->

                    </div>
                    <!-- panel-heading -->
                </div>
                <!-- panel -->
            </div>
            <!-- col-sm-6 -->

            <div class="col-sm-6 col-md-3">
                <div class="panel panel-primary panel-stat">
                    <div class="panel-heading">

                        <div class="stat">
                            <div class="row">
                                <div class="col-xs-4">
                                    <img src="images/is-money.png" alt="" />
                                </div>
                                <div class="col-xs-8">
                                    <small class="stat-label">Deposits %</small>
                                    <h1>30.60%</h1>
                                </div>
                            </div>
                            <!-- row -->

                            <div class="mb15"></div>

                            <div class="row">
                                <div class="col-xs-6">
                                    <small class="stat-label">Debits (USD)</small>
                                    <h4>7.80%</h4>
                                </div>

                                <div class="col-xs-6">
                                    <small class="stat-label">Debits (ZAR)</small>
                                    <h4>76.43%</h4>
                                </div>
                            </div>
                            <!-- row -->

                        </div>
                        <!-- stat -->

                    </div>
                    <!-- panel-heading -->
                </div>
                <!-- panel -->
            </div>
            <!-- col-sm-6 -->

            <div class="col-sm-6 col-md-3">
                <div class="panel panel-dark panel-stat">
                    <div class="panel-heading">

                        <div class="stat">
                            <div class="row">
                                <div class="col-xs-4">
                                    <img src="images/is-money.png" alt="" />
                                </div>
                                <div class="col-xs-8">
                                    <small class="stat-label">Today's Earnings</small>
                                    <h1>$655</h1>
                                </div>
                            </div>
                            <!-- row -->

                            <div class="mb15"></div>

                            <div class="row">
                                <div class="col-xs-6">
                                    <small class="stat-label">Last Week</small>
                                    <h4>$32,322</h4>
                                </div>

                                <div class="col-xs-6">
                                    <small class="stat-label">Last Month</small>
                                    <h4>$503,000</h4>
                                </div>
                            </div>
                            <!-- row -->

                        </div>
                        <!-- stat -->

                    </div>
                    <!-- panel-heading -->
                </div>
                <!-- panel -->
            </div>
            <!-- col-sm-6 -->
        </div>
        <!-- row -->

        <div class="row">
            <div class="col-sm-8 col-md-9">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-sm-8">
                                <h5 class="subtitle mb5">Deposits Made This Month</h5>
                                <p class="mb15">The following graph shows all deposits made for this month.</p>
                                <div id="basicflot" style="width: 100%; height: 300px; margin-bottom: 20px"></div>
                            </div>
                            <!-- col-sm-8 -->
                            <div class="col-sm-4">
                                <h5 class="subtitle mb5">Server Status</h5>
                                <p class="mb15">Summary of the status of your server.</p>

                                <span class="sublabel">CPU Usage (40.05 - 32 cpus)</span>
                                <div class="progress progress-sm">
                                    <div style="width: 40%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="40" role="progressbar" class="progress-bar progress-bar-primary"></div>
                                </div>
                                <!-- progress -->

                                <span class="sublabel">Memory Usage (32.2%)</span>
                                <div class="progress progress-sm">
                                    <div style="width: 32%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="40" role="progressbar" class="progress-bar progress-bar-success"></div>
                                </div>
                                <!-- progress -->

                                <span class="sublabel">Disk Usage (82.2%)</span>
                                <div class="progress progress-sm">
                                    <div style="width: 82%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="40" role="progressbar" class="progress-bar progress-bar-danger"></div>
                                </div>
                                <!-- progress -->

                                <span class="sublabel">Databases (63/100)</span>
                                <div class="progress progress-sm">
                                    <div style="width: 63%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="40" role="progressbar" class="progress-bar progress-bar-warning"></div>
                                </div>
                                <!-- progress -->

                                <span class="sublabel">Domains (2/10)</span>
                                <div class="progress progress-sm">
                                    <div style="width: 20%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="40" role="progressbar" class="progress-bar progress-bar-success"></div>
                                </div>
                                <!-- progress -->

                                <span class="sublabel">Email Account (13/50)</span>
                                <div class="progress progress-sm">
                                    <div style="width: 26%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="40" role="progressbar" class="progress-bar progress-bar-success"></div>
                                </div>
                                <!-- progress -->


                            </div>
                            <!-- col-sm-4 -->
                        </div>
                        <!-- row -->
                    </div>
                    <!-- panel-body -->
                </div>
                <!-- panel -->
            </div>
            <!-- col-sm-9 -->

            <div class="col-sm-4 col-md-3">

                <div class="panel panel-default">
                    <div class="panel-body">
                        <h5 class="subtitle mb5">Today's Begining Balance</h5>
                        <p class="mb15">This graph shows today's begining balance.</p>
                        <div id="donut-begining-balance" class="ex-donut-chart"></div>
                    </div>
                    <!-- panel-body -->
                </div>
                <!-- panel -->

            </div>
            <!-- col-sm-3 -->

        </div>
        <!-- row -->

    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphFooter" runat="server">
    <script src="<%=Fingerprint.Tag("/js/dashboard.js") %>"></script>
    <script type="text/javascript">
        $(function () {
            GreetUser();
        });

        /* ===============================================
         * ======== JAVASCRIPT FUNCTIONS SECTION =========
         * =============================================== */

        function GreetUser() {
            if ("<%= Session["GreetingUserName"] %>" != "") {
                var errorMsg = "Welcome back " + "<%= Session["GreetingUserName"] %>";
                var msgType = "Success";
                var msgPlugin = "Lobibox";
                ShowMessage(errorMsg, msgType, msgPlugin);
                setTimeout(function () {
                    '<% Session["GreetingUserName"] = ""; %>';
                }, 4000);
            }
        }

    </script>
</asp:Content>
