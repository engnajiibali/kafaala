<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="KafaalaSystem.Login" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="images/favicon.png" type="image/png">

    <title>Login - Kafaala Cash Management System</title>

    <link href="css/style.default.css" rel="stylesheet">

    <!-- toastr -->
    <link href="js/toastr/toastr.min.css" rel="stylesheet" />

    <!-- Lobibox -->
    <link href="js/lobibox/css/lobibox.min.css" rel="stylesheet" />
    <link href="js/lobibox/css/animate.css" rel="stylesheet" />

    <!-- OverHang.js -->
    <link href="js/overhang/overhang.min.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
</head>
<body class="signin">
    <section>

        <div class="signinpanel">

            <div class="row">

                <div class="col-md-7">

                    <div class="signin-info">
                        <div class="logopanel">
                            <%--<h1><span>[</span> bracket <span>]</span></h1>--%>
                            <img src="images/kafaala-logo.png" class="center" alt="logo" />
                        </div>
                        <!-- logopanel -->

                        <div class="mb20"></div>

                        <h5><strong>Welcome to Kafaala Cash Management System!</strong></h5>
                        <ul>
                            <li><i class="fa fa-arrow-circle-o-right mr5"></i>User-Friendly System</li>
                            <li><i class="fa fa-arrow-circle-o-right mr5"></i>Interactive Reports</li>
                            <li><i class="fa fa-arrow-circle-o-right mr5"></i>Deposit/Withdrawal features</li>
                            <li><i class="fa fa-arrow-circle-o-right mr5"></i>Money transfer feature</li>
                            <li><i class="fa fa-arrow-circle-o-right mr5"></i>and much more...</li>
                        </ul>
                        <div class="mb20"></div>
                        <%--<strong>Not a member? <a href="signup.html">Sign Up</a></strong>--%>
                    </div>
                    <!-- signin0-info -->

                </div>
                <!-- col-sm-7 -->

                <div class="col-md-5">

                    <form id="frmLogin" runat="server">
                        <h4 class="nomargin">Sign In</h4>
                        <p class="mt5 mb20">Login to access your account.</p>

                        <input type="text" id="txtUsername" name="txtUsername" class="form-control uname" placeholder="Username" runat="server" />
                        <input type="password" id="txtPassword" name="txtPassword" class="form-control pword" placeholder="Password" runat="server" />
                        <a href="javascript:void(0);"><small>Forgot Your Password?</small></a>
                        <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-success btn-block" Text="Sign In" OnClick="btnLogin_Click" />
                    </form>
                </div>
                <!-- col-sm-5 -->

            </div>
            <!-- row -->

            <div class="signup-footer">
                <div class="pull-left">
                    &copy; <%= DateTime.Now.Year %>. All Rights Reserved. Cash Management Solutions
           
                </div>
                <div class="pull-right">
                    Developed By: <a href="http://haadict.so/" target="_blank">HAAD ICT Solutions</a>
                </div>
            </div>

        </div>
        <!-- signin -->

    </section>

    <script src="js/jquery-1.11.1.min.js"></script>

    <script src="js/toggles.min.js"></script>
    <script src="js/retina.min.js"></script>

    <!-- toastr plugin -->
    <script src="js/toastr/toastr.min.js"></script>
    
    <!-- overhang plugin -->
    <script src="js/overhang/overhang.min.js"></script>

    <!-- lobibox plugin -->
    <script src="js/lobibox/js/lobibox.min.js"></script>

    <!-- loadingoverlay plugin -->
    <script src="js/loadingoverlay/loadingoverlay.min.js"></script>

    <!-- My Common javascript function -->
    <script src="<%=Fingerprint.Tag("/js/custom/common-functions.js") %>"></script>

    <script>
        jQuery(document).ready(function () {

            //// Please do not use the code below
            //// This is for demo purposes only
            //var c = jQuery.cookie('change-skin');
            //if (c && c == 'greyjoy') {
            //    jQuery('.btn-success').addClass('btn-orange').removeClass('btn-success');
            //} else if (c && c == 'dodgerblue') {
            //    jQuery('.btn-success').addClass('btn-primary').removeClass('btn-success');
            //} else if (c && c == 'katniss') {
            //    jQuery('.btn-success').addClass('btn-primary').removeClass('btn-success');
            //}
        });
</script>

    <script>

    /* ======= Showing Customer feedback if session errors exists ====== */
    <% if (Session["errors"] != null)
       {
           foreach (string errorMsg in (Array)Session["errors"])
           {
    %>
               ShowMessage('<%= errorMsg %>', "Error", "Toastr");
    <%     } // end of foreach
           Session["errors"] = null;
       }
    %>
                
    </script>

    <script type="text/javascript">
        $(function () {

            // Toastr Plugin Setup
            toastr.options = {
                "closeButton": true,
                "debug": false,
                "newestOnTop": false,
                "progressBar": true,
                "positionClass": "toast-top-right",
                "preventDuplicates": false,
                "onclick": null,
                "showDuration": "300",
                "hideDuration": "1000",
                "timeOut": "4000",
                "extendedTimeOut": "1000",
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
            }

            // Lobibox Plugin Setup
            Lobibox.base.DEFAULTS = $.extend({}, Lobibox.base.DEFAULTS, {
                iconSource: 'fontAwesome'
            });
            Lobibox.notify.DEFAULTS = $.extend({}, Lobibox.notify.DEFAULTS, {
                iconSource: 'fontAwesome'
            });

        });
    </script>
</body>
</html>
