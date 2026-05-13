<%@ Page Language="C#" AutoEventWireup="true"
CodeBehind="ForgotPassword.aspx.cs"
Inherits="SmartHospitalSystem.ForgotPassword" %>

<!DOCTYPE html>
<html>
<head runat="server">

<title>Forgot Password</title>

<style>

body{
    margin:0;
    padding:0;
    font-family:Arial;
    background:#081b29;
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    overflow:hidden;
}

/* Glow Background */

body::before{
    content:'';
    position:absolute;
    width:450px;
    height:450px;
    background:#00c6ff;
    filter:blur(180px);
    opacity:0.22;
    top:-100px;
    left:-100px;
}

body::after{
    content:'';
    position:absolute;
    width:450px;
    height:450px;
    background:#00cc66;
    filter:blur(180px);
    opacity:0.18;
    bottom:-100px;
    right:-100px;
}

/* Card */

.box{
    position:relative;
    width:420px;
    background:rgba(16,39,61,0.96);
    padding:45px;
    border-radius:25px;
    box-shadow:0px 0px 30px rgba(0,0,0,0.5);
    z-index:1;
}

.logo{
    width:80px;
    height:80px;
    background:#00c6ff;
    border-radius:50%;
    display:flex;
    justify-content:center;
    align-items:center;
    font-size:35px;
    margin:0 auto 20px;
    color:white;
}

h2{
    text-align:center;
    color:white;
    margin-bottom:10px;
}

.sub{
    text-align:center;
    color:#9bb3c9;
    margin-bottom:35px;
    font-size:14px;
}

.field{
    margin-bottom:20px;
}

.field label{
    display:block;
    margin-bottom:8px;
    color:#b0c4de;
    font-size:14px;
}

.input-box{
    position:relative;
}

.input-box input{
    width:100%;
    padding:15px;
    border:none;
    border-radius:12px;
    background:#20354a;
    color:white;
    font-size:15px;
    box-sizing:border-box;
}

.input-box input:focus{
    outline:none;
    border:2px solid #00c6ff;
}

.input-box span{
    position:absolute;
    right:15px;
    top:50%;
    transform:translateY(-50%);
    cursor:pointer;
    color:#9bb3c9;
}

/* Button */

.btn{
    width:100%;
    padding:15px;
    border:none;
    border-radius:12px;
    background:#00c6ff;
    color:white;
    font-size:17px;
    font-weight:bold;
    cursor:pointer;
    transition:0.3s;
}

.btn:hover{
    background:#00a8dd;
}

/* Message */

.msg{
    text-align:center;
    margin-top:18px;
    font-size:15px;
}

/* Footer */

.footer{
    margin-top:25px;
    text-align:center;
}

.footer a{
    color:#00c6ff;
    text-decoration:none;
    font-size:14px;
}

.footer a:hover{
    text-decoration:underline;
}

</style>

<script>

function togglePassword(id)
{
    var txt = document.getElementById(id);

    if(txt.type === "password")
    {
        txt.type = "text";
    }
    else
    {
        txt.type = "password";
    }
}

</script>

</head>

<body>

<form id="form1" runat="server">

<div class="box">

    <!-- Logo -->

    <div class="logo">🔒</div>

    <h2>Forgot Password</h2>

    <div class="sub">
        Reset your Smart Hospital account password
    </div>

    <!-- Email -->

    <div class="field">

        <label>Email Address</label>

        <div class="input-box">

            <asp:TextBox ID="txtEmail"
            runat="server"
            placeholder="Enter registered email"></asp:TextBox>

        </div>

    </div>

    <!-- New Password -->

    <div class="field">

        <label>New Password</label>

        <div class="input-box">

            <asp:TextBox ID="txtPassword"
            runat="server"
            TextMode="Password"
            placeholder="Enter new password"></asp:TextBox>

            <span onclick="togglePassword('<%= txtPassword.ClientID %>')">
            👁
            </span>

        </div>

    </div>

    <!-- Confirm Password -->

    <div class="field">

        <label>Confirm Password</label>

        <div class="input-box">

            <asp:TextBox ID="txtConfirmPassword"
            runat="server"
            TextMode="Password"
            placeholder="Confirm new password"></asp:TextBox>

            <span onclick="togglePassword('<%= txtConfirmPassword.ClientID %>')">
            👁
            </span>

        </div>

    </div>

    <!-- Button -->

    <asp:Button ID="btnReset"
    runat="server"
    Text="Reset Password"
    CssClass="btn"
    OnClick="btnReset_Click" />

    <!-- Message -->

    <div class="msg">

        <asp:Label ID="lblMsg"
        runat="server"></asp:Label>

    </div>

    <!-- Footer -->

    <div class="footer">

        <a href="PatientLogin.aspx">
        Back to Login
        </a>

    </div>

</div>

</form>

</body>
</html>