<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MoneyTrail - Home Page</title>
    <!-- Font Awesome 6 (free) for clean icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!-- Google Font: Inter (modern sans) -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:opsz,wght@14..32,400;14..32,500;14..32,600;14..32,700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', system-ui, -apple-system, sans-serif;
            background: #f3f5f9;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 1.5rem;
            color: #1a2639;
        }

        /* main card – home page ui */
        .home-container {
            max-width: 1280px;
            width: 100%;
            background-color: #ffffff;
            border-radius: 2.5rem;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            transition: all 0.2s ease;
        }

        /* content wrapper (no sidebar — pure customer home) */
        .home-content {
            padding: 2rem 2.5rem 2.5rem 2.5rem;
        }

        /* ----- header section ----- */
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 1.5rem;
            margin-bottom: 2.2rem;
        }

        .logo-area {
            display: flex;
            align-items: center;
            gap: 0.6rem;
        }

        .logo-icon {
            background: linear-gradient(145deg, #1e3c72, #2a5298);
            width: 42px;
            height: 42px;
            border-radius: 14px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.7rem;
            box-shadow: 0 8px 16px -6px rgba(30, 60, 114, 0.25);
        }

        .logo-text h1 {
            font-size: 1.8rem;
            font-weight: 700;
            letter-spacing: -0.02em;
            background: linear-gradient(135deg, #1e2b4f, #2c3e6e);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .logo-text span {
            font-size: 0.8rem;
            font-weight: 500;
            color: #5b6f9e;
            background: #eef2ff;
            padding: 0.2rem 0.7rem;
            border-radius: 30px;
            margin-left: 0.5rem;
            letter-spacing: normal;
        }

        .header-right {
            display: flex;
            align-items: center;
            gap: 2rem;
        }

        .notification-badge {
            position: relative;
            font-size: 1.5rem;
            color: #415a77;
            cursor: default;
        }

        .dot {
            position: absolute;
            top: 0;
            right: -2px;
            width: 10px;
            height: 10px;
            background: #ef4444;
            border: 2px solid white;
            border-radius: 50%;
        }

        .customer-profile {
            display: flex;
            align-items: center;
            gap: 1rem;
            background: #f8fafd;
            padding: 0.4rem 1.2rem 0.4rem 0.8rem;
            border-radius: 60px;
            border: 1px solid #e6edf4;
        }

        .avatar {
            background: linear-gradient(135deg, #2a5298, #1e3c72);
            width: 44px;
            height: 44px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
            font-size: 1.2rem;
            box-shadow: 0 6px 12px rgba(26, 55, 113, 0.2);
        }

        .profile-text {
            line-height: 1.3;
        }

        .profile-text .greeting {
            font-size: 0.8rem;
            font-weight: 500;
            color: #64748b;
        }

        .profile-text .name {
            font-weight: 700;
            font-size: 1rem;
            color: #0f1829;
        }

        /* ----- welcome banner ----- */
        .welcome-block {
            background: linear-gradient(105deg, #182848 0%, #2b4b8f 100%);
            border-radius: 2rem;
            padding: 1.8rem 2.2rem;
            margin-bottom: 2.5rem;
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: space-between;
            color: white;
            box-shadow: 0 16px 30px -10px #1f3a6b;
        }

        .welcome-text h2 {
            font-size: 1.9rem;
            font-weight: 600;
            letter-spacing: -0.02em;
            margin-bottom: 0.3rem;
        }

        .welcome-text p {
            font-size: 0.95rem;
            opacity: 0.8;
            display: flex;
            align-items: center;
            gap: 0.4rem;
        }

        .welcome-text p i {
            font-size: 0.9rem;
        }

        .welcome-action {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(10px);
            padding: 0.7rem 1.8rem;
            border-radius: 50px;
            font-weight: 600;
            font-size: 0.95rem;
            border: 1px solid rgba(255,255,255,0.3);
            transition: 0.15s;
            cursor: default;
            display: flex;
            align-items: center;
            gap: 0.6rem;
        }

        .welcome-action i {
            font-size: 1rem;
        }

        /* ----- summary cards (4) ----- */
        .stat-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 1.5rem;
            margin-bottom: 2.5rem;
        }

        .stat-card {
            background: white;
            border-radius: 2rem;
            padding: 1.6rem 1.5rem;
            box-shadow: 0 10px 25px -12px rgba(0, 0, 0, 0.1);
            border: 1px solid #edf2f9;
            transition: all 0.2s;
        }

        .stat-card:hover {
            border-color: #cbd5e1;
            box-shadow: 0 20px 30px -15px rgba(42, 82, 152, 0.15);
        }

        .stat-title {
            font-size: 0.85rem;
            text-transform: uppercase;
            letter-spacing: 0.02em;
            color: #546e7a;
            font-weight: 600;
            margin-bottom: 0.6rem;
            display: flex;
            align-items: center;
            gap: 0.3rem;
        }

        .stat-number {
            font-size: 2.2rem;
            font-weight: 700;
            color: #0b1e3a;
            line-height: 1.2;
            margin-bottom: 0.2rem;
        }

        .stat-trend {
            font-size: 0.8rem;
            display: flex;
            align-items: center;
            gap: 0.25rem;
            color: #2e7d32;
            font-weight: 500;
        }

        .stat-trend.down {
            color: #b91c1c;
        }

        .stat-icon {
            float: right;
            font-size: 2.2rem;
            color: #1f3a6b;
            opacity: 0.2;
            margin-top: -0.5rem;
        }

        /* ----- main dashboard grid: left (transactions) + right (insights) ----- */
        .dashboard-two-col {
            display: grid;
            grid-template-columns: 1.6fr 1fr;
            gap: 1.8rem;
            margin-bottom: 2rem;
        }

        /* recent transactions card */
        .recent-card {
            background: #ffffff;
            border-radius: 2rem;
            padding: 1.6rem 1.4rem 1.8rem 1.4rem;
            border: 1px solid #eef3f8;
            box-shadow: 0 6px 16px -10px rgba(0,20,40,0.1);
        }

        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.3rem;
        }

        .card-header h3 {
            font-weight: 700;
            font-size: 1.2rem;
            color: #14273e;
        }

        .card-header a {
            color: #2a5298;
            font-weight: 600;
            font-size: 0.9rem;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 0.3rem;
        }

        .transaction-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0.9rem 0;
            border-bottom: 1px solid #f0f4fa;
        }

        .transaction-item:last-child {
            border-bottom: none;
        }

        .tx-left {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .tx-icon {
            width: 44px;
            height: 44px;
            background: #ecf3ff;
            border-radius: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #1f3a6b;
            font-size: 1.3rem;
        }

        .tx-details h4 {
            font-weight: 700;
            font-size: 1rem;
            margin-bottom: 0.2rem;
            color: #14273e;
        }

        .tx-details .tx-meta {
            font-size: 0.8rem;
            color: #6a7f9f;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .tx-amount {
            font-weight: 700;
            font-size: 1.1rem;
        }

        .tx-amount.positive {
            color: #1f7b4d;
        }

        .tx-amount.negative {
            color: #b12e3c;
        }

        /* right panel – insights & quick actions */
        .insights-card {
            background: #ffffff;
            border-radius: 2rem;
            padding: 1.6rem 1.4rem 1.8rem 1.4rem;
            border: 1px solid #eef3f8;
            box-shadow: 0 6px 16px -10px rgba(0,20,40,0.1);
            margin-bottom: 1.8rem;
        }

        .budget-progress {
            margin: 1.2rem 0 1.8rem 0;
        }

        .budget-row {
            display: flex;
            justify-content: space-between;
            font-size: 0.85rem;
            font-weight: 600;
            color: #415a77;
            margin-bottom: 0.4rem;
        }

        .progress-bg {
            height: 10px;
            background: #e3eaf2;
            border-radius: 20px;
            margin-bottom: 1rem;
        }

        .progress-fill {
            width: 68%;
            height: 10px;
            background: linear-gradient(90deg, #2a5298, #4b7bc1);
            border-radius: 20px;
        }

        .quick-actions {
            display: flex;
            flex-direction: column;
            gap: 0.8rem;
            margin-top: 1.4rem;
        }

        .action-btn {
            background: #f5f9ff;
            border: 1px solid #dde7f5;
            border-radius: 18px;
            padding: 0.9rem 1.2rem;
            display: flex;
            align-items: center;
            gap: 1rem;
            font-weight: 600;
            color: #14273e;
            transition: 0.15s;
            cursor: default;
        }

        .action-btn i {
            font-size: 1.2rem;
            color: #2a5298;
            width: 28px;
        }

        .action-btn:hover {
            background: #e9f0fe;
            border-color: #aac3e0;
        }

        .spending-category {
            margin-top: 1.8rem;
        }
        .category-item {
            display: flex;
            justify-content: space-between;
            font-size: 0.9rem;
            padding: 0.5rem 0;
        }
        .category-name i {
            width: 22px;
            color: #2a5298;
        }

        /* bottom shortcuts (cards, etc) */
        .extra-features {
            display: flex;
            gap: 1.5rem;
            flex-wrap: wrap;
            margin-top: 1rem;
        }
        .feature-pill {
            background: #f2f6fc;
            padding: 0.8rem 1.5rem;
            border-radius: 50px;
            font-size: 0.9rem;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 0.7rem;
            color: #1d3d6d;
            border: 1px solid transparent;
            transition: 0.1s;
            cursor: default;
        }
        .feature-pill i {
            font-size: 1rem;
        }

        hr {
            border: none;
            border-top: 2px solid #ecf2f9;
            margin: 1.8rem 0 1rem 0;
        }

        .footer-note {
            font-size: 0.85rem;
            color: #74869c;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        /* responsiveness */
        @media (max-width: 950px) {
            .stat-grid { grid-template-columns: repeat(2, 1fr); }
            .dashboard-two-col { grid-template-columns: 1fr; }
            .home-content { padding: 1.75rem; }
        }
        @media (max-width: 550px) {
            .stat-grid { grid-template-columns: 1fr; }
            .page-header { flex-direction: column; align-items: start; }
        }
    </style>
</head>
<body>
    <div class="home-container">
        <div class="home-content">
            <!-- header with logo & customer profile -->
            <div class="page-header">
                <div class="logo-area">
                    <div class="logo-icon">
                        <i class="fas fa-wallet"></i>
                    </div>
                    <div class="logo-text">
                        <h1>MoneyTrail <span>customer</span></h1>
                    </div>
                </div>
                <div class="header-right">
                    <div class="notification-badge">
                        <i class="far fa-bell"></i>
                        <span class="dot"></span>
                    </div>
                    <div class="customer-profile">
                        <div class="avatar">JD</div>
                        <div class="profile-text">
                            <div class="greeting">Welcome back</div>
                            <div class="name">Jessica D.</div>
                        </div>
                        <i class="fas fa-chevron-down" style="color:#9aaec9; font-size:0.8rem; margin-left:0.2rem;"></i>
                    </div>
                </div>
            </div>

            <!-- hello banner + quick insight -->
            <div class="welcome-block">
                <div class="welcome-text">
                    <h2>Good evening, Jessica ✨</h2>
                    <p><i class="fas fa-calendar-alt"></i> Mar 7, 2026 · all accounts healthy</p>
                </div>
                <div class="welcome-action">
                    <i class="fas fa-plus-circle"></i>  Add expense
                </div>
            </div>

            <!-- 4 stat cards: balance, income, spending, savings -->
            <div class="stat-grid">
                <div class="stat-card">
                    <div class="stat-title"><i class="fas fa-scale-balanced" style="color:#1e3c72;"></i> Total balance</div>
                    <div class="stat-number">$14,280.45</div>
                    <div class="stat-trend"><i class="fas fa-arrow-up"></i> +2.4% from last month</div>
                    <i class="fas fa-piggy-bank stat-icon"></i>
                </div>
                <div class="stat-card">
                    <div class="stat-title"><i class="fas fa-arrow-down-wide-narrow"></i> Monthly income</div>
                    <div class="stat-number">$5,420.00</div>
                    <div class="stat-trend"><i class="fas fa-arrow-up"></i> +5% vs Feb</div>
                    <i class="fas fa-circle-dollar stat-icon"></i>
                </div>
                <div class="stat-card">
                    <div class="stat-title"><i class="fas fa-cart-shopping"></i> Spending</div>
                    <div class="stat-number">$2,830.50</div>
                    <div class="stat-trend down"><i class="fas fa-arrow-down"></i> -8% vs budget</div>
                    <i class="fas fa-credit-card stat-icon"></i>
                </div>
                <div class="stat-card">
                    <div class="stat-title"><i class="fas fa-sack-dollar"></i> Savings</div>
                    <div class="stat-number">$3,940.20</div>
                    <div class="stat-trend"><i class="fas fa-arrow-up"></i> +12% this year</div>
                    <i class="fas fa-coins stat-icon"></i>
                </div>
            </div>

            <!-- 2‑col main area: recent transactions + insights / quick actions -->
            <div class="dashboard-two-col">
                <!-- left: recent transactions -->
                <div class="recent-card">
                    <div class="card-header">
                        <h3><i class="far fa-clock" style="margin-right: 6px;"></i> Recent activity</h3>
                        <a href="#">View all <i class="fas fa-arrow-right"></i></a>
                    </div>
                    <div class="transaction-item">
                        <div class="tx-left">
                            <div class="tx-icon"><i class="fas fa-bag-shopping"></i></div>
                            <div class="tx-details">
                                <h4>Grocery Store</h4>
                                <div class="tx-meta"><span>Mar 6</span> <span>·</span> <span>Food</span></div>
                            </div>
                        </div>
                        <div class="tx-amount negative">-$86.42</div>
                    </div>
                    <div class="transaction-item">
                        <div class="tx-left">
                            <div class="tx-icon"><i class="fas fa-mug-saucer"></i></div>
                            <div class="tx-details">
                                <h4>Coffee & Bagel</h4>
                                <div class="tx-meta"><span>Mar 6</span> <span>·</span> <span>Dining</span></div>
                            </div>
                        </div>
                        <div class="tx-amount negative">-$12.50</div>
                    </div>
                    <div class="transaction-item">
                        <div class="tx-left">
                            <div class="tx-icon"><i class="fas fa-bolt"></i></div>
                            <div class="tx-details">
                                <h4>Electric Bill</h4>
                                <div class="tx-meta"><span>Mar 5</span> <span>·</span> <span>Utilities</span></div>
                            </div>
                        </div>
                        <div class="tx-amount negative">-$95.00</div>
                    </div>
                    <div class="transaction-item">
                        <div class="tx-left">
                            <div class="tx-icon"><i class="fas fa-money-bill-transfer"></i></div>
                            <div class="tx-details">
                                <h4>Salary deposit</h4>
                                <div class="tx-meta"><span>Mar 3</span> <span>·</span> <span>Income</span></div>
                            </div>
                        </div>
                        <div class="tx-amount positive">+$2,710.00</div>
                    </div>
                    <div class="transaction-item">
                        <div class="tx-left">
                            <div class="tx-icon"><i class="fas fa-film"></i></div>
                            <div class="tx-details">
                                <h4>Cinema tickets</h4>
                                <div class="tx-meta"><span>Mar 2</span> <span>·</span> <span>Entertainment</span></div>
                            </div>
                        </div>
                        <div class="tx-amount negative">-$32.40</div>
                    </div>
                </div>

                <!-- right panel: insights and actions -->
                <div>
                    <div class="insights-card">
                        <div style="display: flex; justify-content: space-between;">
                            <h3><i class="fas fa-chart-pie" style="margin-right: 6px;"></i> Monthly budget</h3>
                            <span style="background:#d4e2fc; padding:0.2rem 0.9rem; border-radius:40px; font-size:0.75rem; font-weight:600;">68% used</span>
                        </div>
                        <div class="budget-progress">
                            <div class="budget-row">
                                <span>$2,830 spent</span>
                                <span>$4,200 total</span>
                            </div>
                            <div class="progress-bg">
                                <div class="progress-fill" style="width:68%"></div>
                            </div>
                        </div>
                        <div class="spending-category">
                            <div class="category-item"><span class="category-name"><i class="fas fa-house-chimney"></i> Housing</span> <span><b>$980</b> / $1,200</span></div>
                            <div class="category-item"><span class="category-name"><i class="fas fa-utensils"></i> Food</span> <span><b>$520</b> / $600</span></div>
                            <div class="category-item"><span class="category-name"><i class="fas fa-car"></i> Transport</span> <span><b>$212</b> / $300</span></div>
                        </div>
                    </div>

                    <div class="insights-card" style="margin-bottom:0;">
                        <h3 style="margin-bottom: 0.8rem;"><i class="fas fa-bolt"></i> Quick actions</h3>
                        <div class="quick-actions">
                            <div class="action-btn"><i class="fas fa-receipt"></i> Scan receipt</div>
                            <div class="action-btn"><i class="fas fa-chart-simple"></i> Analytics report</div>
                            <div class="action-btn"><i class="fas fa-wallet"></i> Transfer money</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- extra mini features / cards (new ui details) -->
            <div class="extra-features">
                <div class="feature-pill"><i class="fas fa-credit-card"></i>  •• 4820  ••  active</div>
                <div class="feature-pill"><i class="fas fa-sack-dollar"></i>  goal: summer trip  <i class="fas fa-location-dot" style="opacity:0.7;"></i></div>
                <div class="feature-pill"><i class="fas fa-arrow-trend-up"></i>  spending forecast</div>
            </div>

            <hr>
            <!-- subtle footer / customer home note (Home.jsp mood) -->
            <div class="footer-note">
                <span><i class="far fa-check-circle" style="color:#3b9e6d;"></i> All accounts synced · 2min ago</span>
                <span>🔒 <span style="font-weight:500;">MoneyTrail · customer home (new UI)</span></span>
            </div>
        </div> <!-- home-content -->
    </div> <!-- home-container -->
</body>
</html>