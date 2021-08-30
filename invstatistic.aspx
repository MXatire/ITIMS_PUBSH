<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="invstatistic.aspx.cs" Inherits="AdminItims.invstatistic" %>
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
    



    <script src="js/dashboard/themes/dark/assets/js/vendor.min.js"></script>
    <script src="js/dashboard/themes/dark/assets/libs/jquery-knob/jquery.knob.min.js"></script>
    <script src="js/dashboard/themes/dark/assets/libs/morris-js/morris.min.js"></script>
    <script src="js/dashboard/themes/dark/assets/libs/raphael/raphael.min.js"></script>
    <script src="js/dashboard/themes/dark/assets/js/app.min.js"></script>
    <script src="js/dashboard/themes/dark/assets/js/pages/dashboard.init.js"></script>
    <style>
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
            padding: 12px 20px;
            box-sizing: border-box;
            border: 3px solid #ccc;
            -webkit-transition: 0.5s;
            transition: 0.5s;
            outline: none;
        }

            .drp:focus {
                border: 3px solid #555;
            }
              .hide {
            display: none;
        }
              .morris-hover {
  position:absolute;
  z-index:1000;
}

.morris-hover.morris-default-style {     border-radius:10px;
  padding:6px;
  color:#666;
  background:rgba(255, 255, 255, 0.8);
  border:solid 2px rgba(230, 230, 230, 0.8);
  font-family:sans-serif;
  font-size:12px;
  text-align:center;
}

.morris-hover.morris-default-style .morris-hover-row-label {
  font-weight:bold;
  margin:0.25em 0;
}

.morris-hover.morris-default-style .morris-hover-point {
  white-space:nowrap;
  margin:0.1em 0;
}

svg { width: 100%; }
    </style>
   
</head>
<body id="page-top">
    <form id="form1" runat="server">
        <div id="wrapper">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
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
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                        aria-expanded="true" aria-controls="collapseTwo">
                        <i class="fas fa-fw fa-cog"></i>
                        <span>İnventar</span>
                    </a>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <h6 class="collapse-header">İnventar:</h6>
                            <asp:Button ID="invSearch" runat="server" CssClass="btnMenyu" OnClick="invSearch_Click" Text="Axtarış" />
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
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
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
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
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
                    <button runat="server" class="rounded-circle border-0" id="sidebarToggle" title="Geri"  onclick="JavaScript:window.history.back(1);return false;" ></button>
                </div>
            </ul>
            <!-- End of Sidebar -->
                </ContentTemplate>
            </asp:UpdatePanel>
             

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">
                <div id="content">
                         <!-- Topbar -->
                            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                                <!-- Sidebar Toggle (Topbar) -->
                                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                                    <i class="fa fa-bars"></i>
                                </button>
                                <!-- Topbar Navbar -->
                                <ul class="navbar-nav ml-auto">

                                    <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                                    <li class="nav-item dropdown no-arrow d-sm-none">
                                        <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-search fa-fw"></i>
                                        </a>
                                        <!-- Dropdown - Messages -->
                                        <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                            aria-labelledby="searchDropdown">
                                            <form class="form-inline mr-auto w-100 navbar-search">
                                                <div class="input-group">
                                                    <input type="text" class="form-control bg-light border-0 small"
                                                        placeholder="Search for..." aria-label="Search"
                                                        aria-describedby="basic-addon2">
                                                    <div class="input-group-append">
                                                        <button class="btn btn-primary" type="button">
                                                            <i class="fas fa-search fa-sm"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </li>

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
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                                <!-- Page Heading -->
                    <div style="margin-left: 30px;" class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">
                            <asp:Label ID="lblName" runat="server"></asp:Label></h1>
                        <asp:LinkButton ID="LinkButton1" OnClick="LinkButton1_Click" runat="server" Style="margin-right: 30px;" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                    class="fas fa-download fa-sm text-white-50"></i>Hesabat Yarat</asp:LinkButton>
                    </div>
                        </ContentTemplate>
                           <Triggers>
                              <asp:PostBackTrigger ControlID="LinkButton1" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <!-- Main -->
                     <div runat="server" class="container-fluid">
                            <!-- InvStatistc -->
                                <div id="inv_Stactisc" runat="server">
                                    <div id="chart" runat="server">
                                        <table style="width: 100%; border-collapse: separate; border-spacing: 0 15px;">
                                            <tr>
                                                <td class="td">
                                                    <asp:CheckBox ID="chxModel" runat="server" class="chc" Text="Marka" AutoPostBack="True" OnCheckedChanged="chxModel_CheckedChanged" />
                                                </td>
                                                <td class="td">
                                                    <asp:CheckBox ID="chxManf" runat="server" class="chc" Text="İstehsalçı" AutoPostBack="True" OnCheckedChanged="chxManf_CheckedChanged" />
                                                </td>
                                                <td class="td">
                                                    <asp:CheckBox ID="chxOs" runat="server" class="chc" Text="ƏS Növü" AutoPostBack="True" OnCheckedChanged="chxOs_CheckedChanged" />
                                                </td>
                                                  <td class="td">
                                                    <asp:CheckBox ID="chxOsAd" runat="server" class="chc" Text="ƏS Adı" AutoPostBack="True" OnCheckedChanged="chxOsAd_CheckedChanged" />
                                                </td>
                                                <td class="td">
                                                    <asp:CheckBox ID="chxSizeHdd" runat="server" class="chc" Text="Yaddaş Həcmi" AutoPostBack="True" OnCheckedChanged="chxSizeHdd_CheckedChanged" />
                                                </td>
                                                <td class="td">
                                                    <asp:CheckBox ID="chxIntf" runat="server" class="chc" Text="Yaddaş Növü" AutoPostBack="True" OnCheckedChanged="chxIntf_CheckedChanged" />
                                                </td>
                                                <td class="td">
                                                    <asp:CheckBox ID="chxMdlHdd" runat="server" class="chc" Text="Yaddaş Markası" AutoPostBack="True" OnCheckedChanged="chxMdlHdd_CheckedChanged" />
                                                </td>
                                                <td class="td">
                                                    <asp:CheckBox ID="chxRamSpeed" runat="server" class="chc" Text="Ram Sürət" AutoPostBack="True" OnCheckedChanged="chxRamSpeed_CheckedChanged" />
                                                </td>

                                            </tr>
                                            <tr>
                                                <td class="td">
                                                    <asp:CheckBox ID="chxRamDDr" runat="server" class="chc" Text="Ram Tipi" AutoPostBack="True" OnCheckedChanged="chxRamDDr_CheckedChanged" />
                                                </td>
                                                <td class="td">
                                                    <asp:CheckBox ID="chxRam" runat="server" class="chc" Text="Ram Həcmi" AutoPostBack="True" OnCheckedChanged="chxRam_CheckedChanged" />
                                                </td>
                                                <td class="td">
                                                    <asp:CheckBox ID="chcRamManf" runat="server" class="chc" Text="Ram İstehsalçı" AutoPostBack="True" OnCheckedChanged="chcRamManf_CheckedChanged" />
                                                </td>
                                                <td class="td">
                                                    <asp:CheckBox ID="chxBV" runat="server" class="chc" Text="Bios" AutoPostBack="True" OnCheckedChanged="chxBV_CheckedChanged" />
                                                </td>
                                                <td class="td">
                                                    <asp:CheckBox ID="chxCpu" runat="server" class="chc" Text="CPU-İstehsalçı" AutoPostBack="True" OnCheckedChanged="chxCpu_CheckedChanged" />
                                                </td>
                                                <td class="td">
                                                    <asp:CheckBox ID="chcCpu" runat="server" class="chc" Text="CPU-Adı" AutoPostBack="True" OnCheckedChanged="chcCpu_CheckedChanged" />
                                                </td>
                                                <td class="td">
                                                    <asp:CheckBox ID="chxNet" runat="server" class="chc" Text="Şəbəkə" AutoPostBack="True" OnCheckedChanged="chxNet_CheckedChanged" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="7"><hr /></td>
                                                
                                            </tr>
                                        </table>
                                         <asp:Label ID="lblInfo" Style="font-size: x-large;" runat="server"></asp:Label>
                                        <div id="chartI" runat="server" visible="false">
               <div class="row">
                        <div class="col-xl-6">
                            <div class="card-box">
                              
                                <h4 class="header-title mt-0">Qrafik təsvir</h4>
                                <div class="widget-chart text-center">
                                    <div id="morris-donut-example" style="height: 245px;" class="morris-chart" dir="ltr"></div>
                                </div>
                            </div>
                        </div><!-- end col -->
                   <div class="col-xl-6">
                          <asp:GridView ID="grdSum" OnRowCommand="grdSum_RowCommand" Style="margin-left: 20px; color: black;" runat="server" AllowPaging="True" AutoGenerateColumns="false" OnPageIndexChanging="grdSum_PageIndexChanging" PageSize="10">
                                                        <HeaderStyle
                                                            BackColor="#e2e4e4"
                                                            Font-Italic="false"
                                                            Font-Size="Larger" />
                                                        <RowStyle HorizontalAlign="Center" />
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="SAY">
                                                                <ItemTemplate>
                                                                    <asp:Label runat="server" Text='<%# Eval("say") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="AD">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton runat="server" ID="lbtng" OnClick="lbtng_Click" Text='<%# Eval("ad") %>' data-myData='<%# Eval("ad") %>'></asp:LinkButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView></div>
              </div>
               <div class="row">
                   <div class="col-xl-12">
                            <div class="card-box">
                                <h4 class="header-title mt-0">Statistika</h4>
                                <div id="morris-bar-example" style="height: 280px;" class="morris-chart" dir="ltr"></div>
                            </div>
                        </div><!-- end col -->
      </div>
                     <div class="row">
                         <div class="col-xl-12">
                         <hr />
                     </div>
               </div>
                                        </div>
                                        <div class="hide"><%-- todo A.Sebine--%>
                                              <table id="tblChart" runat="server" visible="false">
                                            <tr>
                                                <td>
                                                    <asp:Chart ID="Chart2" runat="server" class="divChart">
                                                        <Series>
                                                            <asp:Series Name="Series1">
                                                            </asp:Series>
                                                        </Series>
                                                        <Legends>
                                                            <asp:Legend Docking="Bottom" IsTextAutoFit="False" Name="Defaultt" LegendStyle="Column" />
                                                        </Legends>
                                                        <ChartAreas>
                                                            <asp:ChartArea Name="ChartArea1">
                                                                <Area3DStyle Enable3D="False" />
                                                            </asp:ChartArea>
                                                        </ChartAreas>
                                                    </asp:Chart>
                                                </td>
                                                <td>
                                                    <asp:Chart ID="Chart1" runat="server">
                                                        <Series>
                                                            <asp:Series Name="Series1" ChartType="Doughnut" YValuesPerPoint="2"></asp:Series>
                                                        </Series>
                                                        <ChartAreas>
                                                            <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                                        </ChartAreas>
                                                    </asp:Chart>
                                                </td>
                                                <td>
                                                   
                                                </td>
                                            </tr>
                                        </table>
                                        </div>
                                      
                                        <asp:GridView ID="grdResulSum" Style="color: black; margin-top: 5px;" runat="server" Visible="false">
                                            <HeaderStyle
                                                BackColor="#e2e4e4"
                                                Font-Italic="false"
                                                Font-Size="Larger" />
                                            <RowStyle HorizontalAlign="Center" />
                                        </asp:GridView>
                                    </div>
                                </div>
                         </div>
                     <!-- End of Main Content -->
                     </ContentTemplate>
                    </asp:UpdatePanel>
                <!-- Footer -->
                <footer class="sticky-footer bg-white">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Khatira Hasanli &copy; itims.rabita.az 2020</span>
                        </div>
                    </div>
                </footer>
                <!-- End of Footer -->
                    </div>
            </div>
        </div>
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
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin-2.min.js"></script>

        <!-- Page level plugins -->
        <script src="vendor/chart.js/Chart.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="js/demo/chart-area-demo.js"></script>
        <script src="js/demo/chart-pie-demo.js"></script>
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
</body>
</html>
