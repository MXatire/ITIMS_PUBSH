<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" EnableViewState="true"  CodeBehind="montrng_reprt.aspx.cs" Inherits="AdminItims.montrng_reprt" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>İTİMS</title>
    <script src="js/dashboard/themes/dark/assets/js/vendor.min.js"></script>
    <script src="js/dashboard/themes/dark/assets/libs/jquery-knob/jquery.knob.min.js"></script>
    <script src="js/dashboard/themes/dark/assets/libs/morris-js/morris.min.js"></script>
    <script src="js/dashboard/themes/dark/assets/libs/raphael/raphael.min.js"></script>
    <script src="js/dashboard/themes/dark/assets/js/app.min.js"></script>

    <link rel="icon" href="img/itimsLogo.png" type="image/x-icon" />
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />
    <link href="css/font_css.css" rel="stylesheet" />
    <link href="css/sb-admin-2.min.css" rel="stylesheet" />
    <link href="js/dashboard/themes/dark/assets/libs/morris-js/morris.css" rel="stylesheet" />
    <link href="js/dashboard/themes/dark/assets/css/icons.min.css" rel="stylesheet" />

    <script src="js/dashboard/themes/dark/assets/js/pages/dashboard.init.js"></script>
    <script src="Scripts/jquery2.1.1.min.js"></script>
    <link href="Content/css/bootstrap-select1.10.0.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap-select1.10.0.min.js"></script>
     
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
  <link rel="stylesheet" href="/resources/demos/style.css"/>
     <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
     <script type="text/javascript">
         $(document).ready(function () {
             $("#<%=txtFromDate.ClientID %>").datepicker({ dateFormat: 'yy-mm-dd' });
             $("#<%=txtToDate.ClientID %>").datepicker({ dateFormat: 'yy-mm-dd' });
         });
     </script>  
    <style>
        .show {
            display: block !important;
        }

        .bootstrap-select.btn-group .dropdown-menu li {
            position: relative;
        }

            .bootstrap-select.btn-group .dropdown-menu li a {
                cursor: pointer;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none;
            }

        .dropdown-menu > .active > a, .dropdown-menu > .active > a:focus, .dropdown-menu > .active > a:hover {
            color: #fff;
            text-decoration: none;
            background-color: #337ab7;
            outline: 0;
        }

        .dropdown-menu > li > a {
            display: block;
            padding: 3px 20px;
            clear: both;
            font-weight: 400;
            line-height: 1.42857143;
            color: #333;
            white-space: nowrap;
        }

        .open > .dropdown-menu {
            display: block;
        }

        .textbox {
            padding: 12px 20px;
            margin: 8px 0;
            box-sizing: border-box;
            border: 3px solid #ccc;
            -webkit-transition: 0.5s;
            transition: 0.5s;
            outline: none;
        }

            .textbox:focus {
                border: 3px solid #555;
            }

        .btnMenyu {
            margin-left: 15px;
            border: none;
            background-color: white;
            padding: .5rem 1rem;
            margin: 0 .5rem;
            display: block;
            color: #3a3b45;
            text-decoration: none;
            border-radius: .35rem;
            white-space: nowrap;
        }

            .btnMenyu:focus {
                outline: 0;
            }

        button:focus {
            outline: 0;
        }

        .td {
            cursor: pointer;
            background-color: #ffffff;
            font-size: 17px;
        }

        .chc {
            cursor: pointer;
        }

        .td:hover {
            box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
        }

        .drp {
            width: 80%;
            border: ridge;
        }

            .drp:focus {
                border: 3px solid #555;
            }

        .gridarea {
            background-color: #fff;
            background-clip: border-box;
            border: 1px solid #e3e6f0;
            border-radius: .35rem;
            flex-direction: inherit;
            box-shadow: 0 .15rem 1.75rem 0 rgba(58,59,69,.15) !important;
            margin-bottom: 3px;
            margin-left: 12px;
        }

        .card-box, .card {
            background-color: #fff !important;
        }

        .h1, .h2, .h3, .h4, .h5, .h6, h1, h2, h3, h4, h5, h6 {
            color: #3b4452 !important;
        }


        label {
            color: #323a46 !important;
        }

        .hide {
            display: none;
        }

        .donut-legend > span {
            display: inline-block;
            margin-right: 25px;
            margin-bottom: 10px;
            font-size: 13px;
        }

            .donut-legend > span:last-child {
                margin-right: 0;
            }

            .donut-legend > span > i {
                display: inline-block;
                width: 15px;
                height: 15px;
                margin-right: 7px;
                margin-top: -3px;
                vertical-align: middle;
                border-radius: 1px;
            }

        #browsers_chart {
            max-height: 280px;
            margin-top: 20px;
            margin-bottom: 20px;
        }
    </style>

</head>
<body id="page-top">

    <form id="form1" runat="server">
        <div id="wrapper">
            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="#">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i style="transform: rotate(0deg);" class="fas fa-laptop"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">İTİMS</div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- monitor new-->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" onclick="StopTimer();return false;" data-toggle="collapse" data-target="#collapsePages1"
                        aria-expanded="true" aria-controls="collapsePages">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Monitorinq</span>
                    </a>
                    <div id="collapsePages1" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Monitorinq</h6>
                            <asp:Button ID="Button3" runat="server" CssClass="btnMenyu" OnClick="ShowMonitoring_ServerClick" Text="Monitorinq" />
                            <asp:Button ID="btnHesabat" runat="server" CssClass="btnMenyu" OnClick="btnHesabat_Click" Text="Hesabat" />
                        </div>
                    </div>
                </li>


                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    Aktivlərin İnventarizasiyası
           
                </div>

                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" onclick="StopTimer();return false;" data-toggle="collapse" data-target="#collapseTwo"
                        aria-expanded="true" aria-controls="collapseTwo">
                        <i class="fas fa-fw fa-cog"></i>
                        <span>İnventar</span>
                    </a>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">İnventar:</h6>
                            <asp:Button ID="invSearch" runat="server" CssClass="btnMenyu" OnClick="invSearch_ServerClick" Text="Axtarış" />
                            <asp:Button ID="invstatistc" runat="server" CssClass="btnMenyu" OnClick="invstatistc_Click" Text="Statistika" />
                        </div>
                    </div>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    Qeydiyyat
           
                </div>

                <!-- Nav Item - Pages Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" onclick="StopTimer();return false;" data-toggle="collapse" data-target="#collapsePages"
                        aria-expanded="true" aria-controls="collapsePages">
                        <i class="fas fa-fw fa-folder"></i>
                        <span>Risk Dəyərləndirilməsi</span>
                    </a>
                    <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">Risk Dəyərləndirilməsi</h6>
                            <asp:Button ID="btnShow_risk" runat="server" CssClass="btnMenyu" OnClick="btnShow_risk_Click" Text="Risklərin qeydiyyatı" />
                            <asp:Button ID="btnAdd_risk" runat="server" CssClass="btnMenyu" OnClick="btnAdd_risk_Click" Text="Tədbirlər planı" />
                        </div>
                    </div>
                </li>

                <!-- Nav Item - Tables -->
                <li class="nav-item">
                    <asp:LinkButton ID="btnSenedReg" OnClick="btnSenedReg_Click" class="nav-link" runat="server"> <i class="fas fa-fw fa-table"></i>
                        <span>İTİS Sənəd qeydiyyatı</span></asp:LinkButton>
                </li>
                <!-- Nav Item - Utilities Collapse Menu -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" onclick="StopTimer();return false;" data-toggle="collapse" data-target="#collapseUtilities"
                        aria-expanded="true" aria-controls="collapseUtilities">
                        <i class="fas fa-fw fa-wrench"></i>
                        <span>İnsidentlərin qeydiyyatı</span>
                    </a>
                    <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                        data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">İnsidentlərin qeydiyyatı:</h6>
                            <asp:Button ID="btnİnsident" runat="server" CssClass="btnMenyu" OnClick="btnİnsident_Click" Text="Göstər" />
                        </div>
                    </div>
                </li>
                <!-- Nav mailnotification -->
                <li class="nav-item">
                    <asp:LinkButton ID="btnEmailNotification" OnClick="btnEmailNotification_Click" class="nav-link" runat="server"> <i class="fas fa-fw fa-mail-bulk"></i>
                        <span>Bildiriş</span></asp:LinkButton>
                </li>
                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">

                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button runat="server" class="rounded-circle border-0" id="sidebarToggle" title="Geri" onclick="JavaScript:window.history.back(1);return false;"></button>
                </div>
            </ul>
            <!-- End of Sidebar -->
            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">
                    <!-- Start Content-->
                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                        <!-- Sidebar Toggle (Topbar) -->
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>

                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">



                            <div class="topbar-divider d-none d-sm-block"></div>

                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">Admin</span>
                                    <img class="img-profile rounded-circle"
                                        src="img/profile.png" />
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                    aria-labelledby="userDropdown">
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Çıxış
                                    </a>
                                </div>
                            </li>

                        </ul>

                    </nav>
                    <!-- End of Topbar -->

                    <!-- Page Heading -->
                    <div style="margin-left: 30px;" class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">
                            <asp:Label ID="lblName" runat="server"></asp:Label></h1>
                    </div>

                    <!-- Main -->
                    <table style="margin-left:10px;">
                        <tr>
                            <td>
                                <asp:DropDownList ID="drpKategoryIpHost" runat="server" style="border-style: ridge; height: 42px; padding-bottom: 5px; color: #988796; border-color: #9a9a9a;" AutoPostBack="true" OnSelectedIndexChanged="drpKategoryIpHost_SelectedIndexChanged">
                                    <asp:ListItem Text="Kateqoriya" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="İP" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Host" Value="2"></asp:ListItem>
                                </asp:DropDownList>         
                                <div style="width: 7%; border-style:ridge;  display: inline-block; "><%--background-color: #6b6d7d; height: 42px; padding-top: 2px;--%>
                                   <asp:DropDownList ID="drpbykategory" data-live-search="true" CssClass="drp form-control selectpicker" runat="server">                                 
                                  </asp:DropDownList> 
                               </div>
                                <asp:Label ID="Label1" runat="server" Text="Tarixdən"></asp:Label>
                                <asp:TextBox ID="txtFromDate" autocomplete="off" runat="server"></asp:TextBox>                                
                                <asp:Label ID="Label3" runat="server" Text="Tarixə qədər"></asp:Label>
                                <asp:TextBox ID="txtToDate" autocomplete="off" runat="server"></asp:TextBox>  
                                  <asp:DropDownList ID="drpFromSaat" runat="server">
                                    <asp:ListItem Text="Saatdan" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="00:00" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="01:00" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="02:00" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="03:00" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="04:00" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="05:00" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="06:00" Value="7"></asp:ListItem>
                                    <asp:ListItem Text="07:00" Value="8"></asp:ListItem>
                                    <asp:ListItem Text="08:00" Value="9"></asp:ListItem>
                                    <asp:ListItem Text="09:00" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="10:00" Value="11"></asp:ListItem>
                                    <asp:ListItem Text="11:00" Value="12"></asp:ListItem>
                                    <asp:ListItem Text="12:00" Value="13"></asp:ListItem>
                                    <asp:ListItem Text="13:00" Value="14"></asp:ListItem>
                                    <asp:ListItem Text="14:00" Value="15"></asp:ListItem>
                                    <asp:ListItem Text="15:00" Value="16"></asp:ListItem>
                                    <asp:ListItem Text="16:00" Value="17"></asp:ListItem>
                                    <asp:ListItem Text="17:00" Value="18"></asp:ListItem>
                                    <asp:ListItem Text="18:00" Value="19"></asp:ListItem>
                                    <asp:ListItem Text="19:00" Value="20"></asp:ListItem>
                                    <asp:ListItem Text="20:00" Value="21"></asp:ListItem>
                                    <asp:ListItem Text="21:00" Value="22"></asp:ListItem>
                                    <asp:ListItem Text="22:00" Value="23"></asp:ListItem>
                                    <asp:ListItem Text="23:00" Value="24"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:DropDownList ID="drpToSaat" runat="server">
                                    <asp:ListItem Text="Saata qədər" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="00:00" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="01:00" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="02:00" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="03:00" Value="4"></asp:ListItem>
                                    <asp:ListItem Text="04:00" Value="5"></asp:ListItem>
                                    <asp:ListItem Text="05:00" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="06:00" Value="7"></asp:ListItem>
                                    <asp:ListItem Text="07:00" Value="8"></asp:ListItem>
                                    <asp:ListItem Text="08:00" Value="9"></asp:ListItem>
                                    <asp:ListItem Text="09:00" Value="10"></asp:ListItem>
                                    <asp:ListItem Text="10:00" Value="11"></asp:ListItem>
                                    <asp:ListItem Text="11:00" Value="12"></asp:ListItem>
                                    <asp:ListItem Text="12:00" Value="13"></asp:ListItem>
                                    <asp:ListItem Text="13:00" Value="14"></asp:ListItem>
                                    <asp:ListItem Text="14:00" Value="15"></asp:ListItem>
                                    <asp:ListItem Text="15:00" Value="16"></asp:ListItem>
                                    <asp:ListItem Text="16:00" Value="17"></asp:ListItem>
                                    <asp:ListItem Text="17:00" Value="18"></asp:ListItem>
                                    <asp:ListItem Text="18:00" Value="19"></asp:ListItem>
                                    <asp:ListItem Text="19:00" Value="20"></asp:ListItem>
                                    <asp:ListItem Text="20:00" Value="21"></asp:ListItem>
                                    <asp:ListItem Text="21:00" Value="22"></asp:ListItem>
                                    <asp:ListItem Text="22:00" Value="23"></asp:ListItem>
                                    <asp:ListItem Text="23:00" Value="24"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:CheckBox ID="chcToday" runat="server" Text="Bu gün" AutoPostBack="true" OnCheckedChanged="chcToday_CheckedChanged" />
                                 <asp:DropDownList ID="drpPeriod" runat="server">
                                    <asp:ListItem Text="Dövr" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="Son 3 saat" Value="3"></asp:ListItem>
                                    <asp:ListItem Text="Son 6 saat" Value="6"></asp:ListItem>
                                    <asp:ListItem Text="Son 9 saat" Value="9"></asp:ListItem>
                                    <asp:ListItem Text="Son 12 saat" Value="12"></asp:ListItem>
                                    <asp:ListItem Text="Son 15 saat" Value="15"></asp:ListItem>
                                    <asp:ListItem Text="Son 18 saat" Value="18"></asp:ListItem>
                                    <asp:ListItem Text="Son 21 saat" Value="21"></asp:ListItem>
                                    <asp:ListItem Text="Son 24 saat" Value="24"></asp:ListItem>
                                </asp:DropDownList>
                                 <asp:Button ID="btnSearch" runat="server" Text="Axtar" OnClick="btnSearch_Click" />
                                  
                            </td>                          
                        </tr>  
                        <tr>
                            <td>
                                 <asp:Label ID="lblInfoChartHost" style="color:black" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                        <%--    <td>
                                 <div id="chartM" visible="false" runat="server">
                            <div class="row">
                                <div class="col-xl-12">
                                    <div class="card-box">
                                        <div class="dropdown float-right">
                                            <div style="float: right; color: black; font-size: larger; font-family: 'Font Awesome 5 Free'; margin-right: 5px;">
                                                <asp:Label ID="lblInfoChartIp" runat="server"></asp:Label>
                                                <asp:Label ID="lblInfoChartHost" runat="server"></asp:Label>
                                                <asp:Label ID="lblSpeed" runat="server"></asp:Label>
                                            </div>

                                        </div>
                                        <h4 class="header-title mt-0">Utilization(%) CPU</h4>
                                        <div id="morris-line-example" style="height: 280px;" class="morris-chart" dir="ltr"></div>
                                    </div>
                                </div>
                                <!-- end col -->
                            </div>
                            <div class="row">
                                <div class="col-xl-4">
                                    <div class="card-box">

                                        <h4 class="header-title mt-0">İstifadə olunmuş RAM (GB)</h4>
                                        <div id="morris-line-ram" style="height: 280px;" class="morris-chart" dir="ltr"></div>
                                    </div>
                                </div>
                                <!-- end col -->
                                <div class="col-xl-4">
                                    <div class="card-box">

                                        <h4 class="header-title mt-0">İstifadə olunmuş HDD (GB)</h4>
                                        <div id="morris-line-hdd" style="height: 280px;" class="morris-chart" dir="ltr"></div>
                                    </div>
                                </div>
                                <!-- end col -->
                                <div class="col-xl-4">
                                    <div class="card-box">
                                        <div class="dropdown float-right">
                                        </div>
                                        <h4 class="header-title mt-0">
                                            <asp:Label ID="lblNetRecived" runat="server"></asp:Label></h4>
                                        <div id="morris-line-net" style="height: 280px;" class="morris-chart" dir="ltr"></div>
                                        <div id="legend" class="donut-legend" align="center"></div>
                                    </div>
                                </div>
                                <!-- end col -->

                            </div>
                            <!-- end row -->
                        </div>
                            </td>--%>
                            
                            <td>                               
                               <asp:Chart ID="chrtCpu" Visible="true" runat="server">
                                    <Series>
                                        <asp:Series Name="Series1"></asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                                <br />
                                 <asp:Chart ID="chrtRam" Visible="true" runat="server">
                                    <Series>
                                        <asp:Series Name="Series1"></asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                                <br />
                                 <asp:Chart ID="chartHdd" Visible="true" runat="server">
                                    <Series>
                                        <asp:Series Name="Series1"></asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                                <br />
                                   <asp:Chart ID="chartNet" Visible="true" runat="server">
                                    <Series>
                                        <asp:Series Name="Series1"></asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                                <asp:Label ID="lblMess" runat="server" style="color:red; margin-top:5px;"></asp:Label>
                                <asp:GridView ID="grdResultCpu" Visible="false" style="color: black; margin-top: 5px;" runat="server"></asp:GridView>
                                <asp:GridView ID="grdResultHdd" Visible="false" style="color: black; margin-top: 5px;" runat="server"></asp:GridView>
                                <asp:GridView ID="grdResultRam" Visible="false" style="color: black; margin-top: 5px;" runat="server"></asp:GridView>
                                <asp:GridView ID="grdResultNet" Visible="false" style="color: black; margin-top: 5px;" runat="server"></asp:GridView>
                            </td>
                        </tr>
                    </table>
                    <!-- End of Main Content 1800000 -->
                </div>

            </div>

            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->
        <!-- Footer -->
        <footer class="sticky-footer bg-white">
            <div class="container my-auto">
                <div class="copyright text-center my-auto">
                    <span>Khatira Hasanli &copy; itims.rabita.az 2020</span>
                </div>
            </div>
        </footer>
        <!-- End of Footer -->
        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Çıxış etməyə əminsiniz?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Mövcud sesiyanı bitirməyə hazırsınızsa, aşağıdakı "Çıxış" ı seçin.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">İmtina</button>
                        <a class="btn btn-primary" href="Logiin.aspx">Çıxış</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap core JavaScript-->
        <%--        <script src="vendor/jquery/jquery.min.js"></script>--%>
        <%--           <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>--%>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin-2.min.js"></script>

        <!-- Page level plugins -->
        <%--          <script src="vendor/chart.js/Chart.min.js"></script>

        <!-- Page level custom scripts -->
       <script src="js/demo/chart-area-demo.js"></script>
        <script src="js/demo/chart-pie-demo.js"></script>--%>
    </form>
    <script type="text/javascript">
        function DeleteItem() {
            if (confirm("Bu sətiri silməyə əminsiniz?")) {
                return true;
            }
            return false;
        }
    </script>
    <script type="text/javascript" language="javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function EndRequestHandler(sender, args) {
            if (args.get_error() != undefined) {
                args.set_errorHandled(true);
            }
        }
    </script>
    <%-- <script type="text/javascript">
        function StopTimer() {
            var b = $find('<%= Timer1.ClientID %>');
            if (b) {
                b._stopTimer(); //stop the timer
                //b._startTimer();//start the timer
            }
        }

    </script>--%>

    

</body>
</html>
