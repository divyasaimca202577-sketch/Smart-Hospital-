<%@ Page Language="C#" AutoEventWireup="true"
CodeBehind="BookAppointment.aspx.cs"
Inherits="SmartHospitalSystem.BookAppointment" %>

<!DOCTYPE html>
<html>
<head runat="server">

<title>Book Appointment</title>

<style>

body{
    margin:0;
    font-family:Arial;
    background:#081b29;
    color:white;
}

.container{
    width:500px;
    margin:40px auto;
    background:#10273d;
    padding:40px;
    border-radius:20px;
}

h1{
    text-align:center;
    margin-bottom:30px;
}


.field{
    margin-bottom:20px;
}

label{
    display:block;
    margin-bottom:8px;
    font-size:14px;
}

input, select{
    width:100%;
    padding:14px;
    border:none;
    border-radius:10px;
    background:#20354a;
    color:white;
    font-size:15px;
}

.btn{
    width:100%;
    padding:15px;
    border:none;
    border-radius:10px;
    background:#00c6ff;
    color:white;
    font-size:18px;
    cursor:pointer;
}

.btn:hover{
    background:#00a8dd;
}

.msg{
    text-align:center;
    margin-top:20px;
    font-size:16px;
    color:lightgreen;
}

</style>

</head>

<body>

<form id="form1" runat="server">

<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

<div class="container">

<h1>Book Appointment</h1>



<asp:UpdatePanel ID="UpdatePanel1" runat="server">
<ContentTemplate>

<!-- Patient -->

<div class="field">

<label>Patient Name</label>

<asp:TextBox ID="txtPatient"
runat="server"
ReadOnly="true"></asp:TextBox>

</div>

<!-- Doctor -->

<div class="field">

<label>Select Doctor</label>

<asp:DropDownList ID="ddlDoctor"
runat="server"></asp:DropDownList>

</div>

<!-- Date -->

<div class="field">

<label>Appointment Date</label>

<asp:TextBox ID="txtDate"
runat="server"
TextMode="Date"></asp:TextBox>

</div>

<!-- Button -->

<asp:Button ID="btnBook"
runat="server"
Text="Confirm Appointment"
CssClass="btn"
OnClick="btnBook_Click" />

<!-- Message -->

<div class="msg">

<asp:Label ID="lblMsg"
runat="server"></asp:Label>

</div>

</ContentTemplate>
</asp:UpdatePanel>

</div>

</form>

</body>
</html>