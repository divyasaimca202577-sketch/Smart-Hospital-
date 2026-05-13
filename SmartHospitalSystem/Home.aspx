<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="SmartHospitalSystem.Home" %>
<!DOCTYPE html>
<html>
<head runat="server">
<title>Smart Hospital Appointment System</title>
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
<style>
  :root {
    --navy: #0a1628;
    --teal: #0e7490;
    --teal-light: #22d3ee;
    --accent: #06b6d4;
    --gold: #f0a500;
    --white: #ffffff;
    --soft: #e0f2fe;
    --glass: rgba(255,255,255,0.07);
    --glass-border: rgba(255,255,255,0.13);
  }

  *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

  body {
    font-family: 'DM Sans', sans-serif;
    background: var(--navy);
    min-height: 100vh;
    overflow-x: hidden;
    color: var(--white);
  }

  /* Animated background */
  body::before {
    content: '';
    position: fixed;
    inset: 0;
    background:
      radial-gradient(ellipse 80% 60% at 10% 20%, rgba(14,116,144,0.35) 0%, transparent 60%),
      radial-gradient(ellipse 60% 50% at 90% 80%, rgba(6,182,212,0.18) 0%, transparent 55%),
      radial-gradient(ellipse 40% 40% at 50% 50%, rgba(240,165,0,0.07) 0%, transparent 60%);
    z-index: 0;
    animation: bgPulse 8s ease-in-out infinite alternate;
  }

  @keyframes bgPulse {
    0%   { opacity: 1; transform: scale(1); }
    100% { opacity: 0.7; transform: scale(1.03); }
  }

  /* Floating particles */
  .particles {
    position: fixed;
    inset: 0;
    z-index: 0;
    pointer-events: none;
    overflow: hidden;
  }
  .particle {
    position: absolute;
    border-radius: 50%;
    background: rgba(34,211,238,0.15);
    animation: float linear infinite;
  }
  .particle:nth-child(1)  { width:6px;  height:6px;  left:10%; animation-duration:14s; animation-delay:0s;   top:100%; }
  .particle:nth-child(2)  { width:4px;  height:4px;  left:25%; animation-duration:18s; animation-delay:2s;   top:100%; }
  .particle:nth-child(3)  { width:8px;  height:8px;  left:40%; animation-duration:12s; animation-delay:5s;   top:100%; background:rgba(240,165,0,0.18); }
  .particle:nth-child(4)  { width:3px;  height:3px;  left:60%; animation-duration:20s; animation-delay:1s;   top:100%; }
  .particle:nth-child(5)  { width:5px;  height:5px;  left:75%; animation-duration:16s; animation-delay:7s;   top:100%; }
  .particle:nth-child(6)  { width:7px;  height:7px;  left:88%; animation-duration:13s; animation-delay:3s;   top:100%; background:rgba(240,165,0,0.12); }

  @keyframes float {
    0%   { transform: translateY(0) rotate(0deg); opacity: 0; }
    10%  { opacity: 1; }
    90%  { opacity: 0.6; }
    100% { transform: translateY(-110vh) rotate(360deg); opacity: 0; }
  }

  /* ── NAV ── */
  .nav {
    position: relative;
    z-index: 10;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 22px 48px;
    border-bottom: 1px solid var(--glass-border);
    backdrop-filter: blur(12px);
    background: rgba(10,22,40,0.6);
    animation: slideDown 0.7s ease both;
  }

  @keyframes slideDown {
    from { transform: translateY(-30px); opacity: 0; }
    to   { transform: translateY(0);     opacity: 1; }
  }

  .nav-logo {
    display: flex;
    align-items: center;
    gap: 14px;
  }

  .nav-icon {
    width: 42px;
    height: 42px;
    background: linear-gradient(135deg, var(--teal), var(--accent));
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 20px;
    box-shadow: 0 4px 18px rgba(6,182,212,0.4);
  }

  .nav-title {
    font-family: 'Playfair Display', serif;
    font-size: 1.15rem;
    font-weight: 700;
    letter-spacing: 0.5px;
    color: var(--white);
    line-height: 1.2;
  }

  .nav-title span {
    display: block;
    font-family: 'DM Sans', sans-serif;
    font-size: 0.68rem;
    font-weight: 400;
    color: var(--teal-light);
    letter-spacing: 2.5px;
    text-transform: uppercase;
  }

  .nav-badge {
    background: var(--glass);
    border: 1px solid var(--glass-border);
    border-radius: 20px;
    padding: 6px 16px;
    font-size: 0.75rem;
    color: var(--teal-light);
    letter-spacing: 1px;
    text-transform: uppercase;
  }

  /* ── MAIN ── */
  .main {
    position: relative;
    z-index: 5;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    min-height: calc(100vh - 88px);
    padding: 60px 24px 80px;
    text-align: center;
  }

  /* Decorative ring */
  .ring {
    position: absolute;
    border-radius: 50%;
    border: 1px solid rgba(6,182,212,0.12);
    pointer-events: none;
    animation: ringPulse 4s ease-in-out infinite;
  }
  .ring-1 { width: 460px; height: 460px; animation-delay: 0s; }
  .ring-2 { width: 640px; height: 640px; border-color: rgba(6,182,212,0.07); animation-delay: 1s; }
  .ring-3 { width: 820px; height: 820px; border-color: rgba(6,182,212,0.04); animation-delay: 2s; }

  @keyframes ringPulse {
    0%, 100% { transform: scale(1); opacity: 1; }
    50%       { transform: scale(1.03); opacity: 0.6; }
  }

 

  .tagline {
    font-family: 'DM Sans', sans-serif;
    font-size: 0.72rem;
    font-weight: 600;
    letter-spacing: 4px;
    text-transform: uppercase;
    color: var(--teal-light);
    margin-bottom: 18px;
    animation: fadeUp 0.8s ease 0.35s both;
  }

  .headline {
    font-family: 'Playfair Display', serif;
    font-size: clamp(2.6rem, 5vw, 4rem);
    font-weight: 700;
    line-height: 1.1;
    color: var(--white);
    margin-bottom: 22px;
    animation: fadeUp 0.8s ease 0.45s both;
  }

  .headline em {
    font-style: italic;
    background: linear-gradient(90deg, var(--teal-light), var(--gold));
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
  }

  .subtext {
    font-size: 1rem;
    font-weight: 300;
    color: rgba(255,255,255,0.55);
    max-width: 480px;
    line-height: 1.7;
    margin-bottom: 56px;
    animation: fadeUp 0.8s ease 0.55s both;
  }

  /* ── CARDS ── */
  .cards {
    display: flex;
    gap: 20px;
    justify-content: center;
    flex-wrap: wrap;
    animation: fadeUp 0.8s ease 0.7s both;
  }

  .card {
    position: relative;
    width: 200px;
    background: var(--glass);
    border: 1px solid var(--glass-border);
    border-radius: 20px;
    padding: 32px 24px 28px;
    text-decoration: none;
    color: var(--white);
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 14px;
    backdrop-filter: blur(16px);
    transition: transform 0.35s cubic-bezier(.23,1,.32,1),
                box-shadow 0.35s ease,
                border-color 0.35s ease,
                background 0.35s ease;
    overflow: hidden;
  }

  .card::before {
    content: '';
    position: absolute;
    inset: 0;
    background: linear-gradient(135deg, rgba(6,182,212,0.12) 0%, transparent 60%);
    opacity: 0;
    transition: opacity 0.35s ease;
    border-radius: 20px;
  }

  .card:hover {
    transform: translateY(-10px) scale(1.03);
    border-color: rgba(6,182,212,0.5);
    box-shadow: 0 24px 60px rgba(6,182,212,0.2), 0 0 0 1px rgba(6,182,212,0.15);
    background: rgba(255,255,255,0.1);
  }

  .card:hover::before { opacity: 1; }

  .card-icon {
    width: 56px;
    height: 56px;
    border-radius: 16px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 26px;
    transition: transform 0.35s ease;
  }

  .card:hover .card-icon { transform: scale(1.15) rotate(-5deg); }

  .card-icon-1 { background: linear-gradient(135deg, #0e7490, #22d3ee); box-shadow: 0 6px 20px rgba(34,211,238,0.35); }
  .card-icon-2 { background: linear-gradient(135deg, #0369a1, #38bdf8); box-shadow: 0 6px 20px rgba(56,189,248,0.35); }
  .card-icon-3 { background: linear-gradient(135deg, #b45309, #f0a500); box-shadow: 0 6px 20px rgba(240,165,0,0.35); }

  .card-label {
    font-size: 0.88rem;
    font-weight: 600;
    letter-spacing: 0.3px;
    text-align: center;
    line-height: 1.3;
  }

  .card-sub {
    font-size: 0.70rem;
    color: rgba(255,255,255,0.45);
    letter-spacing: 0.5px;
    text-align: center;
  }

  .card-arrow {
    margin-top: 4px;
    font-size: 0.75rem;
    color: var(--teal-light);
    opacity: 0;
    transform: translateX(-4px);
    transition: opacity 0.3s ease, transform 0.3s ease;
  }

  .card:hover .card-arrow { opacity: 1; transform: translateX(0); }

  /* ── STATS ── */
  .stats {
    display: flex;
    gap: 48px;
    margin-top: 64px;
    animation: fadeUp 0.8s ease 0.85s both;
    flex-wrap: wrap;
    justify-content: center;
  }

  .stat {
    text-align: center;
  }

  .stat-num {
    font-family: 'Playfair Display', serif;
    font-size: 1.8rem;
    font-weight: 700;
    color: var(--teal-light);
    line-height: 1;
  }

  .stat-label {
    font-size: 0.68rem;
    color: rgba(255,255,255,0.38);
    letter-spacing: 2px;
    text-transform: uppercase;
    margin-top: 4px;
  }

  .stat-divider {
    width: 1px;
    background: var(--glass-border);
    align-self: stretch;
  }

  /* ── FOOTER ── */
  .footer {
    position: relative;
    z-index: 5;
    text-align: center;
    padding: 24px;
    font-size: 0.7rem;
    color: rgba(255,255,255,0.2);
    letter-spacing: 1px;
    border-top: 1px solid var(--glass-border);
  }

  @keyframes fadeUp {
    from { opacity: 0; transform: translateY(28px); }
    to   { opacity: 1; transform: translateY(0); }
  }

  /* Responsive */
  @media (max-width: 600px) {
    .nav { padding: 18px 20px; }
    .nav-badge { display: none; }
    .ring-2, .ring-3 { display: none; }
    .stats { gap: 28px; }
    .stat-divider { display: none; }
    .cards { gap: 14px; }
    .card { width: 160px; padding: 24px 16px 20px; }
  }
</style>
</head>
<body>
<div class="particles">
  <div class="particle"></div>
  <div class="particle"></div>
  <div class="particle"></div>
  <div class="particle"></div>
  <div class="particle"></div>
  <div class="particle"></div>
</div>

<form id="form1" runat="server">

  <!-- NAV -->
  <nav class="nav">
    <div class="nav-logo">
      <div class="nav-icon">✚</div>
      <div class="nav-title">
        Smart Hospital
        <span>Appointment System</span>
      </div>
    </div>
    <div class="nav-badge">Est. 2024</div>
  </nav>

  <!-- MAIN HERO -->
  <main class="main">
    <div class="ring ring-1"></div>
    <div class="ring ring-2"></div>
    <div class="ring ring-3"></div>

    <div class="cross-symbol">
      <div class="glow"></div>
    </div>

    <p class="tagline">Advanced Healthcare Management</p>

    <h1 class="headline">
      Your Health,<br>Our <em>Priority</em>
    </h1>

    <p class="subtext">
      Book appointments, manage your health records, and connect with our team of specialists — all in one seamless platform.
    </p>

    <div class="cards">
      <a href="PatientRegister.aspx" class="card">
        <div class="card-icon card-icon-1">🏥</div>
        <div class="card-label">Patient<br>Register</div>
        <div class="card-sub">New patient? Start here</div>
        <div class="card-arrow">→ Get Started</div>
      </a>

      <a href="PatientLogin.aspx" class="card">
        <div class="card-icon card-icon-2">👤</div>
        <div class="card-label">Patient<br>Login</div>
        <div class="card-sub">Access your account</div>
        <div class="card-arrow">→ Sign In</div>
      </a>

      <a href="AdminLogin.aspx" class="card">
        <div class="card-icon card-icon-3">🔐</div>
        <div class="card-label">Admin<br>Login</div>
        <div class="card-sub">Staff & management</div>
        <div class="card-arrow">→ Enter Portal</div>
      </a>
    </div>

    <div class="stats">
      <div class="stat">
        <div class="stat-num">500+</div>
        <div class="stat-label">Doctors</div>
      </div>
      <div class="stat-divider"></div>
      <div class="stat">
        <div class="stat-num">24/7</div>
        <div class="stat-label">Support</div>
      </div>
      <div class="stat-divider"></div>
      <div class="stat">
        <div class="stat-num">50k+</div>
        <div class="stat-label">Patients Served</div>
      </div>
      <div class="stat-divider"></div>
      <div class="stat">
        <div class="stat-num">98%</div>
        <div class="stat-label">Satisfaction</div>
      </div>
    </div>
  </main>

  <footer class="footer">
    © 2024 Smart Hospital System &nbsp;·&nbsp; All Rights Reserved
  </footer>

</form>
</body>
</html>

