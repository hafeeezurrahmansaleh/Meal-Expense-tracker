<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyMeal.aspx.cs" Inherits="LabProject.DailyMeal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="CSS/AdminPortal.css" rel="stylesheet" />
    <link type="text/css" rel="Stylesheet" href="http://ajax.microsoft.com/ajax/jquery.ui/1.8.6/themes/smoothness/jquery-ui.css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js" >
</script>
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery.ui/1.8.6/jquery-ui.min.js" >
</script>
    <title>Daily Meal Tracker</title>
    <script type="text/javascript">
        $(function () {
            $(".datepicker").datepicker({ dateFormat: "dd-mm-yy" }).val()
        });
</script>
    <script type="text/javascript" src="Scripts/DatePicker.js"></script>
    
    <style type="text/css">
        .button1
        {
            font-family: Georgia;
            font-size: 18px;
            color: White;
            padding: 4px 45px;
            margin: 0 20px;
            margin-top:2px;
            text-decoration: none;
            border: solid 1px #720000;
            background-color: #c72a2a;
            background: -moz-linear-gradient(top, #c72a2a 0%, #9e0e0e 100%);
            background: -webkit-linear-gradient(top, #c72a2a 0%, #9e0e0e 100%);
            background: -o-linear-gradient(top, #c72a2a 0%, #9e0e0e 100%);
            background: -ms-linear-gradient(top, #c72a2a 0% ,#9e0e0e 100%);
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#9e0e0e', endColorstr='#9e0e0e',GradientType=0 );
            background: linear-gradient(top, #c72a2a 0% ,#9e0e0e 100%);
            -webkit-box-shadow: 0px 0px 1px #FF3300, inset 0px 0px 1px #FFFFFF;
            -moz-box-shadow: 0px 0px 1px #FF3300, inset 0px 0px 1px #FFFFFF;
            box-shadow: 0px 0px 1px #FF3300, inset 0px 0px 1px #FFFFFF;
            -webkit-border-radius: 50px;
            -moz-border-radius: 50px;
            border-radius: 50px;
        }
        .container {
            width: 500px;
            margin-left: auto;
            margin-right: auto;
        }
        .auto-style38 {
            
            margin-left: auto;
            margin-right: auto;
        }
        .button{
            background:#333399;
            font-weight:bold;
            color:White;
        }
    </style>
</head>
<body>
        <div class="nav">
    <ul>
  <li><a class="active" href="LogIn.aspx">LogOut</a></li>
  <li><a href="DailyExpenses.aspx">DailyExpens</a></li>
  <li><a href="DailyMeal.aspx">Home</a></li>
  <li><a href="MonthlyReport.aspx">Monthly Report</a></li>
    <li class="header">DAILY MEAL TRACKER</li>
    <li></li>
</ul>
    </div>
    <form id="form1" runat="server">
    <div class="auto-style38" >
        <br />
        <br />        
        <asp:Panel ID="Panel1" HorizontalAlign="Center" Text-align="center" runat="server" >
        <p>View meal details of previeous months: <asp:TextBox ID="txtMonth" runat="server" class="date-picker" Text="12-2018"> </asp:TextBox> 
            <script type="text/javascript">
                var currentDate = new Date()
                document.getElementById('txtMonth').title = (currentDate.getMonth() + 1 + "-" + currentDate.getFullYear());
            </script>
                <asp:Button ID="btnViewMealDetails" runat="server" Text="View Report" OnClick="btnViewMealDetails_Click"  ></asp:Button>
            </p></asp:Panel>
        <asp:GridView ID="gvDailyMeal" runat="server" ShowFooter="True" 
            HorizontalAlign="Center" 
            RowDataBound="gvDailyMeal_RowDataBound" 
            OnDataBound="gvDailyMeal_DataBound" 
            BackColor="#DEBA84" BorderColor="#DEBA84" 
            BorderStyle="None" BorderWidth="1px"
             CellPadding="3" CellSpacing="2" 
            OnRowDataBound="gvDailyMeal_RowDataBound" 
            OnRowCancelingEdit="gvDailyMeal_RowCancelingEdit" 
            OnRowEditing="gvDailyMeal_RowEditing" 
            OnRowUpdating="gvDailyMeal_RowUpdating" 
            EnableViewState="False" 
            AllowSorting="True" OnSorting="gvDailyMeal_Sorting" 
            ShowHeaderWhenEmpty="True">

            <FooterStyle HorizontalAlign="Center" BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle HorizontalAlign="Center" BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle HorizontalAlign="Center" BackColor="#FFF7E7" ForeColor="#8C4510"></RowStyle>
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
            <Columns>
                <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:ImageButton ImageUrl="~/Image/edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px"/>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton ImageUrl="~/Image/save.png" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px"/>
                            <asp:ImageButton ImageUrl="~/Image/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px"/>
                        </EditItemTemplate>
                    </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:Panel ID="Panel2" HorizontalAlign="Center" Text-align="center" runat="server" >
        <asp:Button ID="Calculate" runat="server" Text="Calculate" Width="175px" CssClass="button1" OnClick="Calculate_Click" />
        </asp:Panel>
    </div>
    <div>
    </div>
    </form>
</body>
</html>
