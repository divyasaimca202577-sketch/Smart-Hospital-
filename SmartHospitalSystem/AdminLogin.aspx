<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="SmartHospitalSystem.AdminLogin" %>
<!DOCTYPE html>
<html>
<head runat="server">
<title>Admin Login — Smart Hospital</title>
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
<style>
  :root {
    --navy: #0a1628;
    --teal: #0e7490;
    --teal-light: #22d3ee;
    --accent: #06b6d4;
    --gold: #f0a500;
    --white: #ffffff;
    --glass: rgba(255,255,255,0.07);
    --glass-border: rgba(255,255,255,0.13);
    --danger: #f87171;
  }

  *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

  body {
    font-family: 'DM Sans', sans-serif;
    background: var(--navy);
    min-height: 100vh;
    overflow-x: hidden;
    color: var(--white);
    display: flex;
    flex-direction: column;
  }

  body::before {
    content: '';
    position: fixed;
    inset: 0;
    background:
      radial-gradient(ellipse 70% 60% at 5% 15%,  rgba(14,116,144,0.35) 0%, transparent 60%),
      radial-gradient(ellipse 55% 50% at 95% 85%,  rgba(6,182,212,0.18) 0%, transparent 55%),
      radial-gradient(ellipse 40% 40% at 50% 50%,  rgba(240,165,0,0.06) 0%, transparent 60%);
    z-index: 0;
    animation: bgPulse 9s ease-in-out infinite alternate;
  }

  @keyframes bgPulse {
    0%   { opacity: 1;   transform: scale(1); }
    100% { opacity: 0.7; transform: scale(1.03); }
  }

  .particles { position: fixed; inset: 0; z-index: 0; pointer-events: none; overflow: hidden; }
  .particle  { position: absolute; border-radius: 50%; background: rgba(34,211,238,0.15); animation: floatUp linear infinite; }
  .particle:nth-child(1) { width:5px;  height:5px;  left:8%;  animation-duration:15s; animation-delay:0s;  top:100%; }
  .particle:nth-child(2) { width:3px;  height:3px;  left:22%; animation-duration:19s; animation-delay:3s;  top:100%; }
  .particle:nth-child(3) { width:7px;  height:7px;  left:45%; animation-duration:13s; animation-delay:6s;  top:100%; background:rgba(240,165,0,0.18); }
  .particle:nth-child(4) { width:4px;  height:4px;  left:65%; animation-duration:17s; animation-delay:1s;  top:100%; }
  .particle:nth-child(5) { width:6px;  height:6px;  left:82%; animation-duration:14s; animation-delay:4s;  top:100%; }

  @keyframes floatUp {
    0%   { transform: translateY(0) rotate(0deg);   opacity: 0; }
    10%  { opacity: 1; }
    90%  { opacity: 0.5; }
    100% { transform: translateY(-110vh) rotate(360deg); opacity: 0; }
  }

  /* NAV */
  .nav {
    position: relative; z-index: 10;
    display: flex; align-items: center; justify-content: space-between;
    padding: 20px 48px;
    border-bottom: 1px solid var(--glass-border);
    backdrop-filter: blur(12px);
    background: rgba(10,22,40,0.6);
    animation: slideDown 0.6s ease both;
  }

  @keyframes slideDown {
    from { transform: translateY(-24px); opacity: 0; }
    to   { transform: translateY(0);     opacity: 1; }
  }

  .nav-logo { display: flex; align-items: center; gap: 13px; text-decoration: none; }
  .nav-icon {
    width: 38px; height: 38px;
    background: linear-gradient(135deg, var(--teal), var(--accent));
    border-radius: 10px;
    display: flex; align-items: center; justify-content: center;
    font-size: 18px;
    box-shadow: 0 4px 16px rgba(6,182,212,0.4);
  }
  .nav-title {
    font-family: 'Playfair Display', serif;
    font-size: 1.05rem; font-weight: 700; color: var(--white); line-height: 1.2;
  }
  .nav-title span {
    display: block;
    font-family: 'DM Sans', sans-serif;
    font-size: 0.64rem; font-weight: 400;
    color: var(--teal-light); letter-spacing: 2.5px; text-transform: uppercase;
  }
  .nav-back {
    font-size: 0.78rem; color: rgba(255,255,255,0.45);
    text-decoration: none; letter-spacing: 0.5px;
    display: flex; align-items: center; gap: 6px;
    transition: color 0.2s;
  }
  .nav-back:hover { color: var(--teal-light); }

  /* PAGE */
  .page {
    position: relative; z-index: 5;
    flex: 1;
    display: flex; align-items: center; justify-content: center;
    padding: 48px 24px;
  }

  /* CARD */
  .login-card {
    width: 100%; max-width: 440px;
    background: rgba(255,255,255,0.06);
    border: 1px solid var(--glass-border);
    border-radius: 28px;
    padding: 48px 44px 44px;
    backdrop-filter: blur(20px);
    box-shadow: 0 32px 80px rgba(0,0,0,0.4), 0 0 0 1px rgba(255,255,255,0.05) inset;
    animation: cardIn 0.75s cubic-bezier(.23,1,.32,1) 0.15s both;
    position: relative;
    overflow: hidden;
  }

  .login-card::before {
    content: '';
    position: absolute;
    top: -60px; right: -60px;
    width: 200px; height: 200px;
    background: radial-gradient(circle, rgba(240,165,0,0.12) 0%, transparent 70%);
    border-radius: 50%;
    pointer-events: none;
  }

  @keyframes cardIn {
    from { opacity: 0; transform: translateY(36px) scale(0.97); }
    to   { opacity: 1; transform: translateY(0)    scale(1); }
  }

  .card-badge {
    width: 66px; height: 66px;
    background: linear-gradient(135deg, #b45309, #f0a500);
    border-radius: 20px;
    display: flex; align-items: center; justify-content: center;
    font-size: 30px;
    margin: 0 auto 24px;
    box-shadow: 0 8px 28px rgba(240,165,0,0.38);
    animation: badgePop 0.5s cubic-bezier(.23,1,.32,1) 0.55s both;
  }

  @keyframes badgePop {
    from { transform: scale(0.5) rotate(-15deg); opacity: 0; }
    to   { transform: scale(1)   rotate(0deg);   opacity: 1; }
  }

  .card-title {
    font-family: 'Playfair Display', serif;
    font-size: 1.75rem; font-weight: 700;
    text-align: center; color: var(--white);
    margin-bottom: 6px;
    animation: fadeUp 0.6s ease 0.6s both;
  }

  .card-subtitle {
    font-size: 0.8rem; color: rgba(255,255,255,0.4);
    text-align: center; letter-spacing: 0.3px;
    margin-bottom: 36px;
    animation: fadeUp 0.6s ease 0.7s both;
  }

  /* FIELDS */
  .field { margin-bottom: 20px; animation: fadeUp 0.6s ease both; }
  .field:nth-child(1) { animation-delay: 0.75s; }
  .field:nth-child(2) { animation-delay: 0.85s; }

  .field-label {
    display: block;
    font-size: 0.72rem; font-weight: 600;
    letter-spacing: 1.5px; text-transform: uppercase;
    color: rgba(255,255,255,0.5);
    margin-bottom: 8px;
  }

  .field-wrap { position: relative; display: flex; align-items: center; }

  .field-icon {
    position: absolute; left: 16px;
    font-size: 15px; opacity: 0.4;
    pointer-events: none; z-index: 2;
  }

  /* style the rendered ASP TextBox inputs */
  .field-wrap input {
    width: 100%;
    background: rgba(255,255,255,0.07);
    border: 1px solid rgba(255,255,255,0.12);
    border-radius: 12px;
    padding: 14px 16px 14px 46px;
    font-family: 'DM Sans', sans-serif;
    font-size: 0.92rem; color: var(--white);
    outline: none;
    transition: border-color 0.25s, background 0.25s, box-shadow 0.25s;
  }
  .field-wrap input:focus {
    border-color: var(--accent);
    background: rgba(6,182,212,0.08);
    box-shadow: 0 0 0 3px rgba(6,182,212,0.15);
  }
  .field-wrap input::placeholder { color: rgba(255,255,255,0.25); }

  /* BUTTON — ASP renders as <input type="submit"> */
  .btn-wrap { margin-top: 30px; animation: fadeUp 0.6s ease 0.95s both; }

  .btn-wrap input[type="submit"] {
    width: 100%;
    background: linear-gradient(135deg, #b45309, #f0a500);
    border: none; border-radius: 12px;
    padding: 15px;
    font-family: 'DM Sans', sans-serif;
    font-size: 0.95rem; font-weight: 600;
    color: var(--white); letter-spacing: 0.5px;
    cursor: pointer;
    box-shadow: 0 6px 24px rgba(240,165,0,0.35);
    transition: transform 0.25s ease, box-shadow 0.25s ease, filter 0.25s ease;
  }
  .btn-wrap input[type="submit"]:hover {
    transform: translateY(-2px);
    box-shadow: 0 12px 36px rgba(240,165,0,0.45);
    filter: brightness(1.08);
  }
  .btn-wrap input[type="submit"]:active { transform: translateY(0); }

  /* MESSAGE */
  .msg-wrap {
    margin-top: 18px; min-height: 22px;
    text-align: center;
    animation: fadeUp 0.5s ease 1.05s both;
  }
  .msg-wrap span { font-size: 0.82rem; color: var(--danger); letter-spacing: 0.2px; }

  /* DIVIDER */
  .divider {
    display: flex; align-items: center; gap: 12px;
    margin: 28px 0 20px;
    animation: fadeUp 0.6s ease 1.1s both;
  }
  .divider::before, .divider::after {
    content: ''; flex: 1;
    height: 1px; background: var(--glass-border);
  }
  .divider span { font-size: 0.7rem; color: rgba(255,255,255,0.25); white-space: nowrap; }

  .back-link {
    display: block; text-align: center;
    font-size: 0.8rem; color: rgba(255,255,255,0.4);
    text-decoration: none;
    transition: color 0.2s;
    animation: fadeUp 0.6s ease 1.15s both;
  }
  .back-link:hover { color: var(--teal-light); }

  /* FOOTER */
  .footer {
    position: relative; z-index: 5;
    text-align: center; padding: 20px;
    font-size: 0.68rem; color: rgba(255,255,255,0.18);
    letter-spacing: 1px;
    border-top: 1px solid var(--glass-border);
  }

  @keyframes fadeUp {
    from { opacity: 0; transform: translateY(18px); }
    to   { opacity: 1; transform: translateY(0); }
  }

  @media (max-width: 500px) {
    .nav { padding: 16px 20px; }
    .login-card { padding: 36px 24px 32px; border-radius: 20px; }
  }
</style>
</head>
<body>
<div class="particles">
  <div class="particle"></div><div class="particle"></div>
  <div class="particle"></div><div class="particle"></div>
  <div class="particle"></div>
</div>

<form id="form1" runat="server">

  <nav class="nav">
    <a href="Home.aspx" class="nav-logo">
      <div class="nav-icon">✚</div>
      <div class="nav-title">
        Smart Hospital
        <span>Appointment System</span>
      </div>
    </a>
    <a href="Home.aspx" class="nav-back">← Back to Home</a>
  </nav>

  <div class="page">
    <div class="login-card">

      <div class="card-badge">🔐</div>
      <h2 class="card-title">Admin Portal</h2>
      <p class="card-subtitle">Restricted access — authorised staff only</p>

      <div class="field">
        <label class="field-label" for="txtUser">Username</label>
        <div class="field-wrap">
          <span class="field-icon">👤</span>
          <asp:TextBox ID="txtUser" runat="server" placeholder="Enter admin username"></asp:TextBox>
        </div>
      </div>

      <div class="field">
        <label class="field-label" for="txtPass">Password</label>
        <div class="field-wrap">
          <span class="field-icon">🔒</span>
          <asp:TextBox ID="txtPass" runat="server" TextMode="Password" placeholder="Enter password"></asp:TextBox>
        </div>
      </div>

      <div class="btn-wrap">
        <asp:Button ID="btnLogin" runat="server" Text="Sign In to Admin Portal" OnClick="btnLogin_Click" />
      </div>

      <div class="msg-wrap">
        <asp:Label ID="lblMsg" runat="server"></asp:Label>
      </div>

      <div class="divider"><span>or</span></div>
      <a href="Home.aspx" class="back-link">← Return to main home page</a>

    </div>
  </div>

  <footer class="footer">
    © 2024 Smart Hospital System &nbsp;·&nbsp; Admin Access Only
  </footer>

</form>
</body>
</html>
