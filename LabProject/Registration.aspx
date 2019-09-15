	
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="LabProject.Registration" %>

<!DOCTYPE html>

<html>

<head>
    <script type="text/javascript">
    function showAlert() {
        alert("Registration Successful!!");
    }
    function showAlert1() {
        alert("Error in Registration");
    }
        </script>
    <title>Registration </title>
    <link href="CSS/AdminPortal.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/style.css" media="screen" type="text/css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <style>
    	@font-face {
  font-family: 'Lato';
  font-style: normal;
  font-weight: 400;
  src: local('Lato Regular'), local('Lato-Regular'), url(http://themes.googleusercontent.com/static/fonts/lato/v7/qIIYRU-oROkIk8vfvxw6QvesZW2xOQ-xsNqO47m55DA.woff) format('woff');
}
        
        body {
	        background: #448ed3 ;
	        font-family: "Lato" ;
        }
        .form {
            width: 250px;
            height: auto;
            margin: auto;
            margin-top: 5%;
        }
        table{
            margin:auto;
            position:center;
        }
        .form label[id="Label1"]{
            text-align:right;
            text-decoration: center;
        }
       

        .auto-style1 {
            margin-left: 82px;
        }
               

        .auto-style4 {
            width: 189px;
        }
        .auto-style5 {
            width: 520px;
        }
        .auto-style7 {
            height: 34px;
            width: 300px;
        }
        .auto-style8 {
            margin-left: 0px;
            margin-top: 0px;
        }
        .auto-style9 {
            width: 234px;
        }
       

        .auto-style10 {
            margin-left: 149px;
        }
       

        .auto-style13 {
            width: 300px;
        }
        .auto-style14 {
            margin-left: 82px;
            width: 500px;
        }
        .auto-style15 {
            width: 655px;
            margin-right: 0px;
        }
       

        .auto-style16 {
            width: 399px;
        }
        .auto-style17 {
            height: 34px;
            width: 399px;
        }
       

        .auto-style18 {
            width: 376px;
            height: 822px;
            margin-top: 5%;
            margin-left: auto;
            margin-right: auto;
            margin-bottom: auto;
        } 
        .auto-style38 {
            width: 655px;
            margin-left: 0px;
            margin-right: 0px;
            margin-top: 0px;
        }
    </style>
    </head>
	<body>
        <form id="form1" runat="server">
<div class="auto-style18">
    <div style="margin-left: auto; margin-right: auto; text-align: center;">
    <asp:Label ID="Label2" runat="server" Text="Mess/Hostel Info" Height="50px" Width="442px" CssClass="auto-style8" Font-Bold="True" Font-Size="Larger" ForeColor="#FFFFCC"  ></asp:Label>
    </div>
    <div>
     <div class="form-group">

    </div>
    <table class="auto-style5">
        <tr>
            <td class="auto-style4">Name Your Hostel/Mess:</td>
            <td class="auto-style9"><asp:TextBox ID="txtHostelName" runat="server" CssClass="inputBox" Width="180px" Font-Size="12pt" Height="28px"></asp:TextBox>
            </td>
            <td class="auto-style1"><asp:RequiredFieldValidator ID="RequiredFieldValidator4" 
                runat="server" 
                 ControlToValidate="txtHostelName"
                ErrorMessage="Hostel Name can't be left blank" 
                SetFocusOnError="True">* </asp:RequiredFieldValidator>
            </td>
        </tr>
            <tr><td class="auto-style4">Address:</td>
    <td class="auto-style9"><asp:TextBox ID="txtAddress" runat="server" 
                     TextMode="MultiLine" CssClass="inputBox" Font-Size="12pt" Height="42px" Width="180px"></asp:TextBox>
    </td>
    <td class="auto-style1"><asp:RequiredFieldValidator ID="rfvAddress" 
             runat="server" 
             ControlToValidate="txtAddress"
             ErrorMessage="Address can't be left blank" 
             SetFocusOnError="True">* </asp:RequiredFieldValidator>
    </td></tr>

    </table>
        </div>
    <br />
    <div style="margin-left: auto; margin-right: auto; text-align: center;">
    <asp:Label ID="Label1" runat="server" Text="Admin Info" Height="50px" Width="405px"   Font-Bold="True" Font-Size="Larger"  ForeColor="#FFFFCC"  ></asp:Label>
	</div>
    <br />

    <table class="auto-style38">

     <tr>
     <td class="auto-style16">Admin Name:</td> 
     <td class="auto-style13"><asp:TextBox ID="txtAdminName" runat="server" CssClass="inputBox" Font-Size="12pt" Height="28px" Width="180px"></asp:TextBox>
     </td>
     <td class="auto-style14"><asp:RequiredFieldValidator ID="rfvAdminName" 
                runat="server" 
                 ControlToValidate="txtAdminName"
                ErrorMessage="First Name can't be left blank" 
                SetFocusOnError="True">* </asp:RequiredFieldValidator>
    </td>
    </tr>    
    <tr><td class="auto-style16">UserName:</td>
    <td class="auto-style13"><asp:TextBox ID="txtUserName" CssClass="inputBox" runat="server" Font-Size="12pt" Height="28px" Width="180px"></asp:TextBox>
    </td>
    <td class="auto-style14"><asp:RequiredFieldValidator 
             ID="rfvUserName" 
             runat="server" 
             ControlToValidate="txtUserName"
             ErrorMessage="UserName can't be left blank" 
             SetFocusOnError="True">* </asp:RequiredFieldValidator>
    </td></tr>
     
    <tr><td class="auto-style16">Password:</td>
    <td class="auto-style13"><asp:TextBox ID="txtPwd" runat="server" CssClass="inputBox"
                     TextMode="Password" Font-Size="12pt" Height="28px" Width="180px"></asp:TextBox>
    </td>
    <td class="auto-style14"><asp:RequiredFieldValidator ID="rfvPwd" 
             runat="server" ControlToValidate="txtPwd"
             ErrorMessage="Password can't be left blank" 
             SetFocusOnError="True">* </asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="rev1" runat="server" 
                        ControlToValidate="txtPwd"
                        ForeColor="Red"
                        ErrorMessage="Password must contain: Minimum 8 characters atleast 1 UpperCase Alphabet, 1 LowerCase Alphabet and 1 Number"
                        ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$" SetFocusOnError="True">* </asp:RegularExpressionValidator>
    </td></tr>
     
    <tr><td class="auto-style16">Confirm Password:</td>
    <td class="auto-style13"><asp:TextBox ID="txtRePwd" runat="server" CssClass="inputBox"
                     TextMode="Password" Font-Size="12pt" Height="28px" Width="180px"></asp:TextBox>
    </td>
    <td class="auto-style14"><asp:CompareValidator ID="CompareValidator1" 
             runat="server" 
             ControlToCompare="txtRePwd" 
             ControlToValidate="txtPwd" 
             Operator="Equal" 
             ErrorMessage="Password and confirm password do not match" >
              </asp:CompareValidator>
        

    </td></tr>
     
    <tr><td class="auto-style16">Gender:</td>
    <td class="auto-style13"><asp:RadioButtonList ID="rdoGender" 
                             runat="server">
             <asp:ListItem>Male</asp:ListItem>
             <asp:ListItem>Female</asp:ListItem>
        </asp:RadioButtonList>
    </td>
    <td class="auto-style14"><asp:RequiredFieldValidator 
             ID="RequiredFieldValidator2" 
             runat="server" 
             ControlToValidate="rdoGender"
             ErrorMessage="Gender can't be left blank" 
             SetFocusOnError="True">* </asp:RequiredFieldValidator>
    </td></tr>
     
                            
    <tr><td class="auto-style16">Email ID:</td>
    <td class="auto-style13"><asp:TextBox ID="txtEmailID" runat="server" CssClass="inputBox" Font-Size="12pt" Height="28px" Width="180px"></asp:TextBox>
    </td>
   <td class="auto-style14"><asp:RequiredFieldValidator 
            ID="RequiredFieldValidator3" 
            runat="server" 
            ControlToValidate="txtEmailID"
            ErrorMessage="Email can't be left blank" 
            SetFocusOnError="True">* </asp:RequiredFieldValidator>


    </td>
       </tr>
     <tr><td class="auto-style16">Extra:</td>
    <td class="auto-style13"><asp:TextBox ID="txtExtra" runat="server" CssClass="inputBox" Font-Size="12pt" Height="28px" Width="180px"></asp:TextBox>
    </td>
    
     
        
    
   <tr><td class="auto-style17"><asp:Label ID="lblMsg" runat="server"> </asp:Label>
       </td>
   <td class="auto-style7"><asp:ValidationSummary ID="ValidationSummary1" 
            runat="server" ShowMessageBox="True" 
            ShowSummary="False" Height="46px" Width="211px"/>
   </td></tr>
   </table>
    <asp:Button ID="btnSave" runat="server" 
                       Text="Sign Up" 
                       onclick="btnSave_Click" BackColor="#003399" Height="41px" Width="192px" Font-Size="13pt" BorderColor="#003399" BorderStyle="Groove" Font-Bold="True" ForeColor="White" CssClass="auto-style10"/>
    </div>

            </form>
 </body>

</html>