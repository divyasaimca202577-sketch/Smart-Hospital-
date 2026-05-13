<%@ Page Language="C#" AutoEventWireup="true"
CodeBehind="PatientRegister.aspx.cs"
Inherits="SmartHospitalSystem.PatientRegister" %>

<!DOCTYPE html>
<html>
<head runat="server">

<title>Patient Registration</title>

<style>

body{
    margin:0;
    padding:40px 0;
    font-family:Arial;
    background:#081b29;
    min-height:100vh;
    display:flex;
    justify-content:center;
    align-items:flex-start;
    overflow-y:auto;
}

/* Background Glow */

body::before{
    content:'';
    position:absolute;
    width:500px;
    height:500px;
    background:#00c6ff;
    filter:blur(180px);
    opacity:0.22;
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
    opacity:0.16;
    bottom:-150px;
    right:-150px;
}

/* Register Card */

.register-box{
    position:relative;
    width:450px;
    margin:30px 0;
    background:rgba(16,39,61,0.96);
    padding:45px;
    border-radius:25px;
    box-shadow:0px 0px 30px rgba(0,0,0,0.5);
    z-index:1;
}

/* Logo */

.logo{
    width:85px;
    height:85px;
    background:#00c6ff;
    border-radius:50%;
    display:flex;
    justify-content:center;
    align-items:center;
    font-size:38px;
    margin:0 auto 20px;
    color:white;
}

/* Heading */

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

/* Input Section */

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

<div class="register-box">

    <!-- Logo -->

    <div class="logo">🏥</div>

    <!-- Heading -->

    <h2>Patient Registration</h2>

    <div class="sub">
        Create your Smart Hospital account
    </div>

    <!-- Full Name -->

    <div class="field">

        <label>Full Name</label>

        <div class="input-box">

            <asp:TextBox ID="txtName"
            runat="server"
            placeholder="Enter full name"></asp:TextBox>

        </div>

    </div>

    <!-- Email -->

    <div class="field">

        <label>Email Address</label>

        <div class="input-box">

            <asp:TextBox ID="txtEmail"
            runat="server"
            placeholder="Enter email"></asp:TextBox>

        </div>

    </div>

    <!-- Password -->

    <div class="field">

        <label>Password</label>

        <div class="input-box">

            <asp:TextBox ID="txtPassword"
            runat="server"
            TextMode="Password"
            placeholder="Enter password"></asp:TextBox>

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
            placeholder="Confirm password"></asp:TextBox>

            <span onclick="togglePassword('<%= txtConfirmPassword.ClientID %>')">
            👁
            </span>

        </div>

    </div>

    <!-- Mobile -->

    <div class="field">

        <label>Mobile Number</label>

        <div class="input-box">

            <asp:TextBox ID="txtMobile"
            runat="server"
            placeholder="Enter mobile number"></asp:TextBox>

        </div>

    </div>

    <!-- Register Button -->

    <asp:Button ID="btnRegister"
    runat="server"
    Text="Create Account"
    CssClass="btn"
    OnClick="btnRegister_Click" />

    <!-- Message -->

    <div class="msg">

        <asp:Label ID="lblMsg"
        runat="server"></asp:Label>

    </div>

    <!-- Footer -->

    <div class="footer">

        Already have an account?

        <a href="PatientLogin.aspx">
        Login Here
        </a>

    </div>
</div>
</form>
</body>
</html>