<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="riskadd.aspx.cs" Inherits="AdminItims.riskadd" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>İTİMS</title>
    <link rel="icon" href="img/itimsLogo.png" type="image/x-icon" />
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />
    <link href="css/font_css.css" rel="stylesheet" />
    <link href="css/sb-admin-2.min.css" rel="stylesheet" />
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
                            <%--<asp:Button ID="btnİnsidentAdd" runat="server" CssClass="btnMenyu" OnClick="btnİnsidentAdd_Click" Text="Əlavə et" />--%>
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

                    <!-- Page Heading -->
                    <div style="margin-left: 30px;" class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">
                            <asp:Label ID="lblName" runat="server"></asp:Label></h1>
                        <asp:LinkButton ID="LinkButton1" OnClick="LinkButton1_Click" runat="server" Style="margin-right: 30px;" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                    class="fas fa-download fa-sm text-white-50"></i>Hesabat Yarat</asp:LinkButton>
                    </div>

                    <!-- Main -->
                    <div runat="server" class="container-fluid">
                        <!-- Risk -->
                        <div id="riskGoster" runat="server">
                            <asp:Label ID="lblMesg" runat="server" Text="Label"></asp:Label>
                            <div id="addnew" runat="server">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="TextBox1" placeholder="ID" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox2" placeholder="Tədbir" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox3" placeholder="Qabiliyyət" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox4" placeholder="Əlaqədar Risk" runat="server"></asp:TextBox></td>

                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="TextBox5" placeholder="Təsir Şiddəti" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox6" placeholder="Tətbiq Prioriteti" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Əlavə et" /></td>
                                    </tr>
                                </table>
                            </div>
                            <div id="updatediv" runat="server">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="TextBox14" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox15" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" Text="Yenilə" /></td>
                                    </tr>
                                </table>
                            </div>
                            <asp:ImageButton ID="imgBtnAdd" ImageUrl="~/img/plus.png" OnClick="imgBtnAdd_Click" runat="server" ToolTip="Əlavə et" style="width: 20px; position: absolute;  margin-top: 15px;  margin-left: 4px;" />
                            <asp:GridView ID="grdgRisk" Style="color: black;" runat="server">
                                <HeaderStyle
                                    BackColor="#e2e4e4"
                                    Font-Italic="false" />
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imgBtn" ImageUrl="~/img/delete.png" OnClick="imgBtn_Click" runat="server" ToolTip="Sil" Width="25px" />
                                            <asp:ImageButton ID="imgBtnUp" ImageUrl="~/img/upd.png" OnClick="imgBtnUp_Click" runat="server" ToolTip="Yenilə" Width="25px" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>

                </div>
                <!-- End of Main Content -->

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
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

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
