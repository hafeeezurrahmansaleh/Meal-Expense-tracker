<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberPortal.aspx.cs" Inherits="LabProject.MemberPortal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Member Portal</title>
    <link href="CSS/AdminPortal.css" rel="stylesheet" />
    <style>
        
        body {
	        background: #88b6be ;
	        font-family: "Lato" ;
        }
        .wrap {
            width: 250px;
            height: auto;
            margin: auto;
            margin-top: 5%;
        }
        .auto-style1 {
            width: 458px;
            margin-left: 144px;
        }
        .auto-style2 {
            width: 13px;
        }
        .auto-style3 {
            width: 25px;
        }
        .auto-style4 {
            width: 44px;
        }
        .auto-style6 {
            width: 28px;
        }
        .auto-style7 {
            width: 31px;
        }
        .auto-style8 {
            width: 33px;
        }
        .auto-style38 {
            -webkit-border-radius: 8px;
            -moz-border-radius: 8px;
            width: 816px;
            height: auto;
            margin-top: 5%;
            margin-left: auto;
            margin-right: auto;
            margin-bottom: auto;
        }
        .auto-style39 {
            width: 26px;
        }
        .auto-style40 {
            height: 32px;
            width: 26px;
        }
    </style>
</head>
<body>
    <div class="nav">
    <ul>
  <li><a class="active" href="LogIn.aspx">LogOut</a></li>
  <li><a href="DailyMeal.aspx?id=2">Daily Meal</a></li>
        <li><a href="MonthlyReport.aspx?id=2">Monthly Overview</a></li>
  <li><a href="MemberPortal.aspx">Home</a></li>
    <li class="header">MEMBER PORTAL</li>
    <li></li>
</ul>
    </div>
    <form id="form1" runat="server">
    <div class="auto-style38">
        <asp:Panel ID="Panel1" runat="server" Width="857px">
            <asp:Button ID="btnSignOut" runat="server" CausesValidation="False" BackColor="#333399" BorderStyle="None" Font-Bold="True" Font-Italic="True" OnClick="btnSignOut_Click" Text="Sign Out" Width="157px" Font-Size="13pt" ForeColor="White" CssClass="auto-style31" Height="38px" style="margin-left: 474px" />
            <div>
                <asp:GridView ID="gvMaruf" runat="server" AutoGenerateColumns="true" ></asp:GridView>
            </div>
            <table>
                <tr>
                    <td class="auto-style6">
                     <asp:Label ID="Name" runat="server" Text="Name:"></asp:Label>
                    </td>
                    <td class="auto-style39">
                     <asp:TextBox ID="txtName" runat="server" CssClass="auto-style2" Width="209px" ReadOnly="True"></asp:TextBox>
                    </td>
                    <td class="auto-style4"></td>
                    <td>
                     <asp:Label ID="Label4" runat="server" Text="UserName:"></asp:Label>
                    </td>
                    <td class="auto-style8">
                      <asp:TextBox ID="txtUserName" runat="server" Width="198px" ReadOnly="True"></asp:TextBox>
                   </td>
                </tr>
                 <tr>
                    <td class="auto-style16">
                     <asp:Label ID="Label1" runat="server" Text="Mobile:"></asp:Label>
                    </td>
                    <td class="auto-style40">
                     <asp:TextBox ID="txtMobile" runat="server" Width="209px" ReadOnly="True"></asp:TextBox>
                    </td>
                     <td class="auto-style4"></td>
                     <td class="auto-style17">
                     <asp:Label ID="Label2" runat="server" Text="Guardian Mobile:"></asp:Label>
                    </td>
                    <td class="auto-style8">
                     <asp:TextBox ID="txtGuardianMobile" runat="server" Width="199px" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td class="auto-style6">
                     <asp:Label ID="Label5" runat="server" Text="Email:"></asp:Label>
                    </td>
                    <td class="auto-style39">
                     <asp:TextBox ID="txtEmail" runat="server" Width="208px" ReadOnly="True"></asp:TextBox>
                    </td>
                     <td class="auto-style4"></td>
                     <td>
                     <asp:Label ID="Label6" runat="server" Text="NID No:"></asp:Label>
                    </td>
                    <td class="auto-style8">
                     <asp:TextBox ID="txtNID" runat="server" Width="199px" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td class="auto-style7">
                     <asp:Label ID="Label7" runat="server" Text="Address"></asp:Label>
                    </td>
                     <td class="auto-style39">
                        <asp:TextBox ID="txtAddress" runat="server" Width="208px" TextMode="MultiLine" ReadOnly="True"></asp:TextBox>
                         <td class="auto-style4"></td>
                     </td>
                     <td class="auto-style3">
                     <asp:Label ID="Label3" runat="server" Text="Advance Deposit:"></asp:Label>
                    </td>
                    <td class="auto-style8">
                     <asp:TextBox ID="txtAdvanceDeposit" runat="server" Width="199px" Text="0" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                     <asp:Label ID="Label14" runat="server" Text="Passwaor:"></asp:Label>
                    </td>
                     <td class="auto-style39">
                        <asp:TextBox ID="txtMemberPassword" runat="server" Width="208px" ReadOnly="True"></asp:TextBox>
                     </td>
                     <td class="auto-style4">
                         <asp:RequiredFieldValidator 
                            ID="rfvMemberPassword" 
                            runat="server" 
                            ControlToValidate="txtMemberPassword"
                            ErrorMessage="Member Password can't be left blank" 
                            SetFocusOnError="True">*
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revMemberPassword" runat="server" ControlToValidate="txtMemberPassword" ErrorMessage="Minimum Password length = 6 characters" ForeColor="Red" ValidationExpression="^[\s\S]{5,15}$"  SetFocusOnError="True">*</asp:RegularExpressionValidator>                     </td>
                     <td class="auto-style3">
                     <asp:Label ID="Label15" runat="server" Text="Admin UserName:"></asp:Label>
                    </td>
                    <td class="auto-style8">
                     <asp:TextBox ID="txtAdminUserName" runat="server" Width="199px" ReadOnly="True"></asp:TextBox>
                    </td>                 
                </tr>
                <tr>
                    <td>
                        &nbsp;</td><td class="auto-style18" colspan="2">
                    <asp:Button ID="btnUpdatePersonalInfo" runat="server" CssClass="auto-style21" Font-Bold="False" Font-Size="9pt" Height="36px" OnClick="btnUpdatePersonalInfo_Click" Text="Change Password" Width="139px" style="margin-left: 34px" />
                    </td>   
                    <td>
                     <asp:Label ID="SuccessMessaage" runat="server" Font-Italic="True" Font-Size="10pt" ForeColor="#009900"></asp:Label>
                    </td>
                </tr>
                <tr><td class="auto-style17"><asp:Label ID="lblMsg" runat="server">
           </asp:Label>
       </td>
   <td class="auto-style39"><asp:ValidationSummary ID="ValidationSummary1" 
            runat="server" ShowMessageBox="True" 
            ShowSummary="False" Height="118px" Width="211px" BackColor="White" ForeColor="#990000" HeaderText="Fill All The FIeld Properly"/>
       <table class="auto-style1">
           <tr>
               <td class="auto-style13">
                   <asp:Label ID="Label9" runat="server" Text="House Rent:"></asp:Label>
               </td>
               <td class="auto-style14">
                   <asp:TextBox ID="txtHouseRent" runat="server" Text="0" Width="235px"></asp:TextBox>
               </td>
           </tr>
           <tr>
               <td class="auto-style30">
                   <asp:Label ID="Label10" runat="server" Text="Utilities:"></asp:Label>
               </td>
               <td class="auto-style9">
                   <asp:TextBox ID="txtUtilities" runat="server" Text="0" Width="236px"></asp:TextBox>
               </td>
           </tr>
           <tr>
               <td class="auto-style30">
                   <asp:Label ID="Label12" runat="server" Text="Total Paid:"></asp:Label>
               </td>
               <td class="auto-style9">
                   <asp:TextBox ID="txtTotalPaid" runat="server" Text="0" Width="236px"></asp:TextBox>
               </td>
           </tr>
           <tr>
               <td class="auto-style30">
                   <asp:Label ID="Label13" runat="server" Text="Add More Deposit:"></asp:Label>
               </td>
               <td class="auto-style9">
                   <asp:TextBox ID="txtAddMoreDiposite" runat="server" Text="0" Width="236px"></asp:TextBox>
               </td>
           </tr>
           <tr>
               <td class="auto-style30"></td>
           </tr>
       </table>
   </td></tr>
            </table>
            <br />
            <br />
        </asp:Panel>
    </div>
    </form>
</body>
</html>



