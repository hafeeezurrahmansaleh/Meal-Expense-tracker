<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MonthlyReport.aspx.cs" Inherits="LabProject.MonthlyReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MonthlyReport</title>
    <script src="Scripts/classie.js"></script>
    <link href="CSS/component.css" rel="stylesheet" />
    <script src="Scripts/DatePicke.js"></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.1/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.2.js"></script>
<script src="http://code.jquery.com/ui/1.9.1/jquery-ui.js"></script>
<script type="text/javascript" src="Scripts/DatePicker.js"></script> 
<style>
.ui-datepicker-calendar {
display: none;
}
</style>
    <link href="CSS/AdminPortal.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style38 {
            background-color: #fff;
            margin-left: 2px;
            border: solid 1px #525252;
            border-collapse: collapse;
            font-family: Calibri;
            color: #474747;
            margin-right: 0;
            margin-top: 5px;
            margin-bottom: 10px;
        }
    </style>
</head>
    <body>
<div class="nav">
    <ul>
  <li><a class="active" href="LogIn.aspx">LogOut</a></li>
  <li><a href="DailyMeal.aspx?id=1">Daily Meal</a></li>
  <li><a href="DailyExpenses.aspx">DailyExpens</a></li>
    <li class="header">Monthly Overview</li>
    <li></li>
</ul>
    </div>
    <form id="form1" runat="server">
    <div class="auto-style24">
        <section id="btn-click"> 
        <p>Select Month: <input name="startDate" id="startDate" class="date-picker" runat="server"/>
					<!-- <button class="btn btn-4 btn-4c icon-arrow-right">View report</button>  -->           
            <asp:Button ID="btnViewReport" runat="server" Text="View Report" OnClick="btnViewReport_Click"  ></asp:Button>      
         </p> </section> 
         <asp:GridView ID="gvMonthlyExpense" runat="server" Width="782px" Font-Size="13pt"  >
         <RowStyle HorizontalAlign="Center"></RowStyle>
         <PagerStyle HorizontalAlign="Center"></PagerStyle>
         </asp:GridView>
    </div>
    <div class="auto-style24">
        
            <asp:GridView ID="gvMembersInfo" runat="server" Width="782px" Font-Size="13pt"  
                AllowPaging="True" 
                CssClass="auto-style38"                     
                AlternatingRowStyle-CssClass="alt"
                PagerStyle-CssClass="pgr"
                OnPageIndexChanging="gvEmployee_PageIndexChanging" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" > 
                <AlternatingRowStyle CssClass="alt" />
                <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True" BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle CssClass="pgr" BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
                <RowStyle HorizontalAlign="Center"></RowStyle>
                <PagerStyle HorizontalAlign="Center"></PagerStyle>
        </asp:GridView>
        <br />
    </div>
        
    </form>
</body>
</html>
