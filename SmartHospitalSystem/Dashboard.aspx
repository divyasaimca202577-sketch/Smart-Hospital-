<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="SmartHospitalSystem.Dashboard" %>
<!DOCTYPE html>
<html>
<head runat="server">
<title>Admin Dashboard — Smart Hospital</title>
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">
<style>
  :root {
    --navy: #0a1628;
    --navy-2: #0d1e35;
    --teal: #0e7490;
    --teal-light: #22d3ee;
    --accent: #06b6d4;
    --gold: #f0a500;
    --gold-dark: #b45309;
    --white: #ffffff;
    --glass: rgba(255,255,255,0.065);
    --glass-border: rgba(255,255,255,0.12);
    --success: #34d399;
    --warning: #fbbf24;
    --danger: #f87171;
    --purple: #a78bfa;
  }

  *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

  body {
    font-family: 'DM Sans', sans-serif;
    background: var(--navy);
    min-height: 100vh;
    color: var(--white);
    display: flex;
    flex-direction: column;
    overflow-x: hidden;
  }

  body::before {
    content: '';
    position: fixed; inset: 0;
    background:
      radial-gradient(ellipse 65% 55% at 0%   10%, rgba(14,116,144,0.30) 0%, transparent 60%),
      radial-gradient(ellipse 50% 45% at 100% 90%, rgba(6,182,212,0.14)  0%, transparent 55%),
      radial-gradient(ellipse 40% 40% at 55%  50%, rgba(167,139,250,0.05) 0%, transparent 60%);
    z-index: 0;
    animation: bgPulse 11s ease-in-out infinite alternate;
  }
  @keyframes bgPulse {
    0%   { opacity: 1;   transform: scale(1); }
    100% { opacity: 0.7; transform: scale(1.02); }
  }

  .particles { position: fixed; inset: 0; z-index: 0; pointer-events: none; overflow: hidden; }
  .particle  { position: absolute; border-radius: 50%; background: rgba(34,211,238,0.13); animation: floatUp linear infinite; }
  .particle:nth-child(1) { width:4px; height:4px; left:6%;  animation-duration:16s; animation-delay:0s;  top:100%; }
  .particle:nth-child(2) { width:3px; height:3px; left:18%; animation-duration:21s; animation-delay:4s;  top:100%; }
  .particle:nth-child(3) { width:6px; height:6px; left:38%; animation-duration:14s; animation-delay:2s;  top:100%; background:rgba(240,165,0,0.16); }
  .particle:nth-child(4) { width:3px; height:3px; left:57%; animation-duration:19s; animation-delay:6s;  top:100%; }
  .particle:nth-child(5) { width:5px; height:5px; left:74%; animation-duration:15s; animation-delay:1s;  top:100%; background:rgba(167,139,250,0.18); }
  .particle:nth-child(6) { width:4px; height:4px; left:89%; animation-duration:18s; animation-delay:5s;  top:100%; }
  @keyframes floatUp {
    0%   { transform: translateY(0) rotate(0deg);   opacity: 0; }
    10%  { opacity: 1; } 90% { opacity: 0.4; }
    100% { transform: translateY(-110vh) rotate(360deg); opacity: 0; }
  }

  /* ── NAV ── */
  .nav {
    position: relative; z-index: 10;
    display: flex; align-items: center; justify-content: space-between;
    padding: 18px 48px;
    border-bottom: 1px solid var(--glass-border);
    backdrop-filter: blur(14px);
    background: rgba(10,22,40,0.65);
    animation: slideDown 0.6s ease both;
  }
  @keyframes slideDown {
    from { transform: translateY(-22px); opacity: 0; }
    to   { transform: translateY(0);     opacity: 1; }
  }
  .nav-logo { display: flex; align-items: center; gap: 13px; text-decoration: none; }
  .nav-icon {
    width: 36px; height: 36px;
    background: linear-gradient(135deg, var(--teal), var(--accent));
    border-radius: 10px;
    display: flex; align-items: center; justify-content: center;
    font-size: 16px;
    box-shadow: 0 4px 14px rgba(6,182,212,0.38);
  }
  .nav-title { font-family: 'Playfair Display', serif; font-size: 1rem; font-weight: 700; color: var(--white); line-height: 1.2; }
  .nav-title span { display: block; font-family: 'DM Sans', sans-serif; font-size: 0.62rem; font-weight: 400; color: var(--teal-light); letter-spacing: 2.5px; text-transform: uppercase; }

  .nav-right { display: flex; align-items: center; gap: 14px; }
  .nav-pill {
    background: rgba(240,165,0,0.12);
    border: 1px solid rgba(240,165,0,0.25);
    border-radius: 20px; padding: 5px 14px;
    font-size: 0.72rem; color: var(--gold);
    letter-spacing: 1px; text-transform: uppercase; font-weight: 600;
  }
  .nav-logout {
    background: rgba(248,113,113,0.10);
    border: 1px solid rgba(248,113,113,0.22);
    border-radius: 10px; padding: 8px 18px;
    font-family: 'DM Sans', sans-serif;
    font-size: 0.78rem; font-weight: 600; color: var(--danger);
    cursor: pointer; transition: all 0.22s;
    letter-spacing: 0.3px;
  }
  .nav-logout:hover {
    background: rgba(248,113,113,0.20);
    border-color: rgba(248,113,113,0.45);
    transform: translateY(-1px);
  }

  /* ── PAGE ── */
  .page {
    position: relative; z-index: 5;
    flex: 1; padding: 52px 48px 80px;
    max-width: 1200px; width: 100%; margin: 0 auto;
  }

  /* ── HERO GREETING ── */
  .hero {
    margin-bottom: 48px;
    animation: fadeUp 0.7s ease 0.15s both;
  }
  .hero-eyebrow {
    font-size: 0.68rem; font-weight: 600;
    letter-spacing: 3px; text-transform: uppercase;
    color: var(--teal-light); margin-bottom: 10px;
  }
  .hero h1 {
    font-family: 'Playfair Display', serif;
    font-size: clamp(1.9rem, 3.5vw, 2.8rem);
    font-weight: 700; line-height: 1.15; color: var(--white);
    margin-bottom: 10px;
  }
  .hero h1 em {
    font-style: italic;
    background: linear-gradient(90deg, var(--teal-light), var(--gold));
    -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text;
  }
  .hero p { font-size: 0.88rem; color: rgba(255,255,255,0.42); letter-spacing: 0.2px; }

  /* ── STAT CARDS ── */
  .stats-row {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(190px, 1fr));
    gap: 18px; margin-bottom: 48px;
    animation: fadeUp 0.7s ease 0.3s both;
  }
  .stat-card {
    background: var(--glass);
    border: 1px solid var(--glass-border);
    border-radius: 20px; padding: 26px 22px;
    backdrop-filter: blur(16px);
    position: relative; overflow: hidden;
    transition: transform 0.3s ease, box-shadow 0.3s ease, border-color 0.3s ease;
  }
  .stat-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 18px 48px rgba(0,0,0,0.3);
    border-color: rgba(255,255,255,0.22);
  }
  .stat-card::before {
    content: ''; position: absolute; top: -40px; right: -40px;
    width: 120px; height: 120px; border-radius: 50%;
    pointer-events: none;
  }
  .stat-card.c1::before { background: radial-gradient(circle, rgba(6,182,212,0.18) 0%, transparent 70%); }
  .stat-card.c2::before { background: radial-gradient(circle, rgba(52,211,153,0.16) 0%, transparent 70%); }
  .stat-card.c3::before { background: radial-gradient(circle, rgba(240,165,0,0.15)  0%, transparent 70%); }
  .stat-card.c4::before { background: radial-gradient(circle, rgba(167,139,250,0.15) 0%, transparent 70%); }

  .stat-icon {
    width: 42px; height: 42px; border-radius: 12px;
    display: flex; align-items: center; justify-content: center;
    font-size: 19px; margin-bottom: 16px;
  }
  .stat-card.c1 .stat-icon { background: rgba(6,182,212,0.15);  box-shadow: 0 4px 14px rgba(6,182,212,0.2); }
  .stat-card.c2 .stat-icon { background: rgba(52,211,153,0.13); box-shadow: 0 4px 14px rgba(52,211,153,0.18); }
  .stat-card.c3 .stat-icon { background: rgba(240,165,0,0.13);  box-shadow: 0 4px 14px rgba(240,165,0,0.18); }
  .stat-card.c4 .stat-icon { background: rgba(167,139,250,0.12);box-shadow: 0 4px 14px rgba(167,139,250,0.16); }

  .stat-num {
    font-family: 'Playfair Display', serif;
    font-size: 2rem; font-weight: 700; line-height: 1; margin-bottom: 5px;
  }
  .stat-card.c1 .stat-num { color: var(--teal-light); }
  .stat-card.c2 .stat-num { color: var(--success); }
  .stat-card.c3 .stat-num { color: var(--gold); }
  .stat-card.c4 .stat-num { color: var(--purple); }

  .stat-label { font-size: 0.75rem; color: rgba(255,255,255,0.4); letter-spacing: 0.3px; }
  .stat-trend {
    margin-top: 10px; font-size: 0.68rem; font-weight: 600;
    color: var(--success); letter-spacing: 0.3px;
  }

  /* ── SECTION TITLE ── */
  .section-title {
    font-size: 0.65rem; font-weight: 600;
    letter-spacing: 2.5px; text-transform: uppercase;
    color: var(--teal-light);
    display: flex; align-items: center; gap: 10px;
    margin-bottom: 20px;
  }
  .section-title::after { content: ''; flex: 1; height: 1px; background: var(--glass-border); }

  /* ── ACTION CARDS GRID ── */
  .actions-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
    gap: 20px; margin-bottom: 48px;
    animation: fadeUp 0.7s ease 0.5s both;
  }

  .action-card {
    background: var(--glass);
    border: 1px solid var(--glass-border);
    border-radius: 22px; padding: 32px 28px;
    text-decoration: none; color: var(--white);
    display: flex; flex-direction: column;
    backdrop-filter: blur(16px);
    position: relative; overflow: hidden;
    transition: transform 0.35s cubic-bezier(.23,1,.32,1),
                box-shadow 0.35s ease, border-color 0.35s ease;
  }
  .action-card::before {
    content: ''; position: absolute; inset: 0;
    opacity: 0; border-radius: 22px;
    transition: opacity 0.35s ease;
  }
  .action-card.a1::before { background: linear-gradient(135deg, rgba(6,182,212,0.10), transparent 60%); }
  .action-card.a2::before { background: linear-gradient(135deg, rgba(52,211,153,0.10), transparent 60%); }

  .action-card:hover {
    transform: translateY(-8px) scale(1.01);
    box-shadow: 0 22px 55px rgba(0,0,0,0.32);
  }
  .action-card.a1:hover { border-color: rgba(6,182,212,0.4);  box-shadow: 0 22px 55px rgba(6,182,212,0.14); }
  .action-card.a2:hover { border-color: rgba(52,211,153,0.4); box-shadow: 0 22px 55px rgba(52,211,153,0.12); }
  .action-card:hover::before { opacity: 1; }

  .action-icon {
    width: 54px; height: 54px; border-radius: 16px;
    display: flex; align-items: center; justify-content: center;
    font-size: 24px; margin-bottom: 20px;
    transition: transform 0.3s ease;
  }
  .action-card:hover .action-icon { transform: scale(1.12) rotate(-4deg); }
  .action-card.a1 .action-icon { background: linear-gradient(135deg, var(--teal), var(--accent)); box-shadow: 0 6px 20px rgba(6,182,212,0.35); }
  .action-card.a2 .action-icon { background: linear-gradient(135deg, #047857, #34d399); box-shadow: 0 6px 20px rgba(52,211,153,0.3); }

  .action-title { font-size: 1.1rem; font-weight: 600; margin-bottom: 8px; }
  .action-desc  { font-size: 0.8rem; color: rgba(255,255,255,0.4); line-height: 1.55; flex: 1; }
  .action-arrow {
    margin-top: 22px; font-size: 0.75rem; font-weight: 600;
    letter-spacing: 0.5px; opacity: 0;
    transform: translateX(-6px);
    transition: opacity 0.28s ease, transform 0.28s ease;
  }
  .action-card.a1 .action-arrow { color: var(--teal-light); }
  .action-card.a2 .action-arrow { color: var(--success); }
  .action-card:hover .action-arrow { opacity: 1; transform: translateX(0); }

  /* ── QUICK INFO ── */
  .quick-row {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 14px;
    animation: fadeUp 0.7s ease 0.65s both;
  }
  .quick-chip {
    background: var(--glass); border: 1px solid var(--glass-border);
    border-radius: 14px; padding: 16px 18px;
    display: flex; align-items: center; gap: 12px;
    backdrop-filter: blur(10px);
  }
  .quick-dot { width: 8px; height: 8px; border-radius: 50%; flex-shrink: 0; }
  .quick-chip .qlabel { font-size: 0.74rem; color: rgba(255,255,255,0.38); margin-bottom: 2px; }
  .quick-chip .qval   { font-size: 0.88rem; font-weight: 600; color: var(--white); }

  /* ── FOOTER ── */
  .footer {
    position: relative; z-index: 5;
    text-align: center; padding: 20px;
    font-size: 0.68rem; color: rgba(255,255,255,0.17);
    letter-spacing: 1px;
    border-top: 1px solid var(--glass-border);
  }

  @keyframes fadeUp {
    from { opacity: 0; transform: translateY(22px); }
    to   { opacity: 1; transform: translateY(0); }
  }

  @media (max-width: 640px) {
    .nav  { padding: 14px 18px; }
    .page { padding: 36px 18px 60px; }
    .nav-pill { display: none; }
    .hero h1 { font-size: 1.7rem; }
  }
</style>
</head>
<body>
<div class="particles">
  <div class="particle"></div><div class="particle"></div><div class="particle"></div>
  <div class="particle"></div><div class="particle"></div><div class="particle"></div>
</div>

<form id="form1" runat="server">

  <!-- NAV -->
  <nav class="nav">
    <a href="Home.aspx" class="nav-logo">
      <div class="nav-icon">✚</div>
      <div class="nav-title">
        Smart Hospital
        <span>Appointment System</span>
      </div>
    </a>
    <div class="nav-right">
      <div class="nav-pill">🔐 Admin</div>
      <asp:Button ID="btnLogout" runat="server" Text="⏻  Logout"
        OnClick="btnLogout_Click" CssClass="nav-logout" />
    </div>
  </nav>

  <!-- PAGE -->
  <main class="page">

    <!-- Greeting -->
    <div class="hero">
      <p class="hero-eyebrow">Welcome back, Administrator</p>
      <h1>Admin <em>Dashboard</em></h1>
      <p>Manage your hospital operations from one central place.</p>
    </div>

    <!-- Stat cards (decorative / placeholder — values set server-side if needed) -->
    <div class="stats-row">
      <div class="stat-card c1">
        <div class="stat-icon">👨‍⚕️</div>
        <div class="stat-num">—</div>
        <div class="stat-label">Total Doctors</div>
        <div class="stat-trend">↑ Active staff</div>
      </div>
      <div class="stat-card c2">
        <div class="stat-icon">📋</div>
        <div class="stat-num">—</div>
        <div class="stat-label">Appointments Today</div>
        <div class="stat-trend">↑ Scheduled</div>
      </div>
      <div class="stat-card c3">
        <div class="stat-icon">🧑‍🤝‍🧑</div>
        <div class="stat-num">—</div>
        <div class="stat-label">Registered Patients</div>
        <div class="stat-trend">↑ This month</div>
      </div>
      <div class="stat-card c4">
        <div class="stat-icon">✅</div>
        <div class="stat-num">—</div>
        <div class="stat-label">Completed Visits</div>
        <div class="stat-trend">↑ This week</div>
      </div>
    </div>

    <!-- Action cards -->
    <p class="section-title">Quick Actions</p>
    <div class="actions-grid">

      <a href="ManageDoctors.aspx" class="action-card a1">
        <div class="action-icon">🩺</div>
        <div class="action-title">Manage Doctors</div>
        <div class="action-desc">Add, edit, or remove doctor profiles and their specialisations from the system.</div>
        <div class="action-arrow">→ Open Panel</div>
      </a>

      <a href="ViewAppointments.aspx" class="action-card a2">
        <div class="action-icon">📅</div>
        <div class="action-title">View Appointments</div>
        <div class="action-desc">Browse all scheduled, completed, and pending appointments across the hospital.</div>
        <div class="action-arrow">→ View All</div>
      </a>

    </div>

    <!-- Quick info chips -->
    <p class="section-title">System Status</p>
    <div class="quick-row">
      <div class="quick-chip">
        <div class="quick-dot" style="background:#34d399;box-shadow:0 0 8px rgba(52,211,153,0.5);"></div>
        <div>
          <div class="qlabel">System</div>
          <div class="qval">Online &amp; Running</div>
        </div>
      </div>
      <div class="quick-chip">
        <div class="quick-dot" style="background:#22d3ee;box-shadow:0 0 8px rgba(34,211,238,0.4);"></div>
        <div>
          <div class="qlabel">Booking Portal</div>
          <div class="qval">Active</div>
        </div>
      </div>
      <div class="quick-chip">
        <div class="quick-dot" style="background:#fbbf24;box-shadow:0 0 8px rgba(251,191,36,0.4);"></div>
        <div>
          <div class="qlabel">Support Hours</div>
          <div class="qval">Mon – Sat, 9 AM – 6 PM</div>
        </div>
      </div>
    </div>

  </main>

  <footer class="footer">
    © 2024 Smart Hospital System &nbsp;·&nbsp; Admin Portal
  </footer>

</form>
</body>
</html>