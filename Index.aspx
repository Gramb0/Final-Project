<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="FinalProject.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Payroll System</title>
    <style type="text/css">
        .auto-style1 {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <span class="auto-style1">Employee Information</span><br />
            First Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfFirstName" runat="server" ControlToValidate="txtFirstName" ErrorMessage="Missing required field" ForeColor="Red" ToolTip="This is a required field">*</asp:RequiredFieldValidator>
            <br />
            Last Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfLastName" runat="server" ControlToValidate="txtLastName" ErrorMessage="Missing required field" ForeColor="Red" ToolTip="This is a required field">*</asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="lblWorkHours" runat="server" Text="Hours worked"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtWorkHours" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfHoursWorked" runat="server" ControlToValidate="txtWorkHours" ErrorMessage="Missing required field" ForeColor="Red" ToolTip="This is a required field">*</asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="RangeValidator" ForeColor="Red" MaximumValue="80" MinimumValue="0" ToolTip="Hours: 0-80" Type="Double" ControlToValidate="txtWorkHours">*</asp:RangeValidator>
            <br />
            <asp:Label ID="lblPayRate" runat="server" Text="Pay Rate"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtPayRate" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfPayRate" runat="server" ControlToValidate="txtPayRate" ErrorMessage="Missing required field" ForeColor="Red" ToolTip="This is a required field">*</asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Button ID="btnClear" runat="server" OnClick="btnClear_Click" Text="Clear" />
&nbsp;&nbsp;
            <asp:Button ID="btnGeneratePaystub" runat="server" OnClick="btnGeneratePaystub_Click" Text="Generate Paystub" />
            &nbsp;<asp:Label ID="lblError" runat="server" ForeColor="Red" Visible="False"></asp:Label>
            <br />
            <br />
            <br />
            <span class="auto-style1">Paystub</span><br />
            <asp:Label ID="lblStubName" runat="server" Text="Name:"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtStubName" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblRegularPay" runat="server" Text="Pay for Regular Hours:"></asp:Label>
            &nbsp;<asp:TextBox ID="txtStubRegularPay" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lblStubHours" runat="server" Text="Hours Worked:"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtStubHours" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblOvertimePay" runat="server" Text="Pay for Overtime Hours:"></asp:Label>
            &nbsp;<asp:TextBox ID="txtStubOvertimePay" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lblOvertimeHours" runat="server" Text="Overtime Hours Worked:"></asp:Label>
            <asp:TextBox ID="txtStubOvertimeHours" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblStubTaxes" runat="server" Text="Taxes:"></asp:Label>
            &nbsp;
            <asp:TextBox ID="txtStubTaxes" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lblStubRegularHrsTotal" runat="server" Text="Pay Rate:"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txtStubRate" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblStubNetPay" runat="server" Text="Net Pay:"></asp:Label>
            &nbsp;<asp:TextBox ID="txtStubNetPay" runat="server"></asp:TextBox>
            <br />
        </div>
    </form>
</body>
</html>
