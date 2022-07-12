<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <button style="float: right;" onclick="location.href='Logout.aspx'" type="button">Logout</button>
            <br />
            <br />
            <br />
            <center>
            <asp:GridView CssClass="table table-striped" ID="gv_details" runat="server" AutoGenerateColumns="false" OnRowEditing="gv_details_RowEditing" OnRowCancelingEdit="gv_details_RowCancelingEdit" OnRowUpdating="gv_details_RowUpdating">
                <Columns>
                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>
                            <asp:Label ID="lbl_id" runat="server" Text='<%#Eval("std_id")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Frist Name">
                        <ItemTemplate>
                            <asp:Label ID="lbl_fname" runat="server" Text='<%#Eval("std_fname")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_fname" runat="server" Text='<%#Eval("std_fname")%>'></asp:TextBox>
                            <span style="color: red;">
                                <asp:RequiredFieldValidator ID="rfv_fname" runat="server" ControlToValidate="txt_fname" ErrorMessage="<br>Please Enter First Name" Display="Dynamic"></asp:RequiredFieldValidator>
                            </span>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Last Name">
                        <ItemTemplate>
                            <asp:Label ID="lbl_lname" runat="server" Text='<%#Eval("std_lname")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_lname" runat="server" Text='<%#Eval("std_lname")%>'></asp:TextBox>
                            <span style="color: red;">
                                <asp:RequiredFieldValidator ID="rfv_lname" runat="server" ControlToValidate="txt_lname" ErrorMessage="<br>Please Enter Last Name" Display="Dynamic"></asp:RequiredFieldValidator>
                            </span>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Gender">
                        <ItemTemplate>
                            <asp:Label ID="lbl_gender" runat="server" Text='<%#Eval("std_gender")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_gender" runat="server" Text='<%#Eval("std_gender")%>' Visible="false"></asp:TextBox>
                            <asp:RadioButton ID="rb_male" runat="server" GroupName="rbg_gender" Text="Male" />
                            <asp:RadioButton ID="rb_female" runat="server" GroupName="rbg_gender" Text="Female" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Contact">
                        <ItemTemplate>
                            <asp:Label ID="lbl_contact" runat="server" Text='<%#Eval("std_contact")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_contact" runat="server" Text='<%#Eval("std_contact")%>'></asp:TextBox>
                            <span style="color: red;">
                                <asp:RequiredFieldValidator ID="rfv_contact" runat="server" ControlToValidate="txt_contact" ErrorMessage="<br>Please Enter Contact Number" Display="Dynamic"></asp:RequiredFieldValidator>
                            </span>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label ID="lbl_email" runat="server" Text='<%#Eval("std_email")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_email" runat="server" Text='<%#Eval("std_email")%>'></asp:TextBox>
                            <span style="color: red;">
                                <asp:RequiredFieldValidator ID="rfv_email" runat="server" ControlToValidate="txt_email" ErrorMessage="<br>Please Enter Email Address" Display="Dynamic"></asp:RequiredFieldValidator>
                            </span>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="State">
                        <ItemTemplate>
                            <asp:Label ID="lbl_state" runat="server" Text='<%#Eval("state_name")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_state" runat="server" Text='<%#Eval("state_id")%>' Visible="false"></asp:TextBox>
                            <asp:DropDownList ID="ddl_state" runat="server">
                            </asp:DropDownList>
                            <span style="color: red;">
                                <asp:RequiredFieldValidator ID="rfv_state" runat="server" ControlToValidate="ddl_state" ErrorMessage="<br>Please Select State" Display="Dynamic"></asp:RequiredFieldValidator>
                            </span>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="City">
                        <ItemTemplate>
                            <asp:Label ID="lbl_city" runat="server" Text='<%#Eval("city_name")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_city" runat="server" Text='<%#Eval("city_id")%>' Visible="false"></asp:TextBox>
                            <asp:DropDownList ID="ddl_city" runat="server">
                            </asp:DropDownList>
                            <span style="color: red;">
                                <asp:RequiredFieldValidator ID="rfv_city" runat="server" ControlToValidate="ddl_city" ErrorMessage="<br>Please Select City" Display="Dynamic"></asp:RequiredFieldValidator>
                            </span>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Pincode">
                        <ItemTemplate>
                            <asp:Label ID="lbl_pincode" runat="server" Text='<%#Eval("std_pin")%>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txt_pincode" runat="server" Text='<%#Eval("std_pin")%>'>
                            </asp:TextBox><span style="color: red;">
                                <asp:RequiredFieldValidator ID="rfv_pincode" runat="server" ControlToValidate="txt_pincode" ErrorMessage="<br>Please Enter Pincode" Display="Dynamic"></asp:RequiredFieldValidator>
                            </span>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:Button ID="btn_edit" runat="server" Text="Edit" CommandName="Edit" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Button ID="btn_update" runat="server" Text="Update" CommandName="Update" />
                            <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancel" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            </center>
        </div>
    </form>
    <script>
        $(document).ready(function () {
            $("#<%= ed_city %> option[data-state!=0]").hide();
            $("#<%= ed_city %> option[data-state=" + $("#<%= ed_state %>").val() + "]").show();
            $("#<%= ed_state %>").change(function () {
                $("#<%= ed_city %>").val("");
                $("#<%= ed_city %> option[data-state!=0]").hide();
                $("#<%= ed_city %> option[data-state=" + $(this).val() + "]").show();
            });
        });
    </script>
</body>
</html>
