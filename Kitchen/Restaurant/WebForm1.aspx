<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Restaurant.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-image:url(Images/m.jpg); ">
    <form id="form2" runat="server">
        <div>
            <h2 style="color:white">Login Here</h2>
            <table>
                <tr>
                    <td style="color:blue">UserName :</td>
                    <td>
                        <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="txtUserName" ErrorMessage="Please Enter Your Username"
                            ForeColor="Red"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="color:blue">Password :</td>
                    <td>
                        <asp:TextBox ID="txtPassword" textmode="Password" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ControlToValidate="txtPassword" ErrorMessage="Please Enter Your Password"
                            ForeColor="Red"></asp:RequiredFieldValidator></td>
                </tr>
            </table>
            <asp:Button ID="Button1" runat="server" Text="User Log In" OnClick="Button1_Click1" />
           
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Admin Log In" />
            <br />
             <asp:Label ID="Label1" runat="server"></asp:Label>
          
        </div>
    </form>
</body>
</html>
