<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPortal.aspx.cs" Inherits="LabProject.Admin_Portal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="CSS/AdminPortal.css" rel="stylesheet" />
    <title>Admin Portal</title>
    <script src="Scripts/DatePicke.js"></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.1/themes/base/jquery-ui.css" />


<style>
.ui-datepicker-calendar {
display: none;
} 
    .inputBox {
    display: block;
    margin: 0;
    padding: 0 1em 0;
    background-color: #f3fafd;
    border: solid 2px #217093;
    border-radius: 4px;
    -webkit-appearance: none;
    box-sizing: border-box;
    width: 200px;
    height: 28px;
    font-size: 1.00em;
    color: #353538;
    font-weight: 600;
    font-family: inherit;
    transition: box-shadow .2s linear, border-color .25s ease-out; }
    .inputBox:focus {
      outline: none;
      box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
      border: solid 2px #4eb8dd; }    
        .auto-style38 {
            width: 959px;
        }
        
        .auto-style39 {
            margin-left: 136px;
            margin-top: 0px;
        }
        
        .auto-style40 {
            height: 44px;
        }
        .auto-style41 {
            height: 35px;
        }
        
    .auto-style42 {
        width: 135px;
    }
    .auto-style43 {
        width: 282px;
    }
        
    </style>
</head>
<body>
    <div class="nav">
    <ul>
  <li><a class="active" href="LogIn.aspx">LogOut</a></li>
  <li><a href="MonthlyReport.aspx">Monthly Overview</a></li>
  <li><a href="DailyMeal.aspx?id=1">Daily Meal</a></li>
  <li><a href="DailyExpenses.aspx">DailyExpens</a></li>
  <li><a href="AdminPortal.aspx">Home</a></li>
    <li class="header">ADMIN PORTAL</li>
    <li></li>
</ul>
    </div>
    <form id="form1" runat="server">
    <div class="auto-style24">
        <table>
            <tr>
                <td class="auto-style38">
                    <asp:Button ID="btnAdd"  runat="server" OnClick="btnAdd_Click"  Text="Add New Member" CausesValidation="false" BackColor="#5A547D" Opacity="0.4" BorderColor="#9FA0B6" BorderStyle="Groove" ForeColor="White" CssClass="auto-style40" style="margin-left: 54px" />
                </td>
                <td class="auto-style43">
                    <asp:Label runat="server" ID="lblDisplayDate" Font-Size="11pt" ForeColor="#5A547D"></asp:Label>
                </td>            
            </tr>
        </table>                                              
            <asp:GridView ID="gvMembersInfo" runat="server" AutoGenerateColumns="true" Width="782px" Font-Size="13pt"  
                AllowPaging="true" PageSize="10" 
                CssClass="Grid"                     
                AlternatingRowStyle-CssClass="alt"
                PagerStyle-CssClass="pgr"
                OnPageIndexChanging="gvEmployee_PageIndexChanging" > 
                <RowStyle HorizontalAlign="Center"></RowStyle>
                <PagerStyle HorizontalAlign="Center"></PagerStyle>
                <AlternatingRowStyle CssClass="alt" />
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkView" runat="server" CommandArgument='<%# Eval("MemberUserName") %>' OnClick="lnk_OnClick" CausesValidation="False" OnClientClick="lnk_OnClick"> Details </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True" />
                <PagerStyle CssClass="pgr" />
        </asp:GridView>
        <br />
        <div class ="Panel1">
        <asp:Panel ID="Panel1" runat="server" CssClass="table1" Visible="False" >
            <div style="margin-left: auto; margin-right: auto; text-align: center;" class="auto-style41">
               <asp:Label ID="Label8" CssClas="header1" runat="server" Text="PERSONAL DETAILS" ></asp:Label>
                    </div>
            <br /> <br />
           <div >
             <table  >
                <tr>
                    <td class="auto-style35">
                     <asp:Label ID="Name" runat="server" Text="Name:"></asp:Label>
                    </td>
                    <td >
                     <asp:TextBox ID="txtName" runat="server" CssClass="inputBox" ReadOnly="True"></asp:TextBox>
                    </td>
                        <td class="auto-style29" ><asp:RequiredFieldValidator 
                            ID="rfvName" 
                            runat="server" 
                            ControlToValidate="txtName"
                            ErrorMessage="Name can't be left blank" 
                            SetFocusOnError="True">*
                        </asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style44">
                     <asp:Label ID="Label4" runat="server" Text="UserName:"></asp:Label>
                    </td>
                    <td>
                     <asp:TextBox ID="txtUserName" runat="server" ReadOnly="True" CssClass="inputBox"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator 
                            ID="rfvUserName" 
                            runat="server" 
                            ControlToValidate="txtUserName"
                            ErrorMessage="UserName can't be left blank" 
                            SetFocusOnError="True">*
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                 <tr>
                    <td class="auto-style36">
                     <asp:Label ID="Label1" runat="server" Text="Mobile:"></asp:Label>
                    </td>
                    <td class="auto-style19">
                     <asp:TextBox ID="txtMobile" runat="server" ReadOnly="True" CssClass="inputBox"></asp:TextBox>
                    </td>
                     <td class="auto-style26">
                         <asp:RequiredFieldValidator 
                            ID="rfvMobile" 
                            runat="server" 
                            ControlToValidate="txtMobile"
                            ErrorMessage="Mobile can't be left blank" 
                            SetFocusOnError="True">*
                        </asp:RequiredFieldValidator>
                     </td>
                     <td class="auto-style42">
                     <asp:Label ID="Label2" runat="server" Text="Guardian Mobile:"></asp:Label>
                    </td>
                    <td class="auto-style17">
                     <asp:TextBox ID="txtGuardianMobile" runat="server" ReadOnly="True" CssClass="inputBox"></asp:TextBox>
                    </td>
                     <td class="auto-style17">
                         <asp:RequiredFieldValidator 
                            ID="rfvGuardianMobile" 
                            runat="server" 
                            ControlToValidate="txtGuardianMobile"
                            ErrorMessage="GuardianMobile can't be left blank" 
                            SetFocusOnError="True">*
                        </asp:RequiredFieldValidator>
                     </td>
                </tr>
                 <tr>
                    <td class="auto-style35">
                     <asp:Label ID="Label5" runat="server" Text="Email:"></asp:Label>
                    </td>
                    <td class="auto-style32">
                     <asp:TextBox ID="txtEmail" runat="server" ReadOnly="True" CssClass="inputBox"></asp:TextBox>
                    </td>
                     <td class="auto-style29">
                          <asp:RequiredFieldValidator 
                            ID="rfvEmail" 
                            runat="server" 
                            ControlToValidate="txtEmail"
                            ErrorMessage="Email can't be left blank" 
                            SetFocusOnError="True">*
                        </asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="You must enter valid Email Id" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"  SetFocusOnError="True">*</asp:RegularExpressionValidator>
                     </td>
                     <td class="auto-style44">
                     <asp:Label ID="Label6" runat="server" Text="NID No:"></asp:Label>
                    </td>
                    <td>
                     <asp:TextBox ID="txtNID" runat="server" ReadOnly="True" CssClass="inputBox"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td class="auto-style37">
                     <asp:Label ID="Label7" runat="server" Text="Address"></asp:Label>
                    </td>
                     <td class="auto-style33">
                        <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" ReadOnly="True" CssClass="inputBox"></asp:TextBox>

                     </td>
                         <td class="auto-style29">
                          <asp:RequiredFieldValidator 
                            ID="rfvAddress" 
                            runat="server" 
                            ControlToValidate="txtAddress"
                            ErrorMessage="Address can't be left blank" 
                            SetFocusOnError="True">*
                        </asp:RequiredFieldValidator>
                     </td>
                     <td class="auto-style45">
                     <asp:Label ID="Label3" runat="server" Text="Advance Deposit:"></asp:Label>
                    </td>
                    <td class="auto-style3">
                     <asp:TextBox ID="txtAdvanceDeposit" runat="server" Text="0" ReadOnly="True" TextMode="Number" CssClass="inputBox"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style37">
                     <asp:Label ID="Label14" runat="server" Text="Passwaord(Member):"></asp:Label>
                    </td>
                     <td class="auto-style33">
                        <asp:TextBox ID="txtMemberPassword" runat="server"  ReadOnly="True" CssClass="inputBox" ></asp:TextBox>

                     </td>
                     <td class="auto-style27">
                         <asp:RequiredFieldValidator 
                            ID="rfvMemberPassword" 
                            runat="server" 
                            ControlToValidate="txtMemberPassword"
                            ErrorMessage="Member Password can't be left blank" 
                            SetFocusOnError="True">*
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revMemberPassword" runat="server" ControlToValidate="txtMemberPassword" ErrorMessage="Minimum Password length = 6 characters" ForeColor="Red" ValidationExpression="^[\s\S]{5,15}$"  SetFocusOnError="True">*</asp:RegularExpressionValidator>                     </td>
                     <td class="auto-style45">
                     <asp:Label ID="Label15" runat="server" Text="Admin UserName:"></asp:Label>
                    </td>
                    <td >
                     <asp:TextBox ID="txtAdminUserName" runat="server"  ReadOnly="True" CssClass="inputBox" ></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator 
                            ID="rfvAdminUserName" 
                            runat="server" 
                            ControlToValidate="txtAdminUserName"
                            ErrorMessage="Admin UserName can't be left blank" 
                            SetFocusOnError="True">*
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style36"><asp:Label ID="lblMsg" runat="server"></asp:Label>
                    </td>
                    <td class="auto-style33">
                    </td>
                    <td>
                     <asp:Label ID="SuccessMessaage" runat="server" Font-Italic="True" Font-Size="10pt" ForeColor="#009900"></asp:Label>
                    </td>
                </tr>
            </table>
               <asp:ValidationSummary ID="ValidationSummary1" 
                        runat="server" ShowMessageBox="True" 
                        ShowSummary="False" Height="16px" Width="211px" BackColor="White" ForeColor="#990000" HeaderText="Fill All The FIeld Properly"/>
               <asp:Panel ID="panel2" runat="server" style="margin-left: auto; margin-right: auto; text-align: center;" class="auto-style41">
                   <asp:Button ID="btnUpdatePersonalInfo" runat="server" CssClass="btnUpdate" Font-Bold="False" Font-Size="9pt" Height="39px" OnClick="btnUpdatePersonalInfo_Click" Text="UPDATE" Width="87px"  />
                   <asp:Button ID="btnDeleteMember0" runat="server" CausesValidation="false" CssClass="btnDelete" Font-Size="9pt" Height="39px" onclick="btnDeleteMember_Click" Text="DELETE" Width="91px" />
                   <asp:Button ID="BackToHome0" runat="server" BackColor="#363670" CausesValidation="False" CssClass="auto-style23" Font-Size="9pt" ForeColor="White" Height="39px" OnClick="BackToHome_Click" Text="Back" Width="74px" />
                   <asp:Button ID="ClearInfo0" runat="server" BackColor="#363670" CausesValidation="False" CssClass="auto-style46" Font-Size="9pt" ForeColor="White" Height="39px" OnClick="ClearInfo_Click" Text="Clear " Width="72px" />
               </asp:Panel><br />
            <table class="auto-style39">
                <tr>
                    <td class="auto-style30">
                     <asp:Label ID="Label11" runat="server" Text="Month:"></asp:Label>
                    </td>
                    <td class="auto-style9">
                     <asp:TextBox ID="txtMonth" runat="server"  Text="Select Month" CssClass="inputBox" ></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator4" 
                            runat="server" 
                            ControlToValidate="txtMonth"
                            ErrorMessage="Month can't be left blank" 
                            SetFocusOnError="True">*
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style13">
                     <asp:Label ID="Label9" runat="server" Text="House Rent:"></asp:Label>
                    </td>
                    <td class="auto-style14">
                     <asp:TextBox ID="txtHouseRent" runat="server" Text="0" TextMode="Number" CssClass="inputBox"></asp:TextBox>
                    </td>
                    <td class="auto-style17">
                        <asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator1" 
                            runat="server" 
                            ControlToValidate="txtHouseRent"
                            ErrorMessage="House Rent can't be left blank" 
                            SetFocusOnError="True">*
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style30">
                     <asp:Label ID="Label10" runat="server" Text="Utilities:"></asp:Label>
                    </td>
                    <td class="auto-style9">
                     <asp:TextBox ID="txtUtilities" runat="server" Text="0" TextMode="Number" CssClass="inputBox"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator2" 
                            runat="server" 
                            ControlToValidate="txtUtilities"
                            ErrorMessage="Utilities can't be left blank" 
                            SetFocusOnError="True">*
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style30">
                     <asp:Label ID="Label12" runat="server" Text="Total Paid:"></asp:Label>
                    </td>
                    <td class="auto-style9">
                     <asp:TextBox ID="txtTotalPaid" runat="server" Text="0" TextMode="Number" CssClass="inputBox"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator3" 
                            runat="server" 
                            ControlToValidate="txtTotalPaid"
                            ErrorMessage="Total Paid can't be left blank" 
                            SetFocusOnError="True">*
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style30">
                     <asp:Label ID="Label13" runat="server" Text="Add More Deposit:"></asp:Label>
                    </td>
                    <td class="auto-style9">
                     <asp:TextBox ID="txtAddMoreDiposite" runat="server" Text="0" TextMode="Number" CssClass="inputBox"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style30"></td>
                    <td class="auto-style9">
                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="btnSave" Width="90px" CausesValidation="False" style="margin-left: 5px; margin-right: 0px;"></asp:Button>
                        <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" Width="90px" CssClass="btnSave" CausesValidation="False" style="margin-left: 3px"></asp:Button>
                    </td>
                </tr>
            </table>
            <br />
               </div>
            <script src="http://code.jquery.com/jquery-1.8.2.js"></script>
<script src="http://code.jquery.com/ui/1.9.1/jquery-ui.js"></script>
            <script type="text/javascript">
$(function () {
    $('#txtMonth').datepicker(
                       { 
                           dateFormat: "mm-yy",
                           changeMonth: true,
                           changeYear: true,
                           showButtonPanel: true,
                           onClose: function (dateText, inst) {
                               function isDonePressed() {
                                   return ($('#ui-datepicker-div').html().indexOf('ui-datepicker-close ui-state-default ui-priority-primary ui-corner-all ui-state-hover') > -1);
                               }

                               if (isDonePressed()) {
                                   var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
                                   var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
                                   $(this).datepicker('setDate', new Date(year, month, 1)).trigger('change');
                                   $('.date-picker').focusout()//Added to remove focus from datepicker input box on selecting date
                               }
                           },
                           beforeShow: function (input, inst) {

                               inst.dpDiv.addClass('month_year_datepicker')

                               if ((datestr = $(this).val()).length > 0) {
                                   year = datestr.substring(datestr.length - 4, datestr.length);
                                   month = datestr.substring(0, 2);
                                   $(this).datepicker('option', 'defaultDate', new Date(year, month - 1, 1));
                                   $(this).datepicker('setDate', new Date(year, month - 1, 1));
                                   $(".ui-datepicker-calendar").hide();
                               }
                           }

                       })
    });

</script>
            <script>

            </script>
        </asp:Panel>
        </div>
    </div>
    </form>
</body>
</html>
