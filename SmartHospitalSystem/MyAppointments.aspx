<%@ Page Language="C#" AutoEventWireup="true"
CodeBehind="MyAppointments.aspx.cs"
Inherits="SmartHospitalSystem.MyAppointments" %>

<!DOCTYPE html>
<html>
<head runat="server">

<title>My Appointments</title>

<style>

body{
    margin:0;
    font-family:Arial;
    background:#081b29;
    color:white;
}

.container{
    width:95%;
    max-width:1100px;
    margin:40px auto;
    background:#10273d;
    padding:40px;
    border-radius:20px;
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

.btn{
    background:#00c6ff;
    color:white;
    border:none;
    padding:12px 20px;
    border-radius:10px;
    cursor:pointer;
    font-size:15px;
    text-decoration:none;
}

.btn:hover{
    background:#00a8dd;
}

.grid table{
    width:100%;
    border-collapse:collapse;
    overflow:hidden;
    border-radius:10px;
}

.grid th{
    background:#00c6ff;
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
    color:white;
    font-weight:bold;
}

.confirmed{
    background:#00cc66;
}

.pending{
    background:orange;
}

.cancelled{
    background:#ff4d4d;
}

.empty{
    text-align:center;
    margin-top:30px;
    color:#9bb3c9;
    font-size:18px;
}

</style>

</head>

<body>

<form id="form1" runat="server">

<div class="container">

<div class="header">

    <h1>My Appointments</h1>

    <a href="BookAppointment.aspx" class="btn">
    + Book Appointment
    </a>

</div>

<div class="grid">

<asp:GridView ID="GridView1"
runat="server"
AutoGenerateColumns="False"
EmptyDataText="No Appointments Found">

<Columns>

    <asp:BoundField DataField="AppointmentId"
    HeaderText="Appointment ID" />

    <asp:BoundField DataField="DoctorName"
    HeaderText="Doctor" />

    <asp:BoundField DataField="AppointmentDate"
    HeaderText="Appointment Date" />

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

</Columns>

</asp:GridView>

</div>

</div>

</form>

</body>
</html>