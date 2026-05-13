<%@ Page Language="C#" AutoEventWireup="true"
CodeBehind="ViewAppointments.aspx.cs"
Inherits="SmartHospitalSystem.ViewAppointments" %>

<!DOCTYPE html>
<html>
<head runat="server">

<title>View Appointments</title>

<style>

body{
    margin:0;
    font-family:Arial;
    background:#081b29;
    color:white;
}

.container{
    width:95%;
    max-width:1200px;
    margin:40px auto;
    background:#10273d;
    padding:40px;
    border-radius:20px;
    box-shadow:0px 0px 20px rgba(0,0,0,0.4);
}

.header{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:30px;
}

h1{
    color:#00c6ff;
}

.count-box{
    background:#00c6ff;
    padding:12px 20px;
    border-radius:10px;
    font-weight:bold;
    color:white;
}

.search-box{
    margin-bottom:25px;
}

.search-input{
    width:300px;
    padding:12px;
    border:none;
    border-radius:10px;
    background:#20354a;
    color:white;
    font-size:15px;
}

.grid table{
    width:100%;
    border-collapse:collapse;
    overflow:hidden;
    border-radius:12px;
}

.grid th{
    background:#00c6ff;
    color:white;
    padding:15px;
    text-align:center;
}

.grid td{
    background:#1a3147;
    padding:14px;
    text-align:center;
    border-bottom:1px solid #2f4f68;
}

.grid tr:hover td{
    background:#243f59;
}

.status{
    padding:8px 15px;
    border-radius:20px;
    font-weight:bold;
    color:white;
}

.pending{
    background:orange;
}

.confirmed{
    background:#00cc66;
}

.cancelled{
    background:#ff4d4d;
}

.btn{
    border:none;
    padding:8px 14px;
    border-radius:8px;
    color:white;
    cursor:pointer;
    font-weight:bold;
    margin:2px;
}

.btn-confirm{
    background:#00cc66;
}

.btn-pending{
    background:orange;
}

.btn-cancel{
    background:#ff4d4d;
}

.btn:hover{
    opacity:0.8;
}

</style>

</head>

<body>

<form id="form1" runat="server">

<div class="container">

<div class="header">

    <h1>Appointment Management</h1>

    <div class="count-box">

        Total Appointments :
        <asp:Label ID="lblCount"
        runat="server"></asp:Label>

    </div>

</div>

<div class="search-box">

    <asp:TextBox ID="txtSearch"
    runat="server"
    CssClass="search-input"
    AutoPostBack="true"
    OnTextChanged="txtSearch_TextChanged"
    placeholder="Search patient or doctor..."></asp:TextBox>

</div>

<div class="grid">

<asp:GridView ID="GridView1"
runat="server"
AutoGenerateColumns="False"
DataKeyNames="AppointmentId"
OnRowCommand="GridView1_RowCommand">

<Columns>

    <asp:BoundField DataField="AppointmentId"
    HeaderText="ID" />

    <asp:BoundField DataField="PatientName"
    HeaderText="Patient" />

    <asp:BoundField DataField="DoctorName"
    HeaderText="Doctor" />

    <asp:BoundField DataField="AppointmentDate"
    HeaderText="Date" />

    <asp:TemplateField HeaderText="Status">

        <ItemTemplate>

            <asp:Label ID="lblStatus"
            runat="server"
            Text='<%# Eval("Status") %>'
            CssClass='<%#
            Eval("Status").ToString() == "Confirmed"
            ? "status confirmed"
            : Eval("Status").ToString() == "Pending"
            ? "status pending"
            : "status cancelled"
            %>'>

            </asp:Label>

        </ItemTemplate>

    </asp:TemplateField>

    <asp:TemplateField HeaderText="Actions">

        <ItemTemplate>

            <asp:Button ID="btnConfirm"
            runat="server"
            Text="Confirm"
            CommandName="ConfirmAppointment"
            CommandArgument='<%# Eval("AppointmentId") %>'
            CssClass="btn btn-confirm" />

            <asp:Button ID="btnPending"
            runat="server"
            Text="Pending"
            CommandName="PendingAppointment"
            CommandArgument='<%# Eval("AppointmentId") %>'
            CssClass="btn btn-pending" />

            <asp:Button ID="btnCancel"
            runat="server"
            Text="Cancel"
            CommandName="CancelAppointment"
            CommandArgument='<%# Eval("AppointmentId") %>'
            CssClass="btn btn-cancel" />

        </ItemTemplate>

    </asp:TemplateField>

</Columns>

</asp:GridView>

</div>

</div>

</form>

</body>
</html>