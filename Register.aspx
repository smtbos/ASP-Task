<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <table align="center">
            <tr valign="top">
                <td>
                    <asp:Label ID="lbl_fname" runat="server">First Name : </asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_fname" runat="server"></asp:TextBox>
                    <span style="color: red;">
                        <asp:RequiredFieldValidator ID="rfv_fname" runat="server" ControlToValidate="txt_fname" ErrorMessage="<br>* Please Enter First Name"></asp:RequiredFieldValidator>
                    </span>
                </td>
            </tr>
            <tr valign="top">
                <td>
                    <asp:Label ID="lbl_lname" runat="server">Last Name : </asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_lname" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_lname" runat="server" ControlToValidate="txt_lname" ErrorMessage="<br>* Please Enter Last Name" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr valign="top">
                <td>
                    <asp:Label ID="lbl_gender" runat="server">Gender : </asp:Label>
                </td>
                <td>
                    <asp:RadioButton ID="rb_male" runat="server" GroupName="rbg_gender" Text="Male" Checked="true" />
                    <asp:RadioButton ID="rb_female" runat="server" GroupName="rbg_gender" Text="Female" />
                </td>
            </tr>
            <tr valign="top">
                <td>
                    <asp:Label ID="lbl_contact" runat="server">Contact : </asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_contact" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfv_contact" runat="server" ControlToValidate="txt_contact" ErrorMessage="<br>* Please Enter Contact Number" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr valign="top">
                <td>
                    <asp:Label ID="lbl_email" runat="server">Email : </asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_email" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_email" runat="server" ControlToValidate="txt_email" ErrorMessage="<br>* Please Enter Email Address" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr valign="top">
                <td>
                    <asp:Label ID="lbl_state" runat="server">State : </asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddl_state" runat="server">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfv_state" runat="server" ControlToValidate="ddl_state" ErrorMessage="<br>* Please Select State" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr valign="top">
                <td>
                    <asp:Label ID="lbl_city" runat="server">City : </asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddl_city" runat="server">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfv_city" runat="server" ControlToValidate="txt_fname" ErrorMessage="<br>* Please Select City" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr valign="top">
                <td>
                    <asp:Label ID="lbl_pin" runat="server">Pincode : </asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_pincode" runat="server"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfv_pincode" runat="server" ControlToValidate="txt_pincode" ErrorMessage="* Please Enter Pincode" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="rv_pincode" runat="server" ControlToValidate="txt_pincode" MinimumValue="100001" MaximumValue="999999" ErrorMessage="Invalid Pincode" ForeColor="Red" Type="Integer" Display="Dynamic"></asp:RangeValidator>
                    &nbsp;
                </td>
            </tr>
            <tr valign="top">
                <td>
                    <asp:Label ID="lbl_username" runat="server">Username : </asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_username" runat="server">
                    </asp:TextBox><span style="color: red;">
                        <asp:RequiredFieldValidator ID="rfv_usernamek" runat="server" ControlToValidate="txt_username" ErrorMessage="<br>* Please Enter Username"></asp:RequiredFieldValidator>
                    </span>
                </td>
            </tr>
            <tr valign="top">
                <td>
                    <asp:Label ID="lbl_password" runat="server">Password : </asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_password" TextMode="Password" runat="server">
                    </asp:TextBox><span style="color: red;">
                        <asp:RequiredFieldValidator ID="rfv_password" runat="server" ControlToValidate="txt_password" ErrorMessage="<br>* Please Enter Password"></asp:RequiredFieldValidator>
                    </span>
                </td>
            </tr>
            <tr valign="top">
                <td>
                    <asp:Label ID="lbl_cpassword" runat="server">Confirm Password : </asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_cpassword" TextMode="Password" runat="server"></asp:TextBox>
                    <span style="color: red;">
                        <asp:CompareValidator ID="cv_password" runat="server" ControlToValidate="txt_cpassword" ControlToCompare="txt_password" ErrorMessage="<br>Password and Confirm<br>Password not Match"></asp:CompareValidator>
                    </span>
                </td>
            </tr>
            <tr valign="top">
                <td colspan="2" style="text-align: center;">
                    <asp:Button ID="btn_register" Text="Register" runat="server" OnClick="btn_register_Click" />
                    &nbsp;&nbsp;&nbsp;
                    <a href="Login.aspx">Goto Login Page</a>
                </td>
            </tr>
        </table>
    </form>
    <script>
        $(document).ready(function () {
            $("#<%= ddl_city.ClientID %> option[data-state!=0]").hide();
            $("#<%= ddl_state.ClientID %>").change(function () {
                console.log($(this).val());
                $("#<%= ddl_city.ClientID %> option[data-state!=0]").hide();

                $("#<%= ddl_city.ClientID %> option[data-state=" + $(this).val() + "]").show();
            });
        });
    </script>
</body>
</html>
