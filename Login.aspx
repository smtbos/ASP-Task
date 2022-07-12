<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <center>
        <div>
            <asp:Label ID="lbl_username" runat="server">Username : </asp:Label>
            <asp:TextBox ID="txt_username" runat="server"></asp:TextBox>
        </div>
        <br />
        <div>
            <asp:Label ID="lbl_password" runat="server">Password : </asp:Label>
            <asp:TextBox ID="txt_password" TextMode="Password" runat="server"></asp:TextBox>
        </div>
        <br />
        <div>
            <asp:Button ID="btn_login" Text="Login" runat="server" OnClick="btn_login_Click" />
            &nbsp;&nbsp;&nbsp;
            <a href="Register.aspx">Goto Register Page</a>
        </div>
        </center>
    </form>
</body>
</html>
