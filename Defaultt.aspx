<%@ Page EnableEventValidation="false" Language="C#" AutoEventWireup="true" EnableViewState="true" CodeBehind="Defaultt.aspx.cs" Inherits="AdminItims.Defaultt" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>İTİMS</title>
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


    <style>lblCountAlarm
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
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" style="background-color: #2951c3;" runat="server">
                <ContentTemplate>
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

                        <!-- Nav Item - Monitorinq -->
                        <%--  <li class="nav-item active">
                            <button id="ShowMonitoring" runat="server" style="background-color: #456ad8; border: #4469d7;" class="nav-link" onserverclick="ShowMonitoring_ServerClick">
                                <i class="fas fa-fw fa-tachometer-alt"></i>
                                <span>Monitorinq</span></button>
                        </li>--%>
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
                                    <%-- <asp:Button ID="btnİnsidentAdd" runat="server" CssClass="btnMenyu" OnClick="btnİnsidentAdd_Click" Text="Əlavə et" />--%>
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
                </ContentTemplate>
            </asp:UpdatePanel>
            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">
                    <!-- Start Content-->

                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
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
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <!-- Main -->
                    <div runat="server" class="container-fluid">
                        <!-- A.Sebine -->

                        <!-- radio buttin ve drp -->
                        <div class="row">
                            <!--bazani secmek ucun radio button -->
                            <div class="col-xl-4 col-md-6 mb-4">
                                <div class="card border-left-secondary shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">

                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                    Baza seç
                                                </div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">
                                                    <asp:RadioButtonList ID="rdobtnBaza" runat="server" AutoPostBack="true" OnSelectedIndexChanged="rdobtnBaza_SelectedIndexChanged" RepeatDirection="Horizontal" RepeatLayout="Flow" Width="111px">
                                                        <asp:ListItem style="margin-right: 7px;" Selected="True">Cpu</asp:ListItem>
                                                        <asp:ListItem>Hdd</asp:ListItem>
                                                        <asp:ListItem style="margin-right: 7px;">Ram</asp:ListItem>
                                                        <asp:ListItem>Net</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-database fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- hosta gore axtaris -->
                            <div class="col-xl-4 col-md-6 mb-4">
                                <div class="card border-left-primary shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                    İstifadəçi Adı
                                                </div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">
                                                    <asp:DropDownList data-live-search="true" CssClass="drp form-control selectpicker" ID="drpHostList" AutoPostBack="True" OnSelectedIndexChanged="drpHostList_SelectedIndexChanged" runat="server"></asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i style="margin-top: 20px;" class="fas fa-address-card fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- ipye gore axtaris-->
                            <div class="col-xl-4 col-md-6 mb-4">
                                <div class="card border-left-success shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                    İP Ünvan
                                                </div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">
                                                    <asp:DropDownList data-live-search="true" CssClass="drp form-control selectpicker" ID="drpİpList" AutoPostBack="True" OnSelectedIndexChanged="drpİpList_SelectedIndexChanged" runat="server"></asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-auto">
                                                <i style="margin-top: 20px;" class="fas fa-atlas fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <!-- alarm user-->
                            <asp:Button runat="server" ID="btnUserAlarm" OnClick="btnUserAlarm_Click" class="hide" />
                            <asp:Button runat="server" ID="btnUserWarning" OnClick="btnUserWarning_Click" class="hide" />
                            <div class="col-xl-4 col-md-6 mb-4">
                                <div class="card border-left-danger shadow h-100 py-2" onclick="GetAlarmUsers();" style="cursor: pointer;">

                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col-xl-6">
                                                <h4 class="header-title mt-0 mb-4">Həyəcan</h4>
                                                <div class="widget-chart-box-1 float-left" dir="ltr">

                                                    <input data-plugin="knob" data-width="80" data-height="80" data-fgcolor="#f05050"
                                                        data-bgcolor="#F9B9B9" runat="server" id="lblCountAlarm"
                                                        data-skin="tron" data-angleoffset="180" data-readonly="true"
                                                        data-thickness=".15" />
                                                </div>
                                            </div>

                                            <div class="col-xl-6">
                                                <div class="widget-chart-1">

                                                    <div class="widget-detail-1 text-right">
                                                        <h2 class="font-weight-normal pt-2 mb-1">
                                                            <asp:Label runat="server" ID="lblCountAllUser"></asp:Label>
                                                        </h2>
                                                        <p class="text-muted mb-1">Online istifadəçi</p>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>



                                    </div>
                                </div>
                            </div>

                            <!-- warning user-->
                            <div class="col-xl-4 col-md-6 mb-4">
                                <div class="card border-left-warning shadow h-100 py-2" onclick="GetWarningUsers();" style="cursor: pointer;">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col-xl-8">
                                                <h4 class="header-title mt-0 mb-4">Xəbərdarlıq</h4>
                                                <div class="widget-chart-box-1 float-left" dir="ltr">
                                                    <input data-plugin="knob" data-width="80" data-height="80" data-fgcolor="#ffbd4a"
                                                        data-bgcolor="#FFE6BA" runat="server" id="lblCountWarning"
                                                        data-skin="tron" data-angleoffset="180" data-readonly="true"
                                                        data-thickness=".15" />
                                                </div>
                                            </div>

                                            <div class="col-xl-4">
                                                <div class="widget-chart-1">

                                                    <div class="widget-detail-1 text-right">
                                                        <h2 class="font-weight-normal pt-2 mb-1">
                                                            <asp:Label runat="server" ID="lblCountAllUserW"></asp:Label>
                                                        </h2>
                                                        <p class="text-muted mb-1">Online istifadəçi</p>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>



                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="gridarea" id="divAlarmWarning" runat="server" style="width: 100%;" visible="false">
                            <div
                                class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">
                                    <asp:Label runat="server" ID="lblHeaderAW"></asp:Label></h6>
                            </div>
                            <div class="card-body">
                                <asp:GridView ID="grdAlarmWarning" Style="color: black;" runat="server" AllowPaging="true" PageSize="15" OnPageIndexChanging="grdAlarmWarning_PageIndexChanging">
                                    <HeaderStyle
                                        BackColor="#e2e4e4"
                                        Font-Italic="false" />
                                    <Columns>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
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

                        <!------------------>

                        <div class="row">
                            <!-- grid-->
                            <asp:UpdatePanel ID="uppanlMonitorig" runat="server">
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                                    <asp:PostBackTrigger ControlID="grdUsageCpu" />
                                    <asp:PostBackTrigger ControlID="grdUsageRam" />
                                    <asp:PostBackTrigger ControlID="grdUsageHdd" />
                                    <asp:PostBackTrigger ControlID="grdUsageNet" />
                                </Triggers>
                                <ContentTemplate>
                                    <div class="gridarea" id="divMessg" visible="false" runat="server" style="width: 100%;">
                                        <asp:Label ID="lblMes" runat="server" Text="Label"></asp:Label>
                                    </div>
                                    <div class="hide">
                                        <%--todo A.Sebine--%>
                                        <div class="gridarea" id="divChart" visible="false" runat="server" style="width: 100%;">
                                            <div>
                                                <asp:Label ID="lblXChart" runat="server" Text="Label"></asp:Label>
                                                <%--  <div style="float: right; color: black; font-size: larger; font-family: 'Font Awesome 5 Free'; margin-right:5px;">
                                            <asp:Label ID="lblInfoChartIp" runat="server" Text="Label"></asp:Label>
                                            <asp:Label ID="lblInfoChartHost" runat="server" Text="Label"></asp:Label>
                                            <asp:Label ID="lblSpeed" runat="server" Text="Label"></asp:Label>
                                        </div>--%>
                                            </div>
                                            <asp:Chart ID="chrtCpu" runat="server">
                                                <Series>
                                                    <asp:Series Name="Utilization" ChartType="Line"></asp:Series>
                                                </Series>
                                                <ChartAreas>
                                                    <asp:ChartArea Name="chrtCpuArea"></asp:ChartArea>
                                                </ChartAreas>
                                            </asp:Chart>

                                        </div>
                                        <div class="gridarea" id="divChartRam" visible="false" runat="server" style="width: 100%;">
                                            <div>
                                                <asp:Label ID="lblUsageRam" runat="server" Text="Label"></asp:Label>
                                            </div>
                                            <asp:Chart ID="chrtRam" runat="server">
                                                <Series>
                                                    <asp:Series Name="Used" ChartType="Line"></asp:Series>
                                                </Series>
                                                <ChartAreas>
                                                    <asp:ChartArea Name="chrtRamArea"></asp:ChartArea>
                                                </ChartAreas>
                                            </asp:Chart>
                                        </div>
                                        <div class="gridarea" id="divChartHdd" visible="false" runat="server" style="width: 100%;">
                                            <div>
                                                <asp:Label ID="lblHddUsed" runat="server" Text="Label"></asp:Label>
                                            </div>
                                            <asp:Chart ID="chrtHdd" runat="server">
                                                <Series>
                                                    <asp:Series Name="Usage" ChartType="Line"></asp:Series>
                                                </Series>
                                                <ChartAreas>
                                                    <asp:ChartArea Name="chrtHddArea"></asp:ChartArea>
                                                </ChartAreas>
                                            </asp:Chart>
                                        </div>
                                        <div class="gridarea" id="divChartNet" visible="false" runat="server" style="width: 100%;">
                                            <div>
                                                <%--   <asp:Label ID="lblNetRecived" runat="server" Text="Label"></asp:Label>--%>
                                            </div>
                                            <asp:Chart ID="chrtNet" runat="server">
                                                <Series>
                                                    <asp:Series Name="BytesReceived" ChartType="Line"></asp:Series>
                                                </Series>
                                                <ChartAreas>
                                                    <asp:ChartArea Name="chrtNetArea"></asp:ChartArea>
                                                </ChartAreas>
                                            </asp:Chart>
                                        </div>
                                    </div>
                                    <div class="gridarea" id="divcpu" runat="server" style="width: 100%;">
                                        <div
                                            class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                            <h6 class="m-0 font-weight-bold text-primary">Cpu</h6>
                                        </div>
                                        <div class="card-body">
                                            <asp:GridView ID="grdUsageCpu" Style="color: black;" runat="server" OnPageIndexChanging="grdUsageCpu_PageIndexChanging" AllowPaging="true" PageSize="15">
                                                <HeaderStyle
                                                    BackColor="#e2e4e4"
                                                    Font-Italic="false" />
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imgBtn" ImageUrl="~/img/diagram.png" OnClick="imgBtn_Click" OnClientClick="DrawCharts();" runat="server" ToolTip="Qrafik" Width="25px" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                    <div class="gridarea" id="divRam" runat="server" style="width: 100%;">
                                        <div
                                            class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                            <h6 class="m-0 font-weight-bold text-primary">Ram</h6>
                                        </div>
                                        <div class="card-body">
                                            <asp:GridView ID="grdUsageRam" Style="color: black;" runat="server" AllowPaging="true" PageSize="15" OnPageIndexChanging="grdUsageRam_PageIndexChanging">
                                                <HeaderStyle
                                                    BackColor="#e2e4e4"
                                                    Font-Italic="false" />
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imgBtnRam" ImageUrl="~/img/diagram.png" OnClick="imgBtnRam_Click" OnClientClick="DrawCharts();" runat="server" ToolTip="Qrafik" Width="25px" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                    <div class="gridarea" id="divHdd" runat="server" style="width: 100%;">
                                        <div
                                            class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                            <h6 class="m-0 font-weight-bold text-primary">Hdd</h6>
                                        </div>
                                        <div class="card-body">
                                            <asp:GridView ID="grdUsageHdd" Style="color: black;" runat="server" AllowPaging="true" PageSize="15" OnPageIndexChanging="grdUsageHdd_PageIndexChanging">
                                                <HeaderStyle
                                                    BackColor="#e2e4e4"
                                                    Font-Italic="false" />
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imgBtnHdd" ImageUrl="~/img/diagram.png" OnClick="imgBtnHdd_Click" OnClientClick="DrawCharts()" runat="server" ToolTip="Qrafik" Width="25px" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                    <div class="gridarea" id="divNet" runat="server" style="width: 100%;">
                                        <div
                                            class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                            <h6 class="m-0 font-weight-bold text-primary">Net</h6>
                                        </div>
                                        <div class="card-body">
                                            <asp:GridView ID="grdUsageNet" Style="color: black;" runat="server" AllowPaging="true" PageSize="15" OnPageIndexChanging="grdUsageNet_PageIndexChanging">
                                                <HeaderStyle
                                                    BackColor="#e2e4e4"
                                                    Font-Italic="false" />
                                                <Columns>
                                                    <asp:TemplateField>
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="imgBtnNet" ImageUrl="~/img/diagram.png" OnClick="imgBtnNet_Click" OnClientClick="DrawCharts()" runat="server" ToolTip="Qrafik" Width="25px" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <asp:Timer ID="Timer1" runat="server" Interval="60000" OnTick="Timer1_Tick"></asp:Timer>
                        <asp:Timer ID="Timer2" runat="server" Interval="1800000" OnTick="Timer2_Tick"></asp:Timer>
                    </div>

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
    <script type="text/javascript">
        function StopTimer() {
            var b = $find('<%= Timer1.ClientID %>');
            if (b) {
                b._stopTimer(); //stop the timer
                //b._startTimer();//start the timer
            }
        }

    </script>


    <script>
        function GetAlarmUsers() { $('#<%= btnUserAlarm.ClientID %>').click(); }
        function GetWarningUsers() { $('#<%= btnUserWarning.ClientID %>').click(); }

    </script>

    <script src="js/dashboard/themes/dark/assets/js/vendor.min.js"></script>
    <script src="js/dashboard/themes/dark/assets/libs/jquery-knob/jquery.knob.min.js"></script>
    <script src="js/dashboard/themes/dark/assets/libs/morris-js/morris.min.js"></script>
    <script src="js/dashboard/themes/dark/assets/libs/raphael/raphael.min.js"></script>
    <script src="js/dashboard/themes/dark/assets/js/app.min.js"></script>

</body>
</html>
