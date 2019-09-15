<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DailyExpenses.aspx.cs" Inherits="LabProject.DailyExpenses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <link href="CSS/AdminPortal.css" rel="stylesheet" />
    <link type="text/css" rel="Stylesheet" href="http://ajax.microsoft.com/ajax/jquery.ui/1.8.6/themes/smoothness/jquery-ui.css" />
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js" >
</script>
<script type="text/javascript" src="http://ajax.microsoft.com/ajax/jquery.ui/1.8.6/jquery-ui.min.js" >
</script>
    <script type="text/javascript" src="Scripts/DatePicker.js"></script>

    <title>Daily Expenses</title>
    <script type="text/javascript">
    $(function () {
        $(".date").datepicker({ dateFormat: 'dd-mm-yy' });
    });
</script>
 
</head>
<body>
    <div class="nav1">
    <ul>
  <li><a class="active" href="LogIn.aspx">LogOut</a></li>
  <li><a href="DailyMeal.aspx">Daily Meal</a></li>
  <li><a href="MemberPortal.aspx">Member Portal</a></li>
  <li><a href="DailyMeal.aspx">Home</a></li>
    <li class="header">DAILY EXPENSES</li>
    <li></li>
</ul>
    </div>
    <form id="form1" runat="server">
        <div class="auto-style24">

            <asp:GridView ID="gvDailyExpenses" runat="server" AutoGenerateColumns="False" ShowFooter="True" DataKeyNames="ExpenseID"
                ShowHeaderWhenEmpty="True"

                OnRowCommand="gvDailyExpenses_RowCommand" OnRowEditing="gvDailyExpenses_RowEditing" OnRowCancelingEdit="gvDailyExpenses_RowCancelingEdit"
                OnRowUpdating="gvDailyExpenses_RowUpdating" OnRowDeleting="gvDailyExpenses_RowDeleting" CellPadding="4" ForeColor="#333333" GridLines="None">
                <%-- Theme Properties --%>
                <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle ForeColor="#333333" BackColor="#FFFBD6" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                <SortedDescendingHeaderStyle BackColor="#820000" />
                <RowStyle HorizontalAlign="Center"></RowStyle>
                <PagerStyle HorizontalAlign="Center"></PagerStyle>
                
                <AlternatingRowStyle BackColor="White" />
                
                <Columns>
                    <asp:TemplateField HeaderText="Date">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Date") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDate" CssClass="date" Text='<%# Eval("Date") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtDateFooter" CssClass="date" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Member Name">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("MemberUserName") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtMemberUserName" Text='<%# Eval("MemberUserName") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="txtMemberUserNameFooter" runat="server"></asp:DropDownList>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Description">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Description") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDescription" Text='<%# Eval("Description") %>' runat="server" TextMode="MultiLine" Width="170px" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtDescriptionFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Expenditure">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("Expenditure") %>' runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtExpenditure" Text='<%# Eval("Expenditure") %>' runat="server" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtExpenditureFooter" runat="server" />
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ImageUrl="~/Image/edit.png" runat="server" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px"/>
                            <asp:ImageButton ImageUrl="~/Image/delete.png" runat="server" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px"/>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:ImageButton ImageUrl="~/Image/save.png" runat="server" CommandName="Update" ToolTip="Update" Width="20px" Height="20px"/>
                            <asp:ImageButton ImageUrl="~/Image/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px"/>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:ImageButton ImageUrl="~/Image/addnew.png" CssClass="addbtn" ForeColor="White" runat="server" CommandName="AddNew" ToolTip="Add New" Width="20px" Height="20px"/>
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <asp:Label ID="lblSuccessMessage" Text="" runat="server" ForeColor="Green" />
            <br />
            <asp:Label ID="lblErrorMessage" Text="" runat="server" ForeColor="Red" />
            <asp:Panel ID="Panel2" HorizontalAlign="Center" Text-align="center" runat="server" >
            <p>View expense details of previeous months: <input name="Month" id="txtMonth" value="Select Month" class="date-picker" runat="server" />
                <asp:Button ID="btnViewExpenseDetails" runat="server" Text="View Report" OnClick="btnViewExpenseDetails_Click"  ></asp:Button>
            </p>
                </asp:Panel>
        </div>
        <div>
        </div>
    </form>
</body>
</html>

