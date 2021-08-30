<%@ Page Language="C#"  AutoEventWireup="true" EnableEventValidation="false" EnableViewState="true" CodeBehind="test.aspx.cs" Inherits="AdminItims.test" %>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
             $("#<%=TextBox1.ClientID %>").datepicker({ dateFormat: 'dd-mm-yy' });
             $("#<%=TextBox2.ClientID %>").datepicker({ dateFormat: 'dd-mm-yy' });
             $("#<%=TextBox3.ClientID %>").timepicker({showInputs: true});
         });
     </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="TextBox1" autocomplete="off" runat="server"></asp:TextBox>
             <asp:TextBox ID="TextBox2" autocomplete="off" runat="server"></asp:TextBox>
             <asp:TextBox ID="TextBox3" autocomplete="off" runat="server"></asp:TextBox>
        </div>
         <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin-2.min.js"></script>
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
