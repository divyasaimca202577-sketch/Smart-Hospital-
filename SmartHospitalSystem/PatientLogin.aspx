<%@ Page Language="C#" AutoEventWireup="true"
CodeBehind="PatientLogin.aspx.cs"
Inherits="SmartHospitalSystem.PatientLogin" %>

<!DOCTYPE html>
<html>
<head runat="server">

<title>Patient Login</title>

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

/* Background Glow */

body::before{
    content:'';
    position:absolute;
    width:500px;
    height:500px;
    background:#00c6ff;
    filter:blur(180px);
    opacity:0.25;
    top:-150px;
    left:-150px;
}

body::after{
    content:'';
    position:absolute;
    width:500px;
    height:500px;
    background:#00cc66;
    filter:blur(180px);
    opacity:0.18;
    bottom:-150px;
    right:-150px;
}

/* Login Card */

.login-box{
    position:relative;
    width:420px;
    background:rgba(16,39,61,0.95);
    padding:45px;
    border-radius:25px;
    box-shadow:0px 0px 30px rgba(0,0,0,0.5);
    z-index:1;
}

/* Heading */

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

/* Input Fields */

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
    transform:translateY(-2px);
}

/* Message */

.msg{
    text-align:center;
    margin-top:18px;
    color:#ff8080;
    font-size:15px;
}

/* Footer Links */

.links{
    margin-top:25px;
    text-align:center;
}

.links a{
    color:#00c6ff;
    text-decoration:none;
    font-size:14px;
}

.links a:hover{
    text-decoration:underline;
}

</style>

<script>

function togglePassword() {

    var pass =
    document.getElementById('<%= txtPassword.ClientID %>');

    if(pass.type === "password")
    {
        pass.type = "text";
    }
    else
    {
        pass.type = "password";
    }
}

</script>

</head>

<body>

<form id="form1" runat="server">

<div class="login-box">

    <div class="logo">🏥</div>

    <h2>Patient Login</h2>

    <div class="sub">
        Access your appointments and health dashboard
    </div>

    <!-- Email -->

    <div class="field">

        <label>Email Address</label>

        <div class="input-box">

            <asp:TextBox ID="txtEmail"
            runat="server"
            placeholder="Enter your email"></asp:TextBox>

        </div>

    </div>

    <!-- Password -->

    <div class="field">

        <label>Password</label>

        <div class="input-box">

            <asp:TextBox ID="txtPassword"
            runat="server"
            TextMode="Password"
            placeholder="Enter your password"></asp:TextBox>

            <span onclick="togglePassword()">👁</span>

        </div>

    </div>

    <!-- Login Button -->

    <asp:Button ID="btnLogin"
    runat="server"
    Text="Login"
    CssClass="btn"
    OnClick="btnLogin_Click" />

    <!-- Message -->

    <div class="msg">

        <asp:Label ID="lblMsg"
        runat="server"></asp:Label>

    </div>

    <!-- Footer -->

    <div class="links">

        <a href="PatientRegister.aspx">
        Create New Account
        </a>

        <br /><br />

        <a href="ForgotPassword.aspx">
        Forgot Password?
        </a>

    </div>

</div>

</form>

</body>
</html>