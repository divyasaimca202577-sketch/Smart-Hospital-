<%@ Page Language="C#" AutoEventWireup="true"
CodeBehind="ManageDoctors.aspx.cs"
Inherits="SmartHospitalSystem.ManageDoctors" %>

<!DOCTYPE html>
<html>
<head runat="server">

<title>Manage Doctors</title>

<style>

body{
    margin:0;
    font-family:Arial;
    background:#081b29;
    color:white;
}

.container{
    width:90%;
    max-width:1000px;
    margin:40px auto;
    background:#10273d;
    padding:40px;
    border-radius:20px;
    box-shadow:0px 0px 20px rgba(0,0,0,0.4);
}

h1{
    text-align:center;
    margin-bottom:30px;
    color:#00c6ff;
}

.form-section{
    display:grid;
    grid-template-columns:1fr 1fr 1fr auto;
    gap:15px;
    margin-bottom:30px;
}

input{
    padding:14px;
    border:none;
    border-radius:10px;
    background:#20354a;
    color:white;
    font-size:15px;
}

input::placeholder{
    color:#b0c4de;
}

.btn-add{
    background:#00c6ff;
    color:white;
    border:none;
    padding:14px 20px;
    border-radius:10px;
    cursor:pointer;
    font-size:15px;
    font-weight:bold;
}

.btn-add:hover{
    background:#00a8dd;
}

.grid{
    margin-top:20px;
}

.grid table{
    width:100%;
    border-collapse:collapse;
    overflow:hidden;
    border-radius:10px;
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

.delete-btn{
    background:#ff4d4d;
    color:white;
    border:none;
    padding:8px 15px;
    border-radius:8px;
    cursor:pointer;
    font-weight:bold;
}

.delete-btn:hover{
    background:#e60000;
}

.msg{
    text-align:center;
    margin-top:20px;
    color:lightgreen;
    font-size:16px;
}

</style>

</head>

<body>

<form id="form1" runat="server">

<div class="container">

<h1>Manage Doctors</h1>

<div class="form-section">

    <asp:TextBox ID="txtDoctor"
    runat="server"
    placeholder="Doctor Name"></asp:TextBox>

    <asp:TextBox ID="txtSpecialization"
    runat="server"
    placeholder="Specialization"></asp:TextBox>

    <asp:TextBox ID="txtTime"
    runat="server"
    placeholder="Available Time"></asp:TextBox>

    <asp:Button ID="btnAdd"
    runat="server"
    Text="Add Doctor"
    CssClass="btn-add"
    OnClick="btnAdd_Click" />

</div>

<div class="grid">

<asp:GridView ID="GridView1"
runat="server"
AutoGenerateColumns="False"
DataKeyNames="DoctorId"
OnRowDeleting="GridView1_RowDeleting">

<Columns>

    <asp:BoundField DataField="DoctorId"
    HeaderText="ID" />

    <asp:BoundField DataField="DoctorName"
    HeaderText="Doctor Name" />

    <asp:BoundField DataField="Specialization"
    HeaderText="Specialization" />

    <asp:BoundField DataField="AvailableTime"
    HeaderText="Available Time" />

    <asp:CommandField ShowDeleteButton="True"
    DeleteText="Remove"
    ControlStyle-CssClass="delete-btn" />

</Columns>

</asp:GridView>

</div>

<div class="msg">

<asp:Label ID="lblMsg"
runat="server"></asp:Label>

</div>

</div>

</form>

</body>
</html>