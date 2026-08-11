<!DOCTYPE html>
<html lang="sw">
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<title>BizBook - Mfumo wa Usimamizi wa Biashara</title>
<link rel="preconnect" href="https://fonts.googleapis.com"/>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.1/dist/chart.umd.min.js"></script>
<style>
:root{--bg:#0d0d12;--bg2:#12121a;--bg3:#1a1a26;--bg4:#22222e;--text:#e8e8ed;--text2:#9a9ab0;--text3:#5a5a72;--primary:#6c5ce7;--primary2:#a29bfe;--primary-bg:rgba(108,92,231,.12);--success:#00b894;--success-bg:rgba(0,184,148,.12);--danger:#e74c3c;--danger-bg:rgba(231,76,60,.12);--warning:#f39c12;--warning-bg:rgba(243,156,18,.12);--info:#0984e3;--info-bg:rgba(9,132,227,.12);--border:#2a2a3a;--radius:10px;--shadow:0 4px 24px rgba(0,0,0,.4);--font:'Inter',sans-serif}
*{margin:0;padding:0;box-sizing:border-box}
body{position:relative;min-height:100vh;margin:0;padding:0;background:#0d0d12;color:#fff;overflow-x:hidden;font-family:var(--font)}
body::before{content:"";position:fixed;inset:-120%;z-index:-2;pointer-events:none;background:repeating-radial-gradient(circle at center,transparent 0px,transparent 110px,rgba(255,255,255,.18) 112px,transparent 116px),repeating-linear-gradient(130deg,transparent 0px,transparent 60px,rgba(255,255,255,.9) 61px,rgba(255,255,255,.9) 63px,transparent 65px),repeating-linear-gradient(-45deg,transparent 0px,transparent 120px,rgba(255,255,255,.08) 122px,transparent 126px);opacity:.35;animation:animeSpeed 5s linear infinite;transform-origin:center center;will-change:transform}
body::after{content:"";position:fixed;inset:0;z-index:-1;pointer-events:none;background:radial-gradient(circle at center,rgba(255,255,255,.08),transparent 65%);animation:pulseGlow 4s ease-in-out infinite}
@keyframes animeSpeed{0%{transform:scale(1) rotate(0deg)}100%{transform:scale(1.30) rotate(0deg)}}
@keyframes pulseGlow{0%{opacity:.25}50%{opacity:.45}100%{opacity:.25}}
.container,.main,.wrapper,.app,.dashboard{position:relative;z-index:1}
.card{background:rgba(255,255,255,.05);backdrop-filter:blur(10px);-webkit-backdrop-filter:blur(10px);border:1px solid rgba(255,255,255,.08);border-radius:16px;box-shadow:0 10px 35px rgba(0,0,0,.35)}
button{transition:.3s;cursor:pointer}
button:hover{transform:translateY(-2px);box-shadow:0 10px 25px rgba(255,255,255,.12)}
a{color:var(--primary2);cursor:pointer}
.hidden{display:none!important}
input,select,textarea{font-family:var(--font)}
::-webkit-scrollbar{width:6px;height:6px}
::-webkit-scrollbar-track{background:var(--bg2)}
::-webkit-scrollbar-thumb{background:var(--bg4);border-radius:3px}
.landing{min-height:100vh;display:flex;flex-direction:column;align-items:center}
.ld-hero{padding:60px 20px 40px;text-align:center;max-width:700px}
.ld-logo{width:80px;height:80px;border-radius:16px;margin-bottom:16px;background:var(--bg3);display:flex;align-items:center;justify-content:center;font-size:32px;color:var(--primary2)}
.ld-brand{font-size:42px;font-weight:800;background:linear-gradient(135deg,var(--primary),var(--primary2));-webkit-background-clip:text;-webkit-text-fill-color:transparent}
.ld-tag{color:var(--text2);margin:12px 0 28px;font-size:15px;line-height:1.6}
.ld-btns{display:flex;gap:12px;justify-content:center;flex-wrap:wrap}
.ld-btn{padding:12px 28px;border-radius:var(--radius);font-size:14px;font-weight:600;border:none;transition:all .2s;display:flex;align-items:center;gap:8px}
.ld-btn-p{background:var(--primary);color:#fff}
.ld-btn-p:hover{background:var(--primary2)}
.ld-btn-o{background:transparent;color:var(--primary2);border:1.5px solid var(--primary)}
.ld-btn-o:hover{background:var(--primary-bg)}
.ld-btn-admin{background:var(--bg3);color:var(--text2);border:1px solid var(--border)}
.ld-btn-admin:hover{background:var(--bg4)}
.public-showcase{max-width:1100px;width:100%;padding:20px;margin-top:20px}
.public-section-head{display:flex;justify-content:space-between;align-items:center;margin-bottom:16px}
.public-kicker{font-size:11px;font-weight:700;letter-spacing:2px;color:var(--primary2);text-transform:uppercase}
.public-section-head h3{font-size:20px;margin-top:4px}
.public-section-head p{color:var(--text2);font-size:13px;margin-top:2px}
.public-refresh{background:var(--bg3);border:1px solid var(--border);color:var(--text2);width:36px;height:36px;border-radius:8px;display:flex;align-items:center;justify-content:center}
.public-refresh:hover{background:var(--bg4);color:var(--text)}
.public-grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(280px,1fr));gap:16px;margin-bottom:40px}
.pub-ad-card,.pub-prod-card{background:var(--bg2);border:1px solid var(--border);border-radius:var(--radius);overflow:hidden;transition:transform .2s}
.pub-ad-card:hover,.pub-prod-card:hover{transform:translateY(-2px)}
.pub-ad-img,.pub-prod-img{width:100%;height:160px;object-fit:cover;background:var(--bg3)}
.pub-ad-body,.pub-prod-body{padding:14px}
.pub-ad-body h4,.pub-prod-body h4{font-size:14px;margin-bottom:4px}
.pub-ad-body p,.pub-prod-body p{color:var(--text2);font-size:12px;line-height:1.5}
.pub-prod-price{color:var(--success);font-weight:700;font-size:16px;margin-top:6px}
.pub-prod-seller{font-size:11px;color:var(--text3);margin-top:4px}
.pub-ad-img-placeholder,.pub-prod-img-placeholder{width:100%;height:160px;background:var(--bg3);display:flex;align-items:center;justify-content:center;color:var(--text3);font-size:32px}
.ld-features{max-width:1100px;width:100%;padding:40px 20px}
.ld-features h3{text-align:center;font-size:24px;margin-bottom:28px}
.ld-grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(200px,1fr));gap:14px}
.ld-card{background:var(--bg2);border:1px solid var(--border);border-radius:var(--radius);padding:20px 16px;text-align:center;cursor:pointer;transition:all .2s;position:relative}
.ld-card:hover{border-color:var(--primary);transform:translateY(-2px)}
.ld-card i{font-size:28px;color:var(--primary2);margin-bottom:10px;display:block}
.ld-card h5{font-size:14px;margin-bottom:4px}
.ld-card p{font-size:12px;color:var(--text2)}
.ld-lock{position:absolute;top:10px;right:10px;color:var(--text3);font-size:11px}
.ld-ft{text-align:center;padding:40px 20px;color:var(--text3);font-size:12px}
.price-calc-modal{position:fixed;inset:0;background:rgba(0,0,0,.7);display:flex;align-items:center;justify-content:center;z-index:9999;backdrop-filter:blur(4px)}
.price-calc-card{background:var(--bg2);border:1px solid var(--border);border-radius:16px;padding:32px;width:90%;max-width:440px;position:relative}
.price-calc-close{position:absolute;top:14px;right:14px;background:none;border:none;color:var(--text2);font-size:18px}
.price-calc-sub{color:var(--text2);font-size:13px;margin:8px 0 20px}
.price-calc-field{margin-bottom:14px}
.price-calc-field label{display:block;font-size:12px;font-weight:600;margin-bottom:6px;color:var(--text2)}
.price-calc-field input{width:100%;padding:10px 12px;background:var(--bg3);border:1px solid var(--border);border-radius:8px;color:var(--text);font-size:14px}
.price-calc-row{display:grid;grid-template-columns:1fr 1fr;gap:12px}
.price-calc-result{text-align:center;padding:20px;background:var(--primary-bg);border-radius:12px;margin-top:16px}
.price-calc-result p{font-size:12px;color:var(--text2);margin-bottom:4px}
.price-calc-result span{font-size:32px;font-weight:800;color:var(--primary2)}
.super-screen{min-height:100vh;background:var(--bg)}
.super-login{min-height:100vh;display:flex;align-items:center;justify-content:center;padding:20px}
.super-login-card{background:var(--bg2);border:1px solid var(--border);border-radius:16px;padding:40px;width:100%;max-width:420px;text-align:center;position:relative}
.super-back{position:absolute;top:14px;left:14px;background:none;border:none;color:var(--text2);font-size:13px;display:flex;align-items:center;gap:6px}
.super-back:hover{color:var(--text)}
.super-logo{font-size:48px;color:var(--danger);margin-bottom:12px}
.super-login-card h2{font-size:22px}
.super-login-card>p{color:var(--text2);font-size:13px;margin:6px 0 20px}
.super-err{color:var(--danger);font-size:12px;min-height:20px;margin-bottom:10px}
.super-panel{min-height:100vh}
.super-top{display:flex;justify-content:space-between;align-items:center;padding:16px 24px;border-bottom:1px solid var(--border);background:var(--bg2)}
.super-kicker{font-size:10px;font-weight:700;letter-spacing:2px;color:var(--danger);text-transform:uppercase}
.super-top h1{font-size:20px;margin-top:2px}
.super-top h1 i{color:var(--danger);margin-right:8px}
.super-top-actions{display:flex;align-items:center;gap:12px}
.super-live{font-size:11px;color:var(--success);display:flex;align-items:center;gap:6px}
.super-live i{font-size:8px}
.super-body{padding:24px;max-width:1400px;margin:0 auto}
.super-tabs{display:flex;gap:0;margin-bottom:24px;background:var(--bg2);border-radius:var(--radius);padding:4px;border:1px solid var(--border);overflow-x:auto;flex-wrap:nowrap}
.super-tab{padding:10px 18px;font-size:12px;font-weight:600;border:none;background:none;color:var(--text3);border-radius:8px;transition:all .2s;white-space:nowrap}
.super-tab.active{background:var(--danger);color:#fff}
.super-tab:hover:not(.active){background:var(--bg3);color:var(--text)}
.super-metrics{display:grid;grid-template-columns:repeat(auto-fill,minmax(200px,1fr));gap:14px;margin-bottom:24px}
.sm-card{background:var(--bg2);border:1px solid var(--border);border-radius:var(--radius);padding:18px;position:relative;overflow:hidden}
.sm-card::after{content:'';position:absolute;top:0;left:0;right:0;height:3px}
.sm-card.red::after{background:var(--danger)}
.sm-card.purple::after{background:var(--primary)}
.sm-card.green::after{background:var(--success)}
.sm-card.blue::after{background:var(--info)}
.sm-card.yellow::after{background:var(--warning)}
.sm-card h4{font-size:11px;color:var(--text2);text-transform:uppercase;letter-spacing:1px;margin-bottom:6px}
.sm-card .sm-val{font-size:28px;font-weight:800}
.sm-card .sm-sub{font-size:11px;color:var(--text3);margin-top:2px}
.super-chart-grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(380px,1fr));gap:16px;margin-bottom:24px}
.super-card{background:var(--bg2);border:1px solid var(--border);border-radius:var(--radius);padding:20px;margin-bottom:16px}
.super-card-head{display:flex;justify-content:space-between;align-items:center;margin-bottom:14px}
.super-card-head h3{font-size:15px}
.super-card-head h3 i{margin-right:8px;color:var(--primary2)}
.super-card-head span{font-size:11px;color:var(--text3)}
.super-chart-box{position:relative;height:260px}
.super-toolbar{display:flex;justify-content:space-between;align-items:center;margin-bottom:16px;flex-wrap:wrap;gap:12px}
.super-toolbar h2{font-size:18px}
.super-toolbar p{font-size:12px;color:var(--text2);margin-top:2px}
.super-toolbar-actions{display:flex;gap:10px;align-items:center;flex-wrap:wrap}
.super-toolbar-actions input,.super-toolbar-actions select{padding:8px 12px;background:var(--bg3);border:1px solid var(--border);border-radius:8px;color:var(--text);font-size:12px}
.super-toolbar-actions input{width:220px}
.super-table-card{overflow:hidden;background:var(--bg2);border:1px solid var(--border);border-radius:var(--radius)}
.table-scroll{overflow-x:auto}
.super-table{width:100%;border-collapse:collapse;font-size:13px}
.super-table th{text-align:left;padding:12px 14px;background:var(--bg3);color:var(--text2);font-weight:600;font-size:11px;text-transform:uppercase;letter-spacing:.5px;white-space:nowrap}
.super-table td{padding:10px 14px;border-bottom:1px solid var(--border);white-space:nowrap}
.super-table tr:hover td{background:var(--bg3)}
.super-table tr:last-child td{border-bottom:none}
.auth-screen{min-height:100vh;display:flex}
.auth-left{flex:1;background:var(--bg2);padding:60px 40px;display:flex;flex-direction:column;justify-content:center;max-width:420px}
.auth-logo{width:50px;height:50px;border-radius:12px;margin-bottom:12px;background:var(--bg3);display:flex;align-items:center;justify-content:center;font-size:20px;color:var(--primary2)}
.auth-brand{font-size:32px;font-weight:800;background:linear-gradient(135deg,var(--primary),var(--primary2));-webkit-background-clip:text;-webkit-text-fill-color:transparent}
.auth-tagline{color:var(--text2);font-size:14px;margin:6px 0 28px}
.auth-feats{display:flex;flex-direction:column;gap:12px}
.auth-ft{display:flex;align-items:center;gap:10px;font-size:13px;color:var(--text2)}
.auth-ft i{color:var(--primary2);width:20px;text-align:center}
.auth-right{flex:1;display:flex;align-items:center;justify-content:center;padding:40px;background:var(--bg)}
.auth-wrap{width:100%;max-width:420px}
.auth-tabs{display:flex;gap:0;margin-bottom:24px;background:var(--bg2);border-radius:var(--radius);padding:4px;border:1px solid var(--border)}
.auth-tab{flex:1;padding:10px;text-align:center;font-size:13px;font-weight:600;border:none;background:none;color:var(--text2);border-radius:8px;transition:all .2s}
.auth-tab.active{background:var(--primary);color:#fff}
.auth-err{background:var(--danger-bg);color:var(--danger);padding:10px 14px;border-radius:8px;font-size:12px;margin-bottom:16px;display:none;align-items:center;gap:8px}
.auth-err.show{display:flex}
.auth-form{display:none}
.auth-form.active{display:block}
.fg{margin-bottom:14px}
.fg label{display:block;font-size:12px;font-weight:600;margin-bottom:6px;color:var(--text2)}
.req{color:var(--danger)}
.iw{position:relative;display:flex;align-items:center}
.iw i{position:absolute;left:12px;color:var(--text3);font-size:14px}
.iw input,.iw select{padding-left:38px}
.fi{width:100%;padding:10px 12px;background:var(--bg3);border:1px solid var(--border);border-radius:8px;color:var(--text);font-size:14px;transition:border .2s}
.fi:focus{outline:none;border-color:var(--primary)}
.tog-pw{position:absolute;right:8px;background:none;border:none;color:var(--text3);padding:4px}
.btn-auth{width:100%;padding:12px;border-radius:var(--radius);font-size:14px;font-weight:600;border:none;transition:all .2s;display:flex;align-items:center;justify-content:center;gap:8px}
.btn-auth-p{background:var(--primary);color:#fff}
.btn-auth-p:hover{background:var(--primary2)}
.auth-ft-link{text-align:center;margin-top:16px;font-size:13px;color:var(--text2)}
.auth-ft-link a{color:var(--primary2);font-weight:600}
.step-ind{display:flex;align-items:center;justify-content:center;gap:0;margin-bottom:20px}
.sdot{width:28px;height:28px;border-radius:50%;background:var(--bg3);border:2px solid var(--border);display:flex;align-items:center;justify-content:center;font-size:12px;font-weight:700;color:var(--text3)}
.sdot.on{background:var(--primary);border-color:var(--primary);color:#fff}
.sline{width:60px;height:2px;background:var(--border)}
.pw-str{margin-top:6px}
.pw-bar{height:4px;border-radius:2px;background:var(--bg3);overflow:hidden}
.pw-bar-inner{height:100%;border-radius:2px;transition:all .3s}
.role-screen{min-height:100vh;background:var(--bg);padding:20px}
.rs-header{display:flex;justify-content:space-between;align-items:center;max-width:1000px;margin:0 auto 24px}
.rs-header h2{font-size:20px}
.rs-header h2 i{color:var(--primary2);margin-right:8px}
.rs-body{max-width:1000px;margin:0 auto}
.rs-biz{display:flex;align-items:center;gap:14px;background:var(--bg2);border:1px solid var(--border);border-radius:var(--radius);padding:18px;margin-bottom:24px}
.biz-ic{width:44px;height:44px;border-radius:10px;background:var(--primary-bg);display:flex;align-items:center;justify-content:center;color:var(--primary2);font-size:18px}
.rs-biz h3{font-size:16px}
.rs-biz p{font-size:12px;color:var(--text2)}
.rs-grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(220px,1fr));gap:16px}
.rs-card{background:var(--bg2);border:1px solid var(--border);border-radius:var(--radius);padding:24px 20px;transition:all .2s}
.rs-card:hover{border-color:var(--primary)}
.rs-icon{width:48px;height:48px;border-radius:12px;display:flex;align-items:center;justify-content:center;font-size:20px;margin-bottom:14px}
.rs-card.mgr .rs-icon{background:rgba(243,156,18,.15);color:var(--warning)}
.rs-card.sk .rs-icon{background:rgba(9,132,227,.15);color:var(--info)}
.rs-card.cash .rs-icon{background:rgba(0,184,148,.15);color:var(--success)}
.rs-card.sell .rs-icon{background:rgba(162,155,254,.15);color:var(--primary2)}
.rs-card h4{font-size:15px;margin-bottom:4px}
.rs-desc{font-size:12px;color:var(--text2);margin-bottom:12px}
.rs-perms{list-style:none;font-size:12px;color:var(--text2);margin-bottom:16px}
.rs-perms li{padding:3px 0;display:flex;align-items:center;gap:6px}
.rs-perms li i{color:var(--success);font-size:10px}
.rs-btn{width:100%;padding:10px;border-radius:8px;font-size:13px;font-weight:600;border:none;background:var(--primary);color:#fff;transition:all .2s}
.rs-btn:hover{background:var(--primary2)}
.rs-ft{text-align:center;padding:40px 20px;color:var(--text3);font-size:12px;margin-top:40px}
.sb-bd{position:fixed;inset:0;background:rgba(0,0,0,.5);z-index:998;opacity:0;pointer-events:none;transition:opacity .2s}
.sb-bd.show{opacity:1;pointer-events:auto}
.sidebar{position:fixed;left:-260px;top:0;bottom:0;width:260px;background:var(--bg2);border-right:1px solid var(--border);z-index:999;transition:left .3s;display:flex;flex-direction:column;overflow-y:auto}
.sidebar.open{left:0}
.sb-brand{display:flex;align-items:center;gap:10px;padding:18px 16px;border-bottom:1px solid var(--border)}
.sb-brand>span{font-size:18px;font-weight:800;background:linear-gradient(135deg,var(--primary),var(--primary2));-webkit-background-clip:text;-webkit-text-fill-color:transparent}
.sb-nav{flex:1;padding:12px 8px}
.sb-lbl{font-size:10px;font-weight:700;color:var(--text3);text-transform:uppercase;letter-spacing:1.5px;padding:14px 12px 6px}
.ni{display:flex;align-items:center;gap:10px;padding:9px 12px;border-radius:8px;font-size:13px;color:var(--text2);cursor:pointer;transition:all .15s;position:relative}
.ni:hover{background:var(--bg3);color:var(--text)}
.ni.active{background:var(--primary-bg);color:var(--primary2)}
.ni.active i{color:var(--primary2)}
.ni i{width:18px;text-align:center;font-size:14px;color:var(--text3)}
.bdg{position:absolute;right:10px;background:var(--danger);color:#fff;font-size:10px;font-weight:700;padding:1px 7px;border-radius:10px;min-width:18px;text-align:center}
.sb-foot{padding:12px 16px;border-top:1px solid var(--border)}
.fb-st{display:flex;align-items:center;gap:6px;font-size:11px;color:var(--text3)}
.s-dot{width:6px;height:6px;border-radius:50%;background:var(--success)}
.topbar{position:fixed;top:0;left:0;right:0;height:56px;background:var(--bg2);border-bottom:1px solid var(--border);display:flex;align-items:center;justify-content:space-between;padding:0 16px;z-index:997}
.tb-left{display:flex;align-items:center;gap:12px}
.menu-tog{background:none;border:none;color:var(--text);font-size:18px;padding:4px}
.tb-right{display:flex;align-items:center;gap:12px}
.tb-btn{background:none;border:none;color:var(--text2);font-size:16px;position:relative;padding:6px}
.cnt{position:absolute;top:0;right:0;background:var(--danger);color:#fff;font-size:9px;font-weight:700;padding:1px 5px;border-radius:8px;min-width:16px;text-align:center}
.u-chip{display:flex;align-items:center;gap:8px;cursor:pointer;position:relative}
.u-av{width:32px;height:32px;border-radius:50%;background:var(--primary);color:#fff;display:flex;align-items:center;justify-content:center;font-size:13px;font-weight:700}
.u-chip-info{line-height:1.3}
.uc-name{font-size:12px;font-weight:600}
.uc-role{font-size:10px;color:var(--text3)}
.u-dd{position:absolute;top:44px;right:0;background:var(--bg2);border:1px solid var(--border);border-radius:var(--radius);min-width:180px;box-shadow:var(--shadow);display:none;z-index:10}
.u-dd.show{display:block}
.udd{width:100%;padding:10px 14px;background:none;border:none;color:var(--text);font-size:13px;text-align:left;display:flex;align-items:center;gap:8px}
.udd:hover{background:var(--bg3)}
.udd.dng{color:var(--danger)}
.dd-div{height:1px;background:var(--border);margin:4px 0}
.np{position:fixed;top:56px;right:-360px;width:360px;bottom:0;background:var(--bg2);border-left:1px solid var(--border);z-index:996;transition:right .3s;display:flex;flex-direction:column}
.np.show{right:0}
.np-h{display:flex;justify-content:space-between;align-items:center;padding:16px;border-bottom:1px solid var(--border)}
.np-h h3{font-size:15px}
.mcl{background:none;border:none;color:var(--text2);font-size:16px}
#nList{flex:1;overflow-y:auto;padding:12px}
.tc{position:fixed;bottom:20px;right:20px;z-index:99999;display:flex;flex-direction:column;gap:8px}
.toast{padding:12px 18px;border-radius:8px;font-size:13px;font-weight:500;display:flex;align-items:center;gap:8px;animation:slideIn .3s;box-shadow:var(--shadow);max-width:360px}
.toast.s{background:#00b894;color:#fff}
.toast.e{background:#e74c3c;color:#fff}
.toast.i{background:#0984e3;color:#fff}
.toast.w{background:#f39c12;color:#fff}
@keyframes slideIn{from{transform:translateX(100%);opacity:0}to{transform:translateX(0);opacity:1}}
.main{margin-top:56px;padding:20px;min-height:calc(100vh - 56px)}
.section{display:none}
.section.active{display:block}
.sh{display:flex;justify-content:space-between;align-items:center;margin-bottom:20px;flex-wrap:wrap;gap:12px}
.sh h2{font-size:22px}
.sh p{font-size:13px;color:var(--text2);margin-top:2px}
.sh-acts{display:flex;gap:8px}
.btn{padding:8px 16px;border-radius:8px;font-size:12px;font-weight:600;border:none;transition:all .2s;display:inline-flex;align-items:center;gap:6px}
.btn-p{background:var(--primary);color:#fff}
.btn-p:hover{background:var(--primary2)}
.btn-o{background:transparent;color:var(--primary2);border:1px solid var(--primary)}
.btn-o:hover{background:var(--primary-bg)}
.btn-i{background:var(--info);color:#fff}
.btn-d{background:var(--danger);color:#fff}
.btn-s{background:var(--success);color:#fff}
.btn-w{background:var(--warning);color:#fff}
.btn-sm{padding:6px 12px;font-size:11px}
.btn-xs{padding:4px 8px;font-size:10px}
.metrics{display:grid;grid-template-columns:repeat(auto-fill,minmax(180px,1fr));gap:14px;margin-bottom:24px}
.mc{background:var(--bg2);border:1px solid var(--border);border-radius:var(--radius);padding:18px;position:relative;overflow:hidden}
.mc::before{content:'';position:absolute;top:0;left:0;right:0;height:3px}
.mc.g::before{background:var(--success)}
.mc.a::before{background:var(--info)}
.mc.r::before{background:var(--danger)}
.mc.pu::before{background:var(--primary)}
.mc.b::before{background:var(--warning)}
.mc-icon{font-size:20px;color:var(--text3);margin-bottom:8px}
.mc h3{font-size:24px;font-weight:800}
.mc p{font-size:11px;color:var(--text2);margin-top:2px}
.ch-g{display:grid;grid-template-columns:repeat(auto-fill,minmax(380px,1fr));gap:16px;margin-bottom:24px}
.ch-c{background:var(--bg2);border:1px solid var(--border);border-radius:var(--radius);padding:18px}
.ch-c h4{font-size:14px;margin-bottom:12px}
.ch-c h4 i{color:var(--primary2);margin-right:6px}
.ch-box{position:relative;height:260px}
.tw{background:var(--bg2);border:1px solid var(--border);border-radius:var(--radius);overflow:hidden;margin-bottom:24px}
.ts{overflow-x:auto}
table{width:100%;border-collapse:collapse;font-size:13px}
th{text-align:left;padding:11px 14px;background:var(--bg3);color:var(--text2);font-weight:600;font-size:11px;text-transform:uppercase;letter-spacing:.5px;white-space:nowrap}
td{padding:10px 14px;border-bottom:1px solid var(--border)}
tr:hover td{background:var(--bg3)}
.empty-s{text-align:center;padding:40px 20px;color:var(--text3)}
.empty-s i{font-size:32px;margin-bottom:8px;display:block}
.empty-s p{font-size:13px}
.sb-bar{display:flex;align-items:center;gap:8px;background:var(--bg2);border:1px solid var(--border);border-radius:var(--radius);padding:0 14px;margin-bottom:16px}
.sb-bar i{color:var(--text3);font-size:14px}
.sb-bar input{flex:1;padding:10px 0;background:none;border:none;color:var(--text);font-size:13px}
.sb-bar input:focus{outline:none}
.pos-layout{display:grid;grid-template-columns:1fr 340px;gap:16px;min-height:60vh}
.pos-products{display:grid;grid-template-columns:repeat(auto-fill,minmax(150px,1fr));gap:10px;align-content:start;overflow-y:auto;max-height:70vh}
.pos-p-card{background:var(--bg2);border:1px solid var(--border);border-radius:8px;padding:12px;cursor:pointer;transition:all .15s;text-align:center}
.pos-p-card:hover{border-color:var(--primary)}
.pos-p-card h5{font-size:12px;margin-bottom:2px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis}
.pos-p-card .pos-p-price{color:var(--success);font-weight:700;font-size:13px}
.pos-p-card .pos-p-stock{font-size:10px;color:var(--text3)}
.pos-cart{background:var(--bg2);border:1px solid var(--border);border-radius:var(--radius);display:flex;flex-direction:column}
.pos-cart-head{padding:14px;border-bottom:1px solid var(--border);font-size:14px;font-weight:600}
.pos-cart-body{flex:1;overflow-y:auto;padding:8px}
.cart-item{display:flex;align-items:center;gap:8px;padding:8px;background:var(--bg3);border-radius:6px;margin-bottom:6px}
.cart-item-info{flex:1;min-width:0}
.cart-item-info h6{font-size:12px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis}
.cart-item-info span{font-size:11px;color:var(--text3)}
.cart-qty{display:flex;align-items:center;gap:4px}
.cart-qty button{width:24px;height:24px;border-radius:4px;background:var(--bg4);border:none;color:var(--text);font-size:12px}
.cart-qty span{font-size:12px;min-width:20px;text-align:center}
.cart-item-price{font-size:12px;font-weight:600;color:var(--success);min-width:60px;text-align:right}
.cart-item-rm{background:none;border:none;color:var(--danger);font-size:11px;padding:2px}
.pos-cart-foot{padding:14px;border-top:1px solid var(--border)}
.pos-total{display:flex;justify-content:space-between;font-size:18px;font-weight:700;margin-bottom:12px}
.pos-total span:last-child{color:var(--success)}
.prof-grid{display:grid;grid-template-columns:1fr 1fr;gap:20px}
.prof-left,.prof-right{background:var(--bg2);border:1px solid var(--border);border-radius:var(--radius);padding:24px}
.logo-card{text-align:center}
.logo-prev{width:120px;height:120px;border-radius:16px;background:var(--bg3);border:2px dashed var(--border);display:flex;align-items:center;justify-content:center;margin:0 auto 14px;cursor:pointer;overflow:hidden;transition:border .2s}
.logo-prev:hover{border-color:var(--primary)}
.logo-prev img{width:100%;height:100%;object-fit:cover}
.logo-prev i{font-size:32px;color:var(--text3)}
.prof-right h3{font-size:16px;margin-bottom:16px}
.modal-ov{position:fixed;inset:0;background:rgba(0,0,0,.7);display:flex;align-items:center;justify-content:center;z-index:9999;backdrop-filter:blur(4px);opacity:0;pointer-events:none;transition:opacity .2s}
.modal-ov.show{opacity:1;pointer-events:auto}
.modal-card{background:var(--bg2);border:1px solid var(--border);border-radius:16px;padding:28px;width:90%;max-width:500px;max-height:90vh;overflow-y:auto;transform:scale(.95);transition:transform .2s}
.modal-ov.show .modal-card{transform:scale(1)}
.modal-head{display:flex;justify-content:space-between;align-items:center;margin-bottom:20px}
.modal-head h3{font-size:17px}
.modal-head button{background:none;border:none;color:var(--text2);font-size:18px}
.modal-actions{display:flex;gap:10px;justify-content:flex-end;margin-top:20px}
.emp-grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(280px,1fr));gap:14px}
.emp-card{background:var(--bg2);border:1px solid var(--border);border-radius:var(--radius);padding:18px;transition:all .2s}
.emp-card:hover{border-color:var(--primary)}
.emp-card-head{display:flex;align-items:center;gap:12px;margin-bottom:12px}
.emp-av{width:42px;height:42px;border-radius:50%;display:flex;align-items:center;justify-content:center;font-size:16px;font-weight:700;color:#fff}
.emp-card-head div h4{font-size:14px}
.emp-card-head div p{font-size:11px;color:var(--text2)}
.emp-card-body{display:flex;flex-wrap:wrap;gap:6px;margin-bottom:12px}
.emp-tag{padding:3px 10px;border-radius:20px;font-size:10px;font-weight:600}
.emp-tag.role{background:var(--primary-bg);color:var(--primary2)}
.emp-tag.status{background:var(--success-bg);color:var(--success)}
.emp-tag.status.inactive{background:var(--danger-bg);color:var(--danger)}
.emp-card-foot{display:flex;gap:6px}
.notif-item{padding:12px;background:var(--bg3);border-radius:8px;margin-bottom:8px;display:flex;gap:10px;align-items:flex-start}
.notif-item i{font-size:16px;margin-top:2px}
.notif-item div h5{font-size:13px;margin-bottom:2px}
.notif-item div p{font-size:11px;color:var(--text3)}
.status-badge{display:inline-block;padding:3px 10px;border-radius:20px;font-size:10px;font-weight:700;text-transform:uppercase}
.status-badge.active{background:rgba(0,184,148,.15);color:#00b894}
.status-badge.suspended{background:rgba(214,48,49,.15);color:#d63031}
.status-badge.pending{background:var(--warning-bg);color:var(--warning)}
.status-badge.approved{background:var(--success-bg);color:var(--success)}
.status-badge.rejected{background:var(--danger-bg);color:var(--danger)}
.status-badge.hidden-st{background:rgba(90,90,114,.2);color:var(--text3)}
.status-badge.featured{background:var(--warning-bg);color:var(--warning)}
.status-badge.paid{background:var(--success-bg);color:var(--success)}
.status-badge.unpaid{background:var(--danger-bg);color:var(--danger)}
.status-badge.paused{background:var(--warning-bg);color:var(--warning)}
.loading-ov{position:absolute;inset:0;background:rgba(13,13,18,.8);display:flex;align-items:center;justify-content:center;z-index:5;border-radius:inherit}
.spinner{width:32px;height:32px;border:3px solid var(--border);border-top-color:var(--primary);border-radius:50%;animation:spin .6s linear infinite}
@keyframes spin{to{transform:rotate(360deg)}}
.confirm-modal{position:fixed;inset:0;background:rgba(0,0,0,.75);display:flex;align-items:center;justify-content:center;z-index:99999;backdrop-filter:blur(6px)}
.confirm-card{background:var(--bg2);border:1px solid var(--border);border-radius:16px;padding:32px;width:90%;max-width:420px;text-align:center}
.confirm-icon{width:64px;height:64px;border-radius:50%;display:flex;align-items:center;justify-content:center;margin:0 auto 16px;font-size:28px}
.confirm-icon.danger{background:var(--danger-bg);color:var(--danger)}
.confirm-icon.warning{background:var(--warning-bg);color:var(--warning)}
.confirm-icon.success{background:var(--success-bg);color:var(--success)}
.confirm-card h3{font-size:18px;margin-bottom:8px}
.confirm-card p{font-size:13px;color:var(--text2);margin-bottom:24px;line-height:1.6}
.confirm-card .user-target{display:inline-block;background:var(--bg3);border:1px solid var(--border);border-radius:8px;padding:6px 14px;font-weight:700;font-size:14px;color:var(--text);margin-bottom:16px}
.confirm-actions{display:flex;gap:10px;justify-content:center}
.confirm-actions .btn{min-width:120px;justify-content:center}
.super-modal{position:fixed;inset:0;background:rgba(0,0,0,.7);display:flex;align-items:center;justify-content:center;z-index:99999;backdrop-filter:blur(4px)}
.super-modal-card{background:var(--bg2);border:1px solid var(--border);border-radius:16px;padding:28px;width:90%;max-width:500px;max-height:90vh;overflow-y:auto}
.super-modal-head{display:flex;justify-content:space-between;align-items:center;margin-bottom:20px}
.super-modal-head h3{font-size:17px}
.super-modal-head button{background:none;border:none;color:var(--text2);font-size:18px}
.super-detail-row{display:flex;justify-content:space-between;padding:10px 0;border-bottom:1px solid var(--border);font-size:13px}
.super-detail-row:last-child{border-bottom:none}
.super-detail-row .label{color:var(--text2)}
.super-detail-row .value{font-weight:600;text-align:right;max-width:60%;word-break:break-all}
.sys-ft{text-align:center;padding:30px 20px;color:var(--text3);font-size:11px;border-top:1px solid var(--border);margin-top:20px}
.receipt-content{background:#fff;color:#000;padding:24px;font-family:'Courier New',monospace;font-size:12px;border-radius:8px;max-width:320px;margin:0 auto}
.receipt-content h3{text-align:center;margin-bottom:8px}
.receipt-content .rc-line{display:flex;justify-content:space-between;padding:2px 0}
.receipt-content .rc-divider{border-top:1px dashed #000;margin:8px 0}
.receipt-content .rc-total{font-weight:bold;font-size:14px}
.tbl-thumb{width:40px;height:40px;border-radius:6px;object-fit:cover;background:var(--bg3);vertical-align:middle;margin-right:8px}
.activity-item{display:flex;gap:12px;padding:10px 0;border-bottom:1px solid var(--border);font-size:13px}
.activity-item:last-child{border-bottom:none}
.activity-icon{width:32px;height:32px;border-radius:8px;display:flex;align-items:center;justify-content:center;flex-shrink:0;font-size:13px}
.activity-icon.danger{background:var(--danger-bg);color:var(--danger)}
.activity-icon.success{background:var(--success-bg);color:var(--success)}
.activity-icon.warning{background:var(--warning-bg);color:var(--warning)}
.activity-icon.info{background:var(--info-bg);color:var(--info)}
.activity-text{flex:1;color:var(--text2)}
.activity-text strong{color:var(--text)}
.activity-time{font-size:11px;color:var(--text3);white-space:nowrap}
@media(max-width:900px){.pos-layout{grid-template-columns:1fr}.prof-grid{grid-template-columns:1fr}.auth-left{display:none}.super-chart-grid{grid-template-columns:1fr}}
@media(max-width:600px){.ld-grid{grid-template-columns:1fr 1fr}.rs-grid{grid-template-columns:1fr}.metrics{grid-template-columns:1fr 1fr}.ch-g{grid-template-columns:1fr}.emp-grid{grid-template-columns:1fr}.super-toolbar{flex-direction:column;align-items:flex-start}.super-toolbar-actions{width:100%}.super-toolbar-actions input{width:100%}.super-tabs{flex-wrap:wrap}.super-metrics{grid-template-columns:1fr 1fr}}
</style>
</head>
<body>

<!-- LANDING -->
<div id="landingScreen" class="landing">
  <div class="ld-hero">
    <div class="ld-logo"><i class="fas fa-book-open"></i></div>
    <h1 class="ld-brand">BizBook</h1>
    <p class="ld-tag">Mfumo kamili wa usimamizi wa biashara yako. Simamia bidhaa, matangazo, wafanyakazi, mauzo na madeni — kote katika mahali moja.</p>
    <div class="ld-btns">
      <button class="ld-btn ld-btn-p" onclick="showScreen('authScreen')"><i class="fas fa-rocket"></i> Anza Sasa</button>
      <button class="ld-btn ld-btn-o" onclick="showScreen('authScreen');setTimeout(function(){switchAuthTab('register')},100)"><i class="fas fa-user-plus"></i> Jisajili</button>
      <button class="ld-btn ld-btn-admin" onclick="showScreen('superLogin')"><i class="fas fa-shield-halved"></i> Super Admin</button>
      <button class="ld-btn ld-btn-o" onclick="openPriceCalc()"><i class="fas fa-calculator"></i> Kokotoza Bei</button>
    </div>
  </div>
  <div class="public-showcase" id="publicShowcase"></div>
  <div class="ld-features">
    <h3>Mambo Yanayofanywa na BizBook</h3>
    <div class="ld-grid">
      <div class="ld-card" onclick="showScreen('authScreen')"><span class="ld-lock"><i class="fas fa-lock"></i></span><i class="fas fa-chart-line"></i><h5>Dashboard</h5><p>Tazama takwimu za biashara yako</p></div>
      <div class="ld-card" onclick="showScreen('authScreen')"><span class="ld-lock"><i class="fas fa-lock"></i></span><i class="fas fa-boxes-stacked"></i><h5>Bidhaa</h5><p>Simamia bidhaa zako zote</p></div>
      <div class="ld-card" onclick="showScreen('authScreen')"><span class="ld-lock"><i class="fas fa-lock"></i></span><i class="fas fa-bullhorn"></i><h5>Matangazo</h5><p>Tangaza biashara yako</p></div>
      <div class="ld-card" onclick="showScreen('authScreen')"><span class="ld-lock"><i class="fas fa-lock"></i></span><i class="fas fa-cash-register"></i><h5>POS</h5><p>Fanya mauzo haraka</p></div>
      <div class="ld-card" onclick="showScreen('authScreen')"><span class="ld-lock"><i class="fas fa-lock"></i></span><i class="fas fa-users"></i><h5>Wafanyakazi</h5><p>Simamia timu yako</p></div>
      <div class="ld-card" onclick="openPriceCalc()"><i class="fas fa-calculator"></i><h5>Kokotoza Bei</h5><p>Hesabu bei ya kuuzia</p></div>
    </div>
  </div>
  <div class="ld-ft">&copy; 2025 BizBook. Haki zote zimehifadhiwa.</div>
</div>

<!-- AUTH -->
<div id="authScreen" class="auth-screen hidden">
  <div class="auth-left">
    <div class="auth-logo"><i class="fas fa-book-open"></i></div>
    <h1 class="auth-brand">BizBook</h1>
    <p class="auth-tagline">Mfumo wa Usimamizi wa Biashara</p>
    <div class="auth-feats">
      <div class="auth-ft"><i class="fas fa-check"></i> Dashboard ya takwimu za moja kwa moja</div>
      <div class="auth-ft"><i class="fas fa-check"></i> Usimamizi wa bidhaa na matangazo</div>
      <div class="auth-ft"><i class="fas fa-check"></i> Mfumo wa POS wa haraka</div>
      <div class="auth-ft"><i class="fas fa-check"></i> Usimamizi wa wafanyakazi na madeni</div>
      <div class="auth-ft"><i class="fas fa-check"></i> Ripoti za kina</div>
    </div>
  </div>
  <div class="auth-right">
    <div class="auth-wrap">
      <div class="auth-tabs">
        <button class="auth-tab active" id="authTabLogin" onclick="switchAuthTab('login')">Ingia</button>
        <button class="auth-tab" id="authTabRegister" onclick="switchAuthTab('register')">Jisajili</button>
      </div>
      <div class="auth-err" id="authErr"><i class="fas fa-exclamation-circle"></i><span id="authErrText"></span></div>
      <form class="auth-form active" id="loginForm" onsubmit="handleLogin(event)">
        <div class="fg"><label>Barua Pepe <span class="req">*</span></label><div class="iw"><i class="fas fa-envelope"></i><input class="fi" type="email" id="loginEmail" required placeholder="barua@mfano.com"/></div></div>
        <div class="fg"><label>Nenosiri <span class="req">*</span></label><div class="iw"><i class="fas fa-lock"></i><input class="fi" type="password" id="loginPw" required placeholder="Nenosiri lako"/><button type="button" class="tog-pw" onclick="togPw('loginPw',this)"><i class="fas fa-eye"></i></button></div></div>
        <button type="submit" class="btn-auth btn-auth-p"><i class="fas fa-sign-in-alt"></i> Ingia</button>
        <p class="auth-ft-link">Huna akaunti? <a onclick="switchAuthTab('register')">Jisajili sasa</a></p>
      </form>
      <form class="auth-form" id="registerForm" onsubmit="handleRegister(event)">
        <div class="step-ind"><div class="sdot on" id="sd1">1</div><div class="sline"></div><div class="sdot" id="sd2">2</div></div>
        <div id="regStep1">
          <div class="fg"><label>Jina Kamili <span class="req">*</span></label><div class="iw"><i class="fas fa-user"></i><input class="fi" type="text" id="regName" required placeholder="Jina lako kamili"/></div></div>
          <div class="fg"><label>Barua Pepe <span class="req">*</span></label><div class="iw"><i class="fas fa-envelope"></i><input class="fi" type="email" id="regEmail" required placeholder="barua@mfano.com"/></div></div>
          <div class="fg"><label>Nambari ya Simu <span class="req">*</span></label><div class="iw"><i class="fas fa-phone"></i><input class="fi" type="tel" id="regPhone" required placeholder="+255..."/></div></div>
          <button type="button" class="btn-auth btn-auth-p" onclick="regNext()"><i class="fas fa-arrow-right"></i> Endelea</button>
        </div>
        <div id="regStep2" class="hidden">
          <div class="fg"><label>Jina la Biashara <span class="req">*</span></label><div class="iw"><i class="fas fa-building"></i><input class="fi" type="text" id="regBizName" required placeholder="Jina la biashara yako"/></div></div>
          <div class="fg"><label>Aina ya Biashara <span class="req">*</span></label><div class="iw"><i class="fas fa-tags"></i><select class="fi" id="regBizCat" required><option value="">Chagua...</option><option>Duka la Viboreshaji</option><option>Duka la Chakula</option><option>Duka la Nguo</option><option>Biashara ya Mtandaoni</option><option>Huduma</option><option>Ufundi</option><option>Biashara Nyingine</option></select></div></div>
          <div class="fg"><label>Nenosiri <span class="req">*</span></label><div class="iw"><i class="fas fa-lock"></i><input class="fi" type="password" id="regPw" required placeholder="Nenosiri la angalau 6 herufi" oninput="checkPwStr(this.value)"/><button type="button" class="tog-pw" onclick="togPw('regPw',this)"><i class="fas fa-eye"></i></button></div><div class="pw-str"><div class="pw-bar"><div class="pw-bar-inner" id="pwBar"></div></div></div></div>
          <div class="fg"><label>Thibitisha Nenosiri <span class="req">*</span></label><div class="iw"><i class="fas fa-lock"></i><input class="fi" type="password" id="regPwC" required placeholder="Rudia nenosiri"/></div></div>
          <button type="submit" class="btn-auth btn-auth-p"><i class="fas fa-user-plus"></i> Jisajili</button>
          <p class="auth-ft-link">Umesajili tayari? <a onclick="switchAuthTab('login')">Ingia</a></p>
        </div>
      </form>
      <p style="text-align:center;margin-top:16px"><a onclick="showScreen('landingScreen')" style="font-size:12px;color:var(--text3)"><i class="fas fa-arrow-left"></i> Rudi nyumbani</a></p>
    </div>
  </div>
</div>

<!-- ROLE SELECTION -->
<div id="roleScreen" class="role-screen hidden">
  <div class="rs-header">
    <h2><i class="fas fa-user-shield"></i> Chagua Jukumu Lako</h2>
    <button class="btn btn-o btn-sm" onclick="logout()"><i class="fas fa-sign-out-alt"></i> Ondoka</button>
  </div>
  <div class="rs-body">
    <div class="rs-biz" id="rsBizInfo"></div>
    <div class="rs-grid" id="rsGrid"></div>
  </div>
  <div class="rs-ft">&copy; 2025 BizBook</div>
</div>

<!-- MAIN APP -->
<div id="appScreen" class="hidden">
  <div class="sb-bd" id="sbBd" onclick="toggleSidebar()"></div>
  <div class="sidebar" id="sidebar">
    <div class="sb-brand"><i class="fas fa-book-open" style="color:var(--primary2);font-size:20px"></i><span>BizBook</span></div>
    <div class="sb-nav" id="sbNav"></div>
    <div class="sb-foot"><div class="fb-st"><div class="s-dot"></div> Mtandao umekuwa wa karibu</div></div>
  </div>
  <div class="topbar" id="topbar">
    <div class="tb-left">
      <button class="menu-tog" onclick="toggleSidebar()"><i class="fas fa-bars"></i></button>
      <span style="font-weight:700;font-size:15px" id="tbBizName">Biashara</span>
    </div>
    <div class="tb-right">
      <button class="tb-btn" onclick="toggleNotif()" title="Arifa"><i class="fas fa-bell"></i><span class="cnt" id="notifCnt">0</span></button>
      <div class="u-chip" onclick="toggleUserDd()">
        <div class="u-av" id="tbAvatar">A</div>
        <div class="u-chip-info"><div class="uc-name" id="tbName">Jina</div><div class="uc-role" id="tbRole">Meneja</div></div>
        <div class="u-dd" id="userDd">
          <button class="udd" onclick="navTo('profile');closeUserDd()"><i class="fas fa-user-cog"></i> Wasifu</button>
          <button class="udd" onclick="navTo('notifications');closeUserDd()"><i class="fas fa-bell"></i> Arifa</button>
          <div class="dd-div"></div>
          <button class="udd dng" onclick="logout()"><i class="fas fa-sign-out-alt"></i> Ondoka</button>
        </div>
      </div>
    </div>
  </div>
  <div class="np" id="notifPanel">
    <div class="np-h"><h3><i class="fas fa-bell" style="color:var(--primary2);margin-right:8px"></i>Arifa</h3><button class="mcl" onclick="toggleNotif()"><i class="fas fa-times"></i></button></div>
    <div id="nList"></div>
  </div>
  <div class="main" id="mainContent">
    <div id="sec-dashboard" class="section active"></div>
    <div id="sec-products" class="section"></div>
    <div id="sec-ads" class="section"></div>
    <div id="sec-pos" class="section"></div>
    <div id="sec-employees" class="section"></div>
    <div id="sec-notifications" class="section"></div>
    <div id="sec-profile" class="section"></div>
    <div id="sec-debts" class="section"></div>
    <div id="sec-reports" class="section"></div>
  </div>
  <div class="sys-ft">&copy; 2025 BizBook - Mfumo wa Usimamizi wa Biashara</div>
</div>

<!-- SUPER ADMIN LOGIN -->
<div id="superLogin" class="super-screen hidden">
  <div class="super-login">
    <div class="super-login-card">
      <button class="super-back" onclick="showScreen('landingScreen')"><i class="fas fa-arrow-left"></i> Nyuma</button>
      <div class="super-logo"><i class="fas fa-shield-halved"></i></div>
      <h2>Super Admin</h2>
      <p>Ingia kwa huduma za usimamizi wa mfumo</p>
      <div class="super-err" id="superErr"></div>
      <form onsubmit="handleSuperLogin(event)">
        <div class="fg"><div class="iw"><i class="fas fa-envelope"></i><input class="fi" type="email" id="superEmail" required placeholder="barua@super.admin"/></div></div>
        <div class="fg"><div class="iw"><i class="fas fa-lock"></i><input class="fi" type="password" id="superPw" required placeholder="Nenosiri la super admin"/></div></div>
        <button type="submit" class="btn-auth btn-auth-p" style="background:var(--danger)"><i class="fas fa-shield-halved"></i> Ingia kama Super Admin</button>
      </form>
      <p style="margin-top:14px;font-size:11px;color:var(--text3)">Chaguo-msingi: admin@bizbook.com / superadmin123</p>
    </div>
  </div>
</div>

<!-- SUPER ADMIN PANEL -->
<div id="superPanel" class="super-screen hidden">
  <div class="super-top">
    <div><div class="super-kicker">Super Admin</div><h1><i class="fas fa-shield-halved"></i> Usimamizi wa Mfumo</h1></div>
    <div class="super-top-actions">
      <div class="super-live"><i class="fas fa-circle"></i> Mtandao</div>
      <button class="btn btn-w btn-sm" onclick="superLogout()"><i class="fas fa-sign-out-alt"></i> Ondoka</button>
    </div>
  </div>
  <div class="super-body" id="superBody"></div>
</div>

<!-- PRICE CALCULATOR MODAL -->
<div id="priceCalcModal" class="price-calc-modal hidden" onclick="if(event.target===this)closePriceCalc()">
  <div class="price-calc-card">
    <button class="price-calc-close" onclick="closePriceCalc()"><i class="fas fa-times"></i></button>
    <h3 style="font-size:18px;margin-bottom:4px"><i class="fas fa-calculator" style="color:var(--primary2);margin-right:8px"></i>Kokotoza Bei ya Kuuzia</h3>
    <p class="price-calc-sub">Ingia gharama zako na tutakupatia bei inayofaa</p>
    <div class="price-calc-field"><label>Gharama ya Kununua (TSh)</label><input type="number" id="pcCost" placeholder="10000" oninput="calcPrice()"/></div>
    <div class="price-calc-row">
      <div class="price-calc-field"><label>Asilimia ya Faida (%)</label><input type="number" id="pcMargin" placeholder="30" oninput="calcPrice()"/></div>
      <div class="price-calc-field"><label>Matumizi Mengine (TSh)</label><input type="number" id="pcExtra" placeholder="0" oninput="calcPrice()"/></div>
    </div>
    <div class="price-calc-result" id="pcResult" style="display:none">
      <p>Bei inayopendekezwa ya kuuzia</p>
      <span id="pcPrice">0</span>
      <p style="margin-top:8px;font-size:11px" id="pcBreakdown"></p>
    </div>
  </div>
</div>

<!-- GENERIC MODAL -->
<div id="modalOv" class="modal-ov" onclick="if(event.target===this)closeModal()">
  <div class="modal-card" id="modalCard"></div>
</div>

<!-- TOAST CONTAINER -->
<div class="tc" id="toastC"></div>

<script>
/* ============================================================
   DATA LAYER - localStorage wrapper
   ============================================================ */
var DB={
  g:function(k){try{return JSON.parse(localStorage.getItem('bb_'+k)||'[]')}catch(e){return[]}},
  s:function(k,v){localStorage.setItem('bb_'+k,JSON.stringify(v))},
  go:function(k){try{return JSON.parse(localStorage.getItem('bb_'+k)||'null')}catch(e){return null}},
  so:function(k,v){localStorage.setItem('bb_'+k,JSON.stringify(v))},
  d:function(k){localStorage.removeItem('bb_'+k)}
};

/* ============================================================
   SUPER ADMIN CREDENTIALS
   ============================================================ */
var SUPER_CREDS={email:'admin@bizbook.com',password:'superadmin123'};

/* ============================================================
   APP STATE
   ============================================================ */
var CU=null;
var CR=null;
var CB=null;
var superTab='dashboard';
var cart=[];
var dashCharts={};
var superCharts={};
var currentSection='dashboard';

/* ============================================================
   ROLE DEFINITIONS
   ============================================================ */
var ROLES={
  mgr:{label:'Meneja',icon:'fa-user-tie',cls:'mgr',perms:['dashboard','products','ads','pos','employees','debts','reports','notifications','profile'],desc:'Msimamizi mkuu wa biashara',permList:['Dashboard kamili','Bidhaa zote','Matangazo','POS','Wafanyakazi','Madeni','Ripoti','Arifa','Wasifu']},
  sk:{label:'Mfanyakazi',icon:'fa-user',cls:'sk',perms:['dashboard','products','pos','notifications','profile'],desc:'Mfanyakazi wa kawaida',permList:['Dashboard','Bidhaa','POS','Arifa','Wasifu']},
  cash:{label:'Mkahisia',icon:'fa-cash-register',cls:'cash',perms:['pos','notifications','profile'],desc:'Mtu anayehusika na malipo',permList:['POS','Arifa','Wasifu']},
  sell:{label:'Muuzaji',icon:'fa-store',cls:'sell',perms:['dashboard','products','ads','pos','notifications','profile'],desc:'Muuzaji wa bidhaa',permList:['Dashboard','Bidhaa','Matangazo','POS','Arifa','Wasifu']}
};

var NAV_ITEMS=[
  {id:'dashboard',icon:'fa-chart-line',label:'Dashboard'},
  {id:'products',icon:'fa-boxes-stacked',label:'Bidhaa'},
  {id:'ads',icon:'fa-bullhorn',label:'Matangazo'},
  {id:'pos',icon:'fa-cash-register',label:'POS'},
  {id:'employees',icon:'fa-users',label:'Wafanyakazi'},
  {id:'debts',icon:'fa-hand-holding-dollar',label:'Madeni'},
  {id:'reports',icon:'fa-chart-pie',label:'Ripoti'},
  {id:'notifications',icon:'fa-bell',label:'Arifa'},
  {id:'profile',icon:'fa-user-cog',label:'Wasifu'}
];

var SUPER_TABS=[
  {id:'dashboard',label:'Dashboard',icon:'fa-chart-line'},
  {id:'users',label:'Watumiaji',icon:'fa-users'},
  {id:'businesses',label:'Biashara',icon:'fa-building'},
  {id:'ads',label:'Matangazo',icon:'fa-bullhorn'},
  {id:'products',label:'Bidhaa',icon:'fa-boxes-stacked'},
  {id:'activity',label:'Shughuli',icon:'fa-clock-rotate-left'}
];

var PROD_CATS=['Viboreshaji','Chakula','Nguo','Elektroniki','Dawa','Vifaa','Vingine'];
var EMP_COLORS=['#6c5ce7','#00b894','#e74c3c','#0984e3','#f39c12','#e84393','#00cec9'];

/* ============================================================
   UTILITIES
   ============================================================ */
function gid(){return 'id_'+Date.now()+'_'+Math.random().toString(36).substr(2,6)}
function fmtD(d){if(!d)return '-';var dt=new Date(d);return dt.toLocaleDateString('sw-KE',{day:'2-digit',month:'short',year:'numeric'})}
function fmtDT(d){if(!d)return '-';var dt=new Date(d);return dt.toLocaleDateString('sw-KE',{day:'2-digit',month:'short',year:'numeric',hour:'2-digit',minute:'2-digit'})}
function fmtM(n){return 'TSh '+Number(n||0).toLocaleString('sw-KE')}
function initials(n){return (n||'A').split(' ').map(function(w){return w[0]}).join('').toUpperCase().substr(0,2)}

function toast(msg,type){
  type=type||'i';
  var c=document.getElementById('toastC');
  var t=document.createElement('div');
  t.className='toast '+type;
  var icons={s:'fa-check-circle',e:'fa-times-circle',i:'fa-info-circle',w:'fa-exclamation-triangle'};
  t.innerHTML='<i class="fas '+(icons[type]||icons.i)+'"></i>'+msg;
  c.appendChild(t);
  setTimeout(function(){if(t.parentNode)t.parentNode.removeChild(t)},3500);
}

function destroyChart(obj,key){
  if(obj[key]){try{obj[key].destroy()}catch(e){}obj[key]=null}
}

function destroyAllCharts(obj){
  for(var k in obj){destroyChart(obj,k)}
}

/* ============================================================
   SCREEN MANAGEMENT
   ============================================================ */
function showScreen(id){
  var screens=['landingScreen','authScreen','roleScreen','appScreen','superLogin','superPanel'];
  for(var i=0;i<screens.length;i++){
    document.getElementById(screens[i]).classList.add('hidden');
  }
  document.getElementById(id).classList.remove('hidden');
  if(id==='landingScreen'){renderPublicShowcase();window.scrollTo(0,0)}
  if(id==='roleScreen'){renderRoleScreen();window.scrollTo(0,0)}
  if(id==='appScreen'){initApp();window.scrollTo(0,0)}
  if(id==='superPanel'){renderSuperPanel();window.scrollTo(0,0)}
  if(id==='authScreen'){hideAuthErr();window.scrollTo(0,0)}
  if(id==='superLogin'){document.getElementById('superErr').textContent='';window.scrollTo(0,0)}
}

/* ============================================================
   AUTH - Tab switching
   ============================================================ */
function switchAuthTab(tab){
  hideAuthErr();
  document.getElementById('loginForm').classList.remove('active');
  document.getElementById('registerForm').classList.remove('active');
  document.getElementById('authTabLogin').classList.remove('active');
  document.getElementById('authTabRegister').classList.remove('active');
  if(tab==='login'){
    document.getElementById('loginForm').classList.add('active');
    document.getElementById('authTabLogin').classList.add('active');
  }else{
    document.getElementById('registerForm').classList.add('active');
    document.getElementById('authTabRegister').classList.add('active');
  }
}

function showAuthErr(msg){
  var el=document.getElementById('authErr');
  document.getElementById('authErrText').textContent=msg;
  el.classList.add('show');
}
function hideAuthErr(){document.getElementById('authErr').classList.remove('show')}

/* ============================================================
   AUTH - Password toggle
   ============================================================ */
function togPw(inputId,btn){
  var inp=document.getElementById(inputId);
  var ico=btn.querySelector('i');
  if(inp.type==='password'){inp.type='text';ico.className='fas fa-eye-slash'}
  else{inp.type='password';ico.className='fas fa-eye'}
}

/* ============================================================
   AUTH - Password strength
   ============================================================ */
function checkPwStr(val){
  var bar=document.getElementById('pwBar');
  var s=0;
  if(val.length>=6)s++;
  if(val.length>=10)s++;
  if(/[A-Z]/.test(val))s++;
  if(/[0-9]/.test(val))s++;
  if(/[^A-Za-z0-9]/.test(val))s++;
  var colors=['#e74c3c','#e74c3c','#f39c12','#0984e3','#00b894','#00b894'];
  var widths=['0%','20%','40%','60%','80%','100%'];
  bar.style.width=widths[s];
  bar.style.background=colors[s];
}

/* ============================================================
   AUTH - Register step
   ============================================================ */
function regNext(){
  var name=document.getElementById('regName').value.trim();
  var email=document.getElementById('regEmail').value.trim();
  var phone=document.getElementById('regPhone').value.trim();
  if(!name||!email||!phone){showAuthErr('Tafadhali jaza sehemu zote zinazohitajika');return}
  if(!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)){showAuthErr('Barua pepe sio sahihi');return}
  var users=DB.g('users');
  for(var i=0;i<users.length;i++){if(users[i].email===email){showAuthErr('Barua pepe imesajiliwa tayari');return}}
  document.getElementById('regStep1').classList.add('hidden');
  document.getElementById('regStep2').classList.remove('hidden');
  document.getElementById('sd1').classList.remove('on');
  document.getElementById('sd2').classList.add('on');
}

/* ============================================================
   AUTH - Handle Login
   ============================================================ */
function handleLogin(e){
  e.preventDefault();
  hideAuthErr();
  var email=document.getElementById('loginEmail').value.trim();
  var pw=document.getElementById('loginPw').value;
  var users=DB.g('users');
  var found=null;
  for(var i=0;i<users.length;i++){
    if(users[i].email===email&&users[i].password===pw){found=users[i];break}
  }
  if(!found){showAuthErr('Barua pepe au nenosiri sio sahihi');return}
  if(found.status==='suspended'){showAuthErr('Akaunti yako imesitishwa. Wasiliana na msimamizi.');return}
  CU=found;
  CB=DB.go('biz_'+found.bizId);
  if(!CB){showAuthErr('Biashara haipatikani. Tafadhali jisajili tena.');return}
  showScreen('roleScreen');
}

/* ============================================================
   AUTH - Handle Register
   ============================================================ */
function handleRegister(e){
  e.preventDefault();
  hideAuthErr();
  var name=document.getElementById('regName').value.trim();
  var email=document.getElementById('regEmail').value.trim();
  var phone=document.getElementById('regPhone').value.trim();
  var bizName=document.getElementById('regBizName').value.trim();
  var bizCat=document.getElementById('regBizCat').value;
  var pw=document.getElementById('regPw').value;
  var pwc=document.getElementById('regPwC').value;
  if(!name||!email||!phone||!bizName||!bizCat||!pw||!pwc){showAuthErr('Tafadhali jaza sehemu zote');return}
  if(pw.length<6){showAuthErr('Nenosiri lazima iwe na angalau 6 herufi');return}
  if(pw!==pwc){showAuthErr('Nenosiri hazilingani');return}
  var users=DB.g('users');
  for(var i=0;i<users.length;i++){if(users[i].email===email){showAuthErr('Barua pepe imesajiliwa tayari');return}}
  var bizId=gid();
  var now=new Date().toISOString();
  var biz={id:bizId,name:bizName,category:bizCat,ownerId:'',logo:'',status:'active',createdAt:now,plan:'Bure'};
  var user={id:gid(),name:name,email:email,phone:phone,password:pw,bizId:bizId,role:'owner',status:'active',createdAt:now};
  biz.ownerId=user.id;
  DB.s('biz_'+bizId,biz);
  users.push(user);
  DB.s('users',users);
  logActivity('Jisajili','Mpya akaunti na biashara "'+bizName+'" imesajiliwa','success',user.id,user.name,bizId,bizName);
  CU=user;
  CB=biz;
  toast('Usajili umefanikiwa! Karibu BizBook.','s');
  showScreen('roleScreen');
}

/* ============================================================
   ROLE SELECTION
   ============================================================ */
function renderRoleScreen(){
  if(!CU||!CB)return;
  var info=document.getElementById('rsBizInfo');
  info.innerHTML='<div class="biz-ic"><i class="fas fa-building"></i></div><div><h3>'+CB.name+'</h3><p>'+CB.category+' &bull; '+CU.name+'</p></div>';
  var grid=document.getElementById('rsGrid');
  var html='';
  for(var k in ROLES){
    var r=ROLES[k];
    var perms='';
    for(var p=0;p<r.permList.length;p++){perms+='<li><i class="fas fa-check"></i> '+r.permList[p]+'</li>'}
    html+='<div class="rs-card '+r.cls+'"><div class="rs-icon"><i class="fas '+r.icon+'"></i></div><h4>'+r.label+'</h4><p class="rs-desc">'+r.desc+'</p><ul class="rs-perms">'+perms+'</ul><button class="rs-btn" onclick="selectRole(\''+k+'\')"><i class="fas fa-arrow-right"></i> Chagua</button></div>';
  }
  grid.innerHTML=html;
}

function selectRole(roleKey){
  CR=roleKey;
  showScreen('appScreen');
}

/* ============================================================
   LOGOUT
   ============================================================ */
function logout(){
  CU=null;CR=null;CB=null;cart=[];
  destroyAllCharts(dashCharts);
  dashCharts={};
  destroyAllCharts(superCharts);
  superCharts={};
  closeSidebar();
  closeNotifPanel();
  closeUserDd();
  showScreen('landingScreen');
  toast('Umeondoka kwa mafanikio.','i');
}

function superLogout(){
  destroyAllCharts(superCharts);
  superCharts={};
  superTab='dashboard';
  showScreen('landingScreen');
  toast('Umeondoka kama Super Admin.','i');
}

/* ============================================================
   APP INIT
   ============================================================ */
function initApp(){
  if(!CU||!CB)return;
  document.getElementById('tbBizName').textContent=CB.name;
  document.getElementById('tbAvatar').textContent=initials(CU.name);
  document.getElementById('tbName').textContent=CU.name;
  var roleLabels={mgr:'Meneja',sk:'Mfanyakazi',cash:'Mkahisia',sell:'Muuzaji'};
  document.getElementById('tbRole').textContent=roleLabels[CR]||CR;
  buildSidebar();
  updateNotifBadge();
  navTo('dashboard');
}

/* ============================================================
   SIDEBAR
   ============================================================ */
function buildSidebar(){
  var nav=document.getElementById('sbNav');
  var perms=ROLES[CR]?ROLES[CR].perms:['dashboard','profile'];
  var html='<div class="sb-lbl">Menyu Kuu</div>';
  for(var i=0;i<NAV_ITEMS.length;i++){
    var item=NAV_ITEMS[i];
    if(perms.indexOf(item.id)===-1)continue;
    var badge='';
    if(item.id==='notifications'){var cnt=countUnreadNotifs();if(cnt>0)badge='<span class="bdg">'+cnt+'</span>'}
    if(item.id==='debts'){var dc=countUnpaidDebts();if(dc>0)badge='<span class="bdg">'+dc+'</span>'}
    html+='<div class="ni'+(currentSection===item.id?' active':'')+'" onclick="navTo(\''+item.id+'\')"><i class="fas '+item.icon+'"></i>'+item.label+badge+'</div>';
  }
  html+='<div class="sb-lbl">Nyingine</div>';
  html+='<div class="ni" onclick="logout()"><i class="fas fa-sign-out-alt"></i>Ondoka</div>';
  nav.innerHTML=html;
}

function toggleSidebar(){
  var sb=document.getElementById('sidebar');
  var bd=document.getElementById('sbBd');
  sb.classList.toggle('open');
  bd.classList.toggle('show');
}
function closeSidebar(){
  document.getElementById('sidebar').classList.remove('open');
  document.getElementById('sbBd').classList.remove('show');
}

/* ============================================================
   NAVIGATION
   ============================================================ */
function navTo(sec){
  if(!ROLES[CR]||ROLES[CR].perms.indexOf(sec)===-1){toast('Huna ruhusa ya kufikia sehemu hii.','w');return}
  currentSection=sec;
  var sections=document.querySelectorAll('#mainContent .section');
  for(var i=0;i<sections.length;i++){sections[i].classList.remove('active')}
  var el=document.getElementById('sec-'+sec);
  if(el)el.classList.add('active');
  buildSidebar();
  closeSidebar();
  destroyAllCharts(dashCharts);
  dashCharts={};
  if(sec==='dashboard')renderDashboard();
  else if(sec==='products')renderProducts();
  else if(sec==='ads')renderAds();
  else if(sec==='pos')renderPOS();
  else if(sec==='employees')renderEmployees();
  else if(sec==='notifications')renderNotifications();
  else if(sec==='profile')renderProfile();
  else if(sec==='debts')renderDebts();
  else if(sec==='reports')renderReports();
}

/* ============================================================
   NOTIFICATIONS PANEL
   ============================================================ */
function toggleNotif(){
  document.getElementById('notifPanel').classList.toggle('show');
}
function closeNotifPanel(){document.getElementById('notifPanel').classList.remove('show')}

function toggleUserDd(){document.getElementById('userDd').classList.toggle('show')}
function closeUserDd(){document.getElementById('userDd').classList.remove('show')}

document.addEventListener('click',function(e){
  var dd=document.getElementById('userDd');
  var chip=document.querySelector('.u-chip');
  if(dd&&chip&&!chip.contains(e.target)){dd.classList.remove('show')}
});

function getNotifs(){
  var all=DB.g('notifications');
  var mine=[];
  for(var i=0;i<all.length;i++){if(all[i].userId===CU.id)mine.push(all[i])}
  mine.sort(function(a,b){return new Date(b.createdAt)-new Date(a.createdAt)});
  return mine;
}
function countUnreadNotifs(){
  var n=getNotifs();var c=0;for(var i=0;i<n.length;i++){if(!n[i].read)c++}return c;
}
function updateNotifBadge(){
  var c=countUnreadNotifs();
  document.getElementById('notifCnt').textContent=c;
  document.getElementById('notifCnt').style.display=c>0?'inline':'none';
}

function addNotification(userId,title,msg,type){
  var all=DB.g('notifications');
  all.push({id:gid(),userId:userId,title:title,message:msg,type:type||'info',read:false,createdAt:new Date().toISOString()});
  DB.s('notifications',all);
  updateNotifBadge();
}

function renderNotifList(){
  var n=getNotifs();
  var el=document.getElementById('nList');
  if(n.length===0){el.innerHTML='<div class="empty-s"><i class="fas fa-bell-slash"></i><p>Hakuna arifa</p></div>';return}
  var html='';
  var icons={info:'fa-info-circle',success:'fa-check-circle',warning:'fa-exclamation-triangle',danger:'fa-times-circle'};
  var colors={info:'var(--info)',success:'var(--success)',warning:'var(--warning)',danger:'var(--danger)'};
  for(var i=0;i<n.length;i++){
    var it=n[i];
    html+='<div class="notif-item" style="opacity:'+(it.read?'0.5':'1')+'" onclick="markNotifRead(\''+it.id+'\')"><i class="fas '+(icons[it.type]||icons.info)+'" style="color:'+(colors[it.type]||colors.info)+'"></i><div><h5>'+it.title+'</h5><p>'+it.message+'</p><p style="font-size:10px;color:var(--text3);margin-top:4px">'+fmtDT(it.createdAt)+'</p></div></div>';
  }
  el.innerHTML=html;
}

function markNotifRead(id){
  var all=DB.g('notifications');
  for(var i=0;i<all.length;i++){if(all[i].id===id){all[i].read=true;break}}
  DB.s('notifications',all);
  updateNotifBadge();
  renderNotifList();
  if(currentSection==='notifications')renderNotifications();
}

/* ============================================================
   ACTIVITY LOG
   ============================================================ */
function logActivity(action,details,type,userId,userName,bizId,bizName){
  var all=DB.g('activityLog');
  all.push({id:gid(),userId:userId||'',userName:userName||'',bizId:bizId||'',bizName:bizName||'',action:action,details:details,type:type||'info',createdAt:new Date().toISOString()});
  DB.s('activityLog',all);
}

/* ============================================================
   DASHBOARD
   ============================================================ */
function renderDashboard(){
  if(!CB)return;
  var prods=DB.g('products');
  var ads=DB.g('ads');
  var emps=DB.g('employees');
  var sales=DB.g('sales');
  var debts=DB.g('debts');
  var bp=[],ba=[],be=[],bs=[],bd=[];
  for(var i=0;i<prods.length;i++){if(prods[i].bizId===CB.id)bp.push(prods[i])}
  for(var i=0;i<ads.length;i++){if(ads[i].bizId===CB.id)ba.push(ads[i])}
  for(var i=0;i<emps.length;i++){if(emps[i].bizId===CB.id)be.push(emps[i])}
  for(var i=0;i<sales.length;i++){if(sales[i].bizId===CB.id)bs.push(sales[i])}
  for(var i=0;i<debts.length;i++){if(debts[i].bizId===CB.id)bd.push(debts[i])}
  var totalRev=0;for(var i=0;i<bs.length;i++)totalRev+=Number(bs[i].total)||0;
  var unpaidDebt=0;for(var i=0;i<bd.length;i++){if(bd[i].status!=='paid')unpaidDebt+=Number(bd[i].amount)-Number(bd[i].paid||0)}
  var todayStr=new Date().toISOString().slice(0,10);
  var todaySales=0;for(var i=0;i<bs.length;i++){if(bs[i].createdAt&&bs[i].createdAt.slice(0,10)===todayStr)todaySales++}
  var el=document.getElementById('sec-dashboard');
  el.innerHTML='<div class="sh"><div><h2>Dashboard</h2><p>Maoni ya jumla ya biashara yako - '+CB.name+'</p></div><div class="sh-acts"><button class="btn btn-o btn-sm" onclick="navTo(\'reports\')"><i class="fas fa-chart-pie"></i> Ripoti</button></div></div>'+
  '<div class="metrics">'+
  '<div class="mc g"><div class="mc-icon"><i class="fas fa-boxes-stacked"></i></div><h3>'+bp.length+'</h3><p>Bidhaa</p></div>'+
  '<div class="mc a"><div class="mc-icon"><i class="fas fa-bullhorn"></i></div><h3>'+ba.length+'</h3><p>Matangazo</p></div>'+
  '<div class="mc pu"><div class="mc-icon"><i class="fas fa-users"></i></div><h3>'+be.length+'</h3><p>Wafanyakazi</p></div>'+
  '<div class="mc b"><div class="mc-icon"><i class="fas fa-cash-register"></i></div><h3>'+bs.length+'</h3><p>Mauzo Yote</p></div>'+
  '<div class="mc g"><div class="mc-icon"><i class="fas fa-money-bill-trend-up"></i></div><h3>'+fmtM(totalRev)+'</h3><p>Mapato</p></div>'+
  '<div class="mc r"><div class="mc-icon"><i class="fas fa-hand-holding-dollar"></i></div><h3>'+fmtM(unpaidDebt)+'</h3><p>Madeni</p></div>'+
  '</div>'+
  '<div class="ch-g"><div class="ch-c"><h4><i class="fas fa-chart-bar"></i>Mauzo ya Miezi 7 Ilizopita</h4><div class="ch-box"><canvas id="dashSalesChart"></canvas></div></div><div class="ch-c"><h4><i class="fas fa-chart-doughnut"></i>Mauzo kwa Njia ya Malipo</h4><div class="ch-box"><canvas id="dashPayChart"></canvas></div></div></div>'+
  '<div class="tw"><div class="sh" style="margin-bottom:12px"><h2 style="font-size:16px"><i class="fas fa-clock-rotate-left" style="color:var(--primary2);margin-right:8px"></i>Mauzo ya Karibuni</h2></div><div class="ts">'+
  (bs.length===0?'<div class="empty-s"><i class="fas fa-receipt"></i><p>Hakuna mauzo bado</p></div>':
  '<table><thead><tr><th>ID</th><th>Items</th><th>Jumla</th><th>Njia</th><th>Tarehe</th></tr></thead><tbody>'+
  bs.slice(0,10).map(function(s){return '<tr><td>#'+s.id.slice(-6).toUpperCase()+'</td><td>'+(s.items?s.items.length:0)+' items</td><td style="color:var(--success);font-weight:600">'+fmtM(s.total)+'</td><td>'+(s.paymentMethod||'Cash')+'</td><td>'+fmtDT(s.createdAt)+'</td></tr>'}).join('')+
  '</tbody></table>')+'</div></div>';
  renderDashCharts(bs);
}

function renderDashCharts(sales){
  if(typeof Chart==='undefined')return;
  var months=[];var now=new Date();
  for(var i=6;i>=0;i--){var d=new Date(now.getFullYear(),now.getMonth()-i,1);months.push(d.toLocaleDateString('sw-KE',{month:'short'}))}
  var monthlyData=[0,0,0,0,0,0,0];
  for(var i=0;i<sales.length;i++){
    var sd=new Date(sales.createdAt);
    for(var m=6;m>=0;m--){
      var td=new Date(now.getFullYear(),now.getMonth()-m,1);
      if(sd.getMonth()===td.getMonth()&&sd.getFullYear()===td.getFullYear()){monthlyData[6-m]+=Number(sales.total)||0}
    }
  }
  var ctx1=document.getElementById('dashSalesChart');
  if(ctx1){
    dashCharts.sales=new Chart(ctx1,{type:'bar',data:{labels:months,datasets:[{label:'Mapato (TSh)',data:monthlyData,backgroundColor:'rgba(108,92,231,0.6)',borderColor:'#6c5ce7',borderWidth:1,borderRadius:6}]},options:{responsive:true,maintainAspectRatio:false,plugins:{legend:{display:false}},scales:{x:{ticks:{color:'#9a9ab0',font:{size:11}},grid:{color:'rgba(255,255,255,0.05)'}},y:{ticks:{color:'#9a9ab0',font:{size:11}},grid:{color:'rgba(255,255,255,0.05)'}}}}});
  }
  var payMethods={Cash:0,'M-Pesa':0,Card:0};
  for(var i=0;i<sales.length;i++){var pm=sales[i].paymentMethod||'Cash';payMethods[pm]=(payMethods[pm]||0)+1}
  var ctx2=document.getElementById('dashPayChart');
  if(ctx2){
    var pKeys=Object.keys(payMethods);var pVals=Object.values(payMethods);
    var pColors=['#00b894','#0984e3','#f39c12','#e74c3c','#a29bfe'];
    dashCharts.pay=new Chart(ctx2,{type:'doughnut',data:{labels:pKeys,datasets:[{data:pVals,backgroundColor:pColors.slice(0,pKeys.length),borderWidth:0}]},options:{responsive:true,maintainAspectRatio:false,plugins:{legend:{position:'bottom',labels:{color:'#9a9ab0',font:{size:11},padding:16}}}}});
  }
}

/* ============================================================
   PRODUCTS
   ============================================================ */
function getBizProducts(){
  var all=DB.g('products');var r=[];
  for(var i=0;i<all.length;i++){if(all[i].bizId===CB.id)r.push(all[i])}
  return r;
}

function renderProducts(){
  var prods=getBizProducts();
  var el=document.getElementById('sec-products');
  el.innerHTML='<div class="sh"><div><h2>Bidhaa</h2><p>Simamia bidhaa zako ('+prods.length+')</p></div><div class="sh-acts"><button class="btn btn-p" onclick="openProductModal()"><i class="fas fa-plus"></i> Ongeza Bidhaa</button></div></div>'+
  '<div class="sb-bar"><i class="fas fa-search"></i><input placeholder="Tafuta bidhaa..." oninput="filterProducts(this.value)"/></div>'+
  '<div id="productsGrid"></div>';
  renderProductsGrid(prods);
}

function renderProductsGrid(prods){
  var el=document.getElementById('productsGrid');
  if(!el)return;
  if(prods.length===0){el.innerHTML='<div class="empty-s"><i class="fas fa-boxes-stacked"></i><p>Hakuna bidhaa bado. Bonyeza "Ongeza Bidhaa" kuanza.</p></div>';return}
  var html='<div class="tw"><div class="ts"><table><thead><tr><th>Picha</th><th>Jina</th><th>Category</th><th>Bei ya Kununua</th><th>Bei ya Kuuzia</th><th>Stock</th><th>Tarehe</th><th>Matendo</th></tr></thead><tbody>';
  for(var i=0;i<prods.length;i++){
    var p=prods[i];
    var stockColor=p.stock>10?'var(--success)':p.stock>0?'var(--warning)':'var(--danger)';
    html+='<tr><td>'+(p.image?'<img src="'+p.image+'" class="tbl-thumb"/>':'<div class="tbl-thumb" style="display:inline-flex;align-items:center;justify-content:center"><i class="fas fa-image" style="color:var(--text3)"></i></div>')+'</td><td><strong>'+p.name+'</strong></td><td><span class="status-badge active">'+(p.category||'-')+'</span></td><td>'+fmtM(p.cost)+'</td><td style="color:var(--success);font-weight:700">'+fmtM(p.price)+'</td><td style="color:'+stockColor+';font-weight:600">'+p.stock+'</td><td>'+fmtD(p.createdAt)+'</td><td><button class="btn btn-o btn-xs" onclick="openProductModal(\''+p.id+'\')"><i class="fas fa-edit"></i></button> <button class="btn btn-d btn-xs" onclick="deleteProduct(\''+p.id+'\')"><i class="fas fa-trash"></i></button></td></tr>';
  }
  html+='</tbody></table></div></div>';
  el.innerHTML=html;
}

function filterProducts(q){
  var prods=getBizProducts();
  q=q.toLowerCase();
  if(q){prods=prods.filter(function(p){return p.name.toLowerCase().indexOf(q)!==-1||(p.category||'').toLowerCase().indexOf(q)!==-1})}
  renderProductsGrid(prods);
}

function openProductModal(id){
  var p=null;
  if(id){var all=DB.g('products');for(var i=0;i<all.length;i++){if(all[i].id===id){p=all[i];break}}}
  var title=p?'Hariri Bidhaa':'Ongeza Bidhaa Mpya';
  var cats='';
  for(var i=0;i<PROD_CATS.length;i++){cats+='<option value="'+PROD_CATS[i]+'"'+(p&&p.category===PROD_CATS[i]?' selected':'')+'>'+PROD_CATS[i]+'</option>'}
  var html='<div class="modal-head"><h3><i class="fas fa-box" style="color:var(--primary2);margin-right:8px"></i>'+title+'</h3><button onclick="closeModal()"><i class="fas fa-times"></i></button></div>'+
  '<form onsubmit="saveProduct(event,\''+(id||'')+'\')">'+
  '<div class="fg"><label>Jina la Bidhaa <span class="req">*</span></label><input class="fi" type="text" id="pName" required value="'+(p?p.name:'')+'" placeholder="Jina la bidhaa"/></div>'+
  '<div class="fg"><label>Category <span class="req">*</span></label><select class="fi" id="pCat" required><option value="">Chagua...</option>'+cats+'</select></div>'+
  '<div class="fg"><label>Bei ya Kununua (TSh) <span class="req">*</span></label><input class="fi" type="number" id="pCost" required value="'+(p?p.cost:'')+'" placeholder="0" min="0"/></div>'+
  '<div class="fg"><label>Bei ya Kuuzia (TSh) <span class="req">*</span></label><input class="fi" type="number" id="pPrice" required value="'+(p?p.price:'')+'" placeholder="0" min="0"/></div>'+
  '<div class="fg"><label>Stock <span class="req">*</span></label><input class="fi" type="number" id="pStock" required value="'+(p?p.stock:'0')+'" placeholder="0" min="0"/></div>'+
  '<div class="fg"><label>URL ya Picha</label><input class="fi" type="text" id="pImg" value="'+(p&&p.image?p.image:'')+'" placeholder="https://..."/></div>'+
  '<div class="fg"><label> Maelezo</label><textarea class="fi" id="pDesc" rows="3" placeholder="Maelezo ya bidhaa...">'+(p&&p.description?p.description:'')+'</textarea></div>'+
  '<div class="modal-actions"><button type="button" class="btn btn-o" onclick="closeModal()">Ghairi</button><button type="submit" class="btn btn-p"><i class="fas fa-save"></i> Hifadhi</button></div>'+
  '</form>';
  openModal(html);
}

function saveProduct(e,id){
  e.preventDefault();
  var all=DB.g('products');
  var data={
    name:document.getElementById('pName').value.trim(),
    category:document.getElementById('pCat').value,
    cost:Number(document.getElementById('pCost').value)||0,
    price:Number(document.getElementById('pPrice').value)||0,
    stock:Number(document.getElementById('pStock').value)||0,
    image:document.getElementById('pImg').value.trim(),
    description:document.getElementById('pDesc').value.trim()
  };
  if(id){
    for(var i=0;i<all.length;i++){
      if(all[i].id===id){
        for(var k in data)all[i][k]=data[k];
        break;
      }
    }
    toast('Bidhaa imesasishwa.','s');
    logActivity('Hariri Bidhaa','Bidhaa "'+data.name+'" imesasishwa','info',CU.id,CU.name,CB.id,CB.name);
  }else{
    all.push({id:gid(),bizId:CB.id,createdAt:new Date().toISOString(),status:'active'});
    var last=all[all.length-1];
    for(var k in data)last[k]=data[k];
    toast('Bidhaa imeongezwa.','s');
    logActivity('Ongeza Bidhaa','Bidhaa mpya "'+data.name+'" imeongezwa','success',CU.id,CU.name,CB.id,CB.name);
    addNotification(CU.id,'Bidhaa Mpya','Bidhaa "'+data.name+'" imeongezwa kwa mafanikio.','success');
  }
  DB.s('products',all);
  closeModal();
  renderProducts();
}

function deleteProduct(id){
  var all=DB.g('products');
  var pName='';
  for(var i=0;i<all.length;i++){if(all[i].id===id){pName=all[i].name;all.splice(i,1);break}}
  DB.s('products',all);
  toast('Bidhaa imefutwa.','e');
  logActivity('Futa Bidhaa','Bidhaa "'+pName+'" imefutwa','danger',CU.id,CU.name,CB.id,CB.name);
  renderProducts();
}

/* ============================================================
   ADS
   ============================================================ */
function getBizAds(){
  var all=DB.g('ads');var r=[];
  for(var i=0;i<all.length;i++){if(all[i].bizId===CB.id)r.push(all[i])}
  return r;
}

function renderAds(){
  var ads=getBizAds();
  var el=document.getElementById('sec-ads');
  el.innerHTML='<div class="sh"><div><h2>Matangazo</h2><p>Tangaza biashara yako ('+ads.length+')</p></div><div class="sh-acts"><button class="btn btn-p" onclick="openAdModal()"><i class="fas fa-plus"></i> Ongeza Tangazo</button></div></div>'+
  '<div class="sb-bar"><i class="fas fa-search"></i><input placeholder="Tafuta tangazo..." oninput="filterAds(this.value)"/></div>'+
  '<div id="adsGrid"></div>';
  renderAdsGrid(ads);
}

function renderAdsGrid(ads){
  var el=document.getElementById('adsGrid');
  if(!el)return;
  if(ads.length===0){el.innerHTML='<div class="empty-s"><i class="fas fa-bullhorn"></i><p>Hakuna matangazo bado.</p></div>';return}
  var html='';
  for(var i=0;i<ads.length;i++){
    var a=ads[i];
    var statusCls=a.status==='active'?'active':a.status==='featured'?'featured':a.status==='paused'?'paused':'hidden-st';
    var statusLabel=a.status==='active'?'Amefunguliwa':a.status==='featured'?'Maalum':a.status==='paused'?'Imesitishwa':'Imefichwa';
    html+='<div class="pub-ad-card" style="margin-bottom:16px;display:flex;flex-direction:column">'+
    (a.image?'<img src="'+a.image+'" class="pub-ad-img"/>':'<div class="pub-ad-img-placeholder"><i class="fas fa-bullhorn"></i></div>')+
    '<div class="pub-ad-body"><div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:6px"><h4>'+a.title+'</h4><span class="status-badge '+statusCls+'">'+statusLabel+'</span></div>'+
    '<p>'+(a.description||'Hakuna maelezo')+'</p>'+
    '<div style="display:flex;gap:16px;margin-top:8px;font-size:11px;color:var(--text3)"><span><i class="fas fa-eye"></i> '+(a.impressions||0)+' views</span><span><i class="fas fa-mouse-pointer"></i> '+(a.clicks||0)+' clicks</span>'+(a.budget?'<span><i class="fas fa-wallet"></i> '+fmtM(a.budget)+'</span>':'')+'</div>'+
    '<div style="display:flex;gap:6px;margin-top:10px"><button class="btn btn-o btn-xs" onclick="openAdModal(\''+a.id+'\')"><i class="fas fa-edit"></i> Hariri</button>'+
    (a.status==='active'?'<button class="btn btn-w btn-xs" onclick="pauseAd(\''+a.id+'\')"><i class="fas fa-pause"></i> Sitisha</button>':'<button class="btn btn-s btn-xs" onclick="activateAd(\''+a.id+'\')"><i class="fas fa-play"></i> Anza</button>')+
    '<button class="btn btn-d btn-xs" onclick="deleteAd(\''+a.id+'\')"><i class="fas fa-trash"></i> Futa</button></div>'+
    '</div></div>';
  }
  el.innerHTML=html;
}

function filterAds(q){
  var ads=getBizAds();q=q.toLowerCase();
  if(q)ads=ads.filter(function(a){return a.title.toLowerCase().indexOf(q)!==-1});
  renderAdsGrid(ads);
}

function openAdModal(id){
  var a=null;
  if(id){var all=DB.g('ads');for(var i=0;i<all.length;i++){if(all[i].id===id){a=all[i];break}}}
  var title=a?'Hariri Tangazo':'Ongeza Tangazo Mpya';
  var html='<div class="modal-head"><h3><i class="fas fa-bullhorn" style="color:var(--primary2);margin-right:8px"></i>'+title+'</h3><button onclick="closeModal()"><i class="fas fa-times"></i></button></div>'+
  '<form onsubmit="saveAd(event,\''+(id||'')+'\')">'+
  '<div class="fg"><label>Kichwa <span class="req">*</span></label><input class="fi" type="text" id="adTitle" required value="'+(a?a.title:'')+'" placeholder="Kichwa cha tangazo"/></div>'+
  '<div class="fg"><label>Maelezo</label><textarea class="fi" id="adDesc" rows="3" placeholder="Maelezo ya tangazo...">'+(a&&a.description?a.description:'')+'</textarea></div>'+
  '<div class="fg"><label>URL ya Picha</label><input class="fi" type="text" id="adImg" value="'+(a&&a.image?a.image:'')+'" placeholder="https://..."/></div>'+
  '<div class="fg"><label>Bajeti (TSh)</label><input class="fi" type="number" id="adBudget" value="'+(a&&a.budget?a.budget:'')+'" placeholder="0" min="0"/></div>'+
  '<div class="fg"><label>Hali</label><select class="fi" id="adStatus"><option value="active"'+(a&&a.status==='active'?' selected':'')+'>Amefunguliwa</option><option value="paused"'+(a&&a.status==='paused'?' selected':'')+'>Imesitishwa</option><option value="featured"'+(a&&a.status==='featured'?' selected':'')+'>Maalum</option></select></div>'+
  '<div class="modal-actions"><button type="button" class="btn btn-o" onclick="closeModal()">Ghairi</button><button type="submit" class="btn btn-p"><i class="fas fa-save"></i> Hifadhi</button></div>'+
  '</form>';
  openModal(html);
}

function saveAd(e,id){
  e.preventDefault();
  var all=DB.g('ads');
  var data={title:document.getElementById('adTitle').value.trim(),description:document.getElementById('adDesc').value.trim(),image:document.getElementById('adImg').value.trim(),budget:Number(document.getElementById('adBudget').value)||0,status:document.getElementById('adStatus').value};
  if(id){
    for(var i=0;i<all.length;i++){if(all[i].id===id){for(var k in data)all[i][k]=data[k];break}}
    toast('Tangazo limesasishwa.','s');
    logActivity('Hariri Tangazo','Tangazo "'+data.title+'" limesasishwa','info',CU.id,CU.name,CB.id,CB.name);
  }else{
    all.push({id:gid(),bizId:CB.id,clicks:0,impressions:0,createdAt:new Date().toISOString()});
    var last=all[all.length-1];for(var k in data)last[k]=data[k];
    toast('Tangazo limeongezwa.','s');
    logActivity('Ongeza Tangazo','Tangazo mpya "'+data.title+'" limeongezwa','success',CU.id,CU.name,CB.id,CB.name);
  }
  DB.s('ads',all);
  closeModal();
  renderAds();
}

function pauseAd(id){changeAdStatus(id,'paused')}
function activateAd(id){changeAdStatus(id,'active')}
function changeAdStatus(id,status){
  var all=DB.g('ads');
  for(var i=0;i<all.length;i++){if(all[i].id===id){all[i].status=status;break}}
  DB.s('ads',all);
  toast('Tangazo limesasishwa.','s');
  renderAds();
}

function deleteAd(id){
  showConfirm({title:'Futa Tangazo?',message:'Huwezi kurudisha tangazo hili baada ya kufuta.',iconClass:'danger',icon:'fa-trash',confirmText:'Futa',confirmClass:'btn-d',onConfirm:function(){
    var all=DB.g('ads');
    for(var i=0;i<all.length;i++){if(all[i].id===id){all.splice(i,1);break}}
    DB.s('ads',all);
    toast('Tangazo limefutwa.','e');
    logActivity('Futa Tangazo','Tangazo limefutwa','danger',CU.id,CU.name,CB.id,CB.name);
    renderAds();
  }});
}

/* ============================================================
   POS
   ============================================================ */
function renderPOS(){
  var prods=getBizProducts().filter(function(p){return p.stock>0});
  var el=document.getElementById('sec-pos');
  var prodHtml='';
  for(var i=0;i<prods.length;i++){
    var p=prods[i];
    prodHtml+='<div class="pos-p-card" onclick="addToCart(\''+p.id+'\')"><h5>'+p.name+'</h5><div class="pos-p-price">'+fmtM(p.price)+'</div><div class="pos-p-stock">Stock: '+p.stock+'</div></div>';
  }
  if(prods.length===0)prodHtml='<div class="empty-s" style="grid-column:1/-1"><i class="fas fa-boxes-stacked"></i><p>Hakuna bidhaa kwenye stock. Ongeza bidhaa kwanza.</p></div>';
  el.innerHTML='<div class="sh"><div><h2>POS - Uza bidhaa</h2><p>Chagua bidhaa na uza haraka</p></div></div>'+
  '<div class="pos-layout"><div class="pos-products" id="posProds">'+prodHtml+'</div>'+
  '<div class="pos-cart"><div class="pos-cart-head"><i class="fas fa-shopping-cart" style="color:var(--primary2);margin-right:8px"></i>Gitaa la Manunuzi <span id="cartCount" style="margin-left:auto;font-size:12px;color:var(--text3)">(0)</span></div>'+
  '<div class="pos-cart-body" id="cartBody"><div class="empty-s" style="padding:30px 10px"><i class="fas fa-shopping-cart"></i><p>Gitaa ni tupu</p></div></div>'+
  '<div class="pos-cart-foot"><div class="pos-total"><span>Jumla:</span><span id="cartTotal">TSh 0</span></div>'+
  '<div class="fg" style="margin-bottom:10px"><label>Njia ya Malipo</label><select class="fi" id="payMethod" style="padding:8px 12px"><option>Cash</option><option>M-Pesa</option><option>Card</option></select></div>'+
  '<div style="display:flex;gap:8px"><button class="btn btn-d" style="flex:1" onclick="clearCart()"><i class="fas fa-trash"></i> Futa</button><button class="btn btn-s" style="flex:2" onclick="completeSale()"><i class="fas fa-check"></i> Maliza Mnada</button></div>'+
  '</div></div></div>';
}

function addToCart(productId){
  var allProds=DB.g('products');
  var prod=null;
  for(var i=0;i<allProds.length;i++){if(allProds[i].id===productId){prod=allProds[i];break}}
  if(!prod)return;
  var found=false;
  for(var i=0;i<cart.length;i++){
    if(cart[i].productId===productId){
      if(cart[i].qty>=prod.stock){toast('Stock haitoshi.','w');return}
      cart[i].qty++;
      found=true;break;
    }
  }
  if(!found)cart.push({productId:productId,name:prod.name,price:prod.price,qty:1,maxStock:prod.stock});
  renderCart();
}

function updateCartQty(idx,delta){
  if(!cart[idx])return;
  cart[idx].qty+=delta;
  if(cart[idx].qty<=0)cart.splice(idx,1);
  else if(cart[idx].qty>cart[idx].maxStock){cart[idx].qty=cart[idx].maxStock;toast('Stock haitoshi.','w')}
  renderCart();
}

function removeFromCart(idx){cart.splice(idx,1);renderCart()}

function clearCart(){cart=[];renderCart()}

function renderCart(){
  var body=document.getElementById('cartBody');
  var totalEl=document.getElementById('cartTotal');
  var countEl=document.getElementById('cartCount');
  if(!body)return;
  if(cart.length===0){
    body.innerHTML='<div class="empty-s" style="padding:30px 10px"><i class="fas fa-shopping-cart"></i><p>Gitaa ni tupu</p></div>';
    totalEl.textContent='TSh 0';
    countEl.textContent='(0)';
    return;
  }
  var html='';var total=0;
  for(var i=0;i<cart.length;i++){
    var it=cart[i];
    var sub=it.price*it.qty;
    total+=sub;
    html+='<div class="cart-item"><div class="cart-item-info"><h6>'+it.name+'</h6><span>'+fmtM(it.price)+' x '+it.qty+'</span></div>'+
    '<div class="cart-qty"><button onclick="updateCartQty('+i+',-1)">-</button><span>'+it.qty+'</span><button onclick="updateCartQty('+i+',1)">+</button></div>'+
    '<div class="cart-item-price">'+fmtM(sub)+'</div>'+
    '<button class="cart-item-rm" onclick="removeFromCart('+i+')"><i class="fas fa-times"></i></button></div>';
  }
  body.innerHTML=html;
  totalEl.textContent=fmtM(total);
  countEl.textContent='('+cart.length+')';
}

function completeSale(){
  if(cart.length===0){toast('Gitaa ni tupu.','w');return}
  var pm=document.getElementById('payMethod');
  var payMethod=pm?pm.value:'Cash';
  var total=0;
  var items=[];
  for(var i=0;i<cart.length;i++){
    var it=cart[i];
    var sub=it.price*it.qty;
    total+=sub;
    items.push({productId:it.productId,name:it.name,price:it.price,qty:it.qty,subtotal:sub});
  }
  var saleId=gid();
  var sale={id:saleId,bizId:CB.id,items:items,total:total,paymentMethod:payMethod,createdBy:CU.name,createdAt:new Date().toISOString()};
  var sales=DB.g('sales');
  sales.push(sale);
  DB.s('sales',sales);
  var allProds=DB.g('products');
  for(var i=0;i<cart.length;i++){
    for(var j=0;j<allProds.length;j++){
      if(allProds[j].id===cart[i].productId){allProds[j].stock-=cart[i].qty;break}
    }
  }
  DB.s('products',allProds);
  logActivity('Mnada','Mnada wa '+fmtM(total)+' umefanywa kwa njia ya '+payMethod,'success',CU.id,CU.name,CB.id,CB.name);
  addNotification(CU.id,'Mnada Mpya','Mnada wa '+fmtM(total)+' umefanywa kwa mafanikio.','success');
  showReceipt(sale);
  cart=[];
  renderPOS();
  toast('Mnada umefanikiwa!','s');
}

function showReceipt(sale){
  var html='<div class="modal-head"><h3><i class="fas fa-receipt" style="color:var(--success);margin-right:8px"></i>Resiti</h3><button onclick="closeModal()"><i class="fas fa-times"></i></button></div>'+
  '<div class="receipt-content"><h3>'+CB.name+'</h3><p style="text-align:center;font-size:10px;margin-bottom:8px">'+CB.category+'</p>'+
  '<div class="rc-divider"></div>'+
  '<div class="rc-line"><span>#</span><span>'+sale.id.slice(-8).toUpperCase()+'</span></div>'+
  '<div class="rc-line"><span>Tarehe</span><span>'+fmtDT(sale.createdAt)+'</span></div>'+
  '<div class="rc-line"><span>Mfanyakazi</span><span>'+sale.createdBy+'</span></div>'+
  '<div class="rc-divider"></div>';
  for(var i=0;i<sale.items.length;i++){
    var it=sale.items[i];
    html+='<div class="rc-line"><span>'+it.name+' x'+it.qty+'</span><span>'+fmtM(it.subtotal)+'</span></div>';
  }
  html+='<div class="rc-divider"></div>'+
  '<div class="rc-line"><span>Njia ya Malipo</span><span>'+sale.paymentMethod+'</span></div>'+
  '<div class="rc-line rc-total"><span>JUMLA</span><span>'+fmtM(sale.total)+'</span></div>'+
  '<div class="rc-divider"></div>'+
  '<p style="text-align:center;font-size:10px">Asante kwa kununua!</p></div>'+
  '<div class="modal-actions"><button class="btn btn-o" onclick="closeModal()">Funga</button><button class="btn btn-p" onclick="window.print()"><i class="fas fa-print"></i> Chapisha</button></div>';
  openModal(html);
}

/* ============================================================
   EMPLOYEES
   ============================================================ */
function getBizEmployees(){
  var all=DB.g('employees');var r=[];
  for(var i=0;i<all.length;i++){if(all[i].bizId===CB.id)r.push(all[i])}
  return r;
}

function renderEmployees(){
  var emps=getBizEmployees();
  var el=document.getElementById('sec-employees');
  el.innerHTML='<div class="sh"><div><h2>Wafanyakazi</h2><p>Simamia timu yako ('+emps.length+')</p></div><div class="sh-acts"><button class="btn btn-p" onclick="openEmployeeModal()"><i class="fas fa-plus"></i> Ongeza Mfanyakazi</button></div></div>'+
  '<div class="sb-bar"><i class="fas fa-search"></i><input placeholder="Tafuta mfanyakazi..." oninput="filterEmployees(this.value)"/></div>'+
  '<div id="empContent"></div>';
  renderEmpContent(emps);
}

function renderEmpContent(emps){
  var el=document.getElementById('empContent');
  if(!el)return;
  if(emps.length===0){el.innerHTML='<div class="empty-s"><i class="fas fa-users"></i><p>Hakuna wafanyakazi bado.</p></div>';return}
  var html='<div class="emp-grid">';
  for(var i=0;i<emps.length;i++){
    var e=emps[i];
    var color=EMP_COLORS[i%EMP_COLORS.length];
    var roleMap={Mfanyakazi:'Mfanyakazi',Mkahisia:'Mkahisia',Muuzaji:'Muuzaji',Meneja:'Meneja'};
    html+='<div class="emp-card"><div class="emp-card-head"><div class="emp-av" style="background:'+color+'">'+initials(e.name)+'</div><div><h4>'+e.name+'</h4><p>'+(e.email||e.phone||'-')+'</p></div></div>'+
    '<div class="emp-card-body"><span class="emp-tag role">'+(roleMap[e.role]||e.role)+'</span><span class="emp-tag status'+(e.status==='inactive'?' inactive':'')+'">'+(e.status==='inactive'?'Haijafanya kazi':'Anafanya kazi')+'</span>'+(e.salary?'<span class="emp-tag" style="background:var(--warning-bg);color:var(--warning)">'+fmtM(e.salary)+'/mo</span>':'')+'</div>'+
    '<div class="emp-card-foot"><button class="btn btn-o btn-xs" onclick="openEmployeeModal(\''+e.id+'\')"><i class="fas fa-edit"></i></button> <button class="btn btn-d btn-xs" onclick="deleteEmployee(\''+e.id+'\')"><i class="fas fa-trash"></i></button></div></div>';
  }
  html+='</div>';
  el.innerHTML=html;
}

function filterEmployees(q){
  var emps=getBizEmployees();q=q.toLowerCase();
  if(q)emps=emps.filter(function(e){return e.name.toLowerCase().indexOf(q)!==-1||(e.role||'').toLowerCase().indexOf(q)!==-1});
  renderEmpContent(emps);
}

function openEmployeeModal(id){
  var e=null;
  if(id){var all=DB.g('employees');for(var i=0;i<all.length;i++){if(all[i].id===id){e=all[i];break}}}
  var title=e?'Hariri Mfanyakazi':'Ongeza Mfanyakazi Mpya';
  var html='<div class="modal-head"><h3><i class="fas fa-user-plus" style="color:var(--primary2);margin-right:8px"></i>'+title+'</h3><button onclick="closeModal()"><i class="fas fa-times"></i></button></div>'+
  '<form onsubmit="saveEmployee(event,\''+(id||'')+'\')">'+
  '<div class="fg"><label>Jina <span class="req">*</span></label><input class="fi" type="text" id="empName" required value="'+(e?e.name:'')+'" placeholder="Jina la mfanyakazi"/></div>'+
  '<div class="fg"><label>Barua Pepe</label><input class="fi" type="email" id="empEmail" value="'+(e&&e.email?e.email:'')+'" placeholder="barua@mfano.com"/></div>'+
  '<div class="fg"><label>Simu</label><input class="fi" type="tel" id="empPhone" value="'+(e&&e.phone?e.phone:'')+'" placeholder="+255..."/></div>'+
  '<div class="fg"><label>Jukumu <span class="req">*</span></label><select class="fi" id="empRole" required><option value="Mfanyakazi"'+(e&&e.role==='Mfanyakazi'?' selected':'')+'>Mfanyakazi</option><option value="Mkahisia"'+(e&&e.role==='Mkahisia'?' selected':'')+'>Mkahisia</option><option value="Muuzaji"'+(e&&e.role==='Muuzaji'?' selected':'')+'>Muuzaji</option><option value="Meneja"'+(e&&e.role==='Meneja'?' selected':'')+'>Meneja</option></select></div>'+
  '<div class="fg"><label>Mshahara (TSh)</label><input class="fi" type="number" id="empSalary" value="'+(e&&e.salary?e.salary:'')+'" placeholder="0" min="0"/></div>'+
  '<div class="fg"><label>Hali</label><select class="fi" id="empStatus"><option value="active"'+(e&&e.status==='active'?' selected':'')+'>Anafanya kazi</option><option value="inactive"'+(e&&e.status==='inactive'?' selected':'')+'>Haijafanya kazi</option></select></div>'+
  '<div class="modal-actions"><button type="button" class="btn btn-o" onclick="closeModal()">Ghairi</button><button type="submit" class="btn btn-p"><i class="fas fa-save"></i> Hifadhi</button></div>'+
  '</form>';
  openModal(html);
}

function saveEmployee(e,id){
  e.preventDefault();
  var all=DB.g('employees');
  var data={name:document.getElementById('empName').value.trim(),email:document.getElementById('empEmail').value.trim(),phone:document.getElementById('empPhone').value.trim(),role:document.getElementById('empRole').value,salary:Number(document.getElementById('empSalary').value)||0,status:document.getElementById('empStatus').value};
  if(id){
    for(var i=0;i<all.length;i++){if(all[i].id===id){for(var k in data)all[i][k]=data[k];break}}
    toast('Mfanyakazi amesasishwa.','s');
    logActivity('Hariri Mfanyakazi','Mfanyakazi "'+data.name+'" amesasishwa','info',CU.id,CU.name,CB.id,CB.name);
  }else{
    all.push({id:gid(),bizId:CB.id,createdAt:new Date().toISOString()});
    var last=all[all.length-1];for(var k in data)last[k]=data[k];
    toast('Mfanyakazi ameongezwa.','s');
    logActivity('Ongeza Mfanyakazi','Mfanyakazi mpya "'+data.name+'" ameongezwa','success',CU.id,CU.name,CB.id,CB.name);
  }
  DB.s('employees',all);
  closeModal();
  renderEmployees();
}

function deleteEmployee(id){
  showConfirm({title:'Futa Mfanyakazi?',message:'Huwezi kurudisha baada ya kufuta.',iconClass:'danger',icon:'fa-trash',confirmText:'Futa',confirmClass:'btn-d',onConfirm:function(){
    var all=DB.g('employees');
    for(var i=0;i<all.length;i++){if(all[i].id===id){all.splice(i,1);break}}
    DB.s('employees',all);
    toast('Mfanyakazi amefutwa.','e');
    renderEmployees();
  }});
}

/* ============================================================
   NOTIFICATIONS SECTION
   ============================================================ */
function renderNotifications(){
  var notifs=getNotifs();
  var el=document.getElementById('sec-notifications');
  el.innerHTML='<div class="sh"><div><h2>Arifa</h2><p>'+(notifs.length)+' arifa zako</p></div><div class="sh-acts"><button class="btn btn-o btn-sm" onclick="markAllRead()"><i class="fas fa-check-double"></i> Soma Zote</button></div></div>'+
  '<div id="notifSectionList"></div>';
  renderNotifSectionList(notifs);
}

function renderNotifSectionList(notifs){
  var el=document.getElementById('notifSectionList');
  if(!el)return;
  if(notifs.length===0){el.innerHTML='<div class="empty-s"><i class="fas fa-bell-slash"></i><p>Hakuna arifa.</p></div>';return}
  var icons={info:'fa-info-circle',success:'fa-check-circle',warning:'fa-exclamation-triangle',danger:'fa-times-circle'};
  var colors={info:'var(--info)',success:'var(--success)',warning:'var(--warning)',danger:'var(--danger)'};
  var html='';
  for(var i=0;i<notifs.length;i++){
    var n=notifs[i];
    html+='<div class="notif-item" style="opacity:'+(n.read?'0.5':'1')+';cursor:pointer" onclick="markNotifRead(\''+n.id+'\')"><i class="fas '+(icons[n.type]||icons.info)+'" style="color:'+(colors[n.type]||colors.info)+'"></i><div style="flex:1"><h5>'+n.title+'</h5><p>'+n.message+'</p><p style="font-size:10px;color:var(--text3);margin-top:4px">'+fmtDT(n.createdAt)+'</p></div>'+(n.read?'':'<span class="status-badge active">Mpya</span>')+'</div>';
  }
  el.innerHTML=html;
}

function markAllRead(){
  var all=DB.g('notifications');
  for(var i=0;i<all.length;i++){if(all[i].userId===CU.id)all[i].read=true}
  DB.s('notifications',all);
  updateNotifBadge();
  renderNotifList();
  renderNotifications();
  toast('Arifa zote zimesomwa.','s');
}

/* ============================================================
   PROFILE
   ============================================================ */
function renderProfile(){
  var el=document.getElementById('sec-profile');
  var logoHtml=CB.logo?'<img src="'+CB.logo+'" alt="Logo"/>':'<i class="fas fa-image"></i>';
  el.innerHTML='<div class="sh"><div><h2>Wasifu</h2><p>Sasisha maelezo yako na ya biashara</p></div></div>'+
  '<div class="prof-grid">'+
  '<div class="prof-left"><div class="logo-card"><h3 style="margin-bottom:14px">Logo ya Biashara</h3><div class="logo-prev" onclick="document.getElementById(\'logoInput\').click()" id="logoPrev">'+logoHtml+'</div><input type="file" id="logoInput" accept="image/*" style="display:none" onchange="handleLogoUpload(this)"/><p style="font-size:11px;color:var(--text3);margin-top:8px">Bonyeza kupakia logo</p></div>'+
  '<div style="margin-top:24px"><h3 style="margin-bottom:12px">Maelezo ya Akaunti</h3><div class="super-detail-row"><span class="label">Barua Pepe</span><span class="value">'+CU.email+'</span></div><div class="super-detail-row"><span class="label">Simu</span><span class="value">'+(CU.phone||'-')+'</span></div><div class="super-detail-row"><span class="label">Jukumu la Sasa</span><span class="value">'+CR+'</span></div><div class="super-detail-row"><span class="label">Iliyoundwa</span><span class="value">'+fmtD(CU.createdAt)+'</span></div></div></div>'+
  '<div class="prof-right"><h3><i class="fas fa-edit" style="color:var(--primary2);margin-right:8px"></i>Sasisha Wasifu</h3>'+
  '<form onsubmit="saveProfile(event)">'+
  '<div class="fg"><label>Jina Lako</label><input class="fi" type="text" id="profName" value="'+CU.name+'" required/></div>'+
  '<div class="fg"><label>Simu</label><input class="fi" type="tel" id="profPhone" value="'+(CU.phone||'')+'"/></div>'+
  '<h3 style="margin-top:20px"><i class="fas fa-building" style="color:var(--primary2);margin-right:8px"></i>Maelezo ya Biashara</h3>'+
  '<div class="fg"><label>Jina la Biashara</label><input class="fi" type="text" id="profBizName" value="'+CB.name+'" required/></div>'+
  '<div class="fg"><label>Aina ya Biashara</label><select class="fi" id="profBizCat">'+
  ['Duka la Viboreshaji','Duka la Chakula','Duka la Nguo','Biashara ya Mtandaoni','Huduma','Ufundi','Biashara Nyingine'].map(function(c){return '<option'+(CB.category===c?' selected':'')+'>'+c+'</option>'}).join('')+
  '</select></div>'+
  '<div class="fg"><label>Nenosiri Jipya (acha tupu kama hutaki kubadilisha)</label><input class="fi" type="password" id="profPw" placeholder="Nenosiri jipya"/></div>'+
  '<div class="modal-actions" style="margin-top:20px"><button type="submit" class="btn btn-p"><i class="fas fa-save"></i> Hifadhi Mabadiliko</button></div>'+
  '</form></div></div>';
}

function handleLogoUpload(input){
  if(!input.files||!input.files[0])return;
  var reader=new FileReader();
  reader.onload=function(e){
    CB.logo=e.target.result;
    DB.so('biz_'+CB.id,CB);
    document.getElementById('logoPrev').innerHTML='<img src="'+e.target.result+'" alt="Logo"/>';
    toast('Logo imehifadhiwa.','s');
  };
  reader.readAsDataURL(input.files[0]);
}

function saveProfile(e){
  e.preventDefault();
  var newName=document.getElementById('profName').value.trim();
  var newPhone=document.getElementById('profPhone').value.trim();
  var newBizName=document.getElementById('profBizName').value.trim();
  var newBizCat=document.getElementById('profBizCat').value;
  var newPw=document.getElementById('profPw').value;
  CU.name=newName;
  CU.phone=newPhone;
  if(newPw&&newPw.length>=6)CU.password=newPw;
  CB.name=newBizName;
  CB.category=newBizCat;
  var users=DB.g('users');
  for(var i=0;i<users.length;i++){if(users[i].id===CU.id){users[i].name=CU.name;users[i].phone=CU.phone;if(newPw&&newPw.length>=6)users[i].password=newPw;break}}
  DB.s('users',users);
  DB.so('biz_'+CB.id,CB);
  document.getElementById('tbBizName').textContent=CB.name;
  document.getElementById('tbAvatar').textContent=initials(CU.name);
  document.getElementById('tbName').textContent=CU.name;
  logActivity('Sasisha Wasifu','Wasifu umesasishwa','info',CU.id,CU.name,CB.id,CB.name);
  toast('Wasifu umesasishwa.','s');
  renderProfile();
}

/* ============================================================
   DEBTS
   ============================================================ */
function getBizDebts(){
  var all=DB.g('debts');var r=[];
  for(var i=0;i<all.length;i++){if(all[i].bizId===CB.id)r.push(all[i])}
  return r;
}
function countUnpaidDebts(){
  var d=getBizDebts();var c=0;for(var i=0;i<d.length;i++){if(d[i].status!=='paid')c++}return c;
}

function renderDebts(){
  var debts=getBizDebts();
  var totalDebt=0;for(var i=0;i<debts.length;i++)totalDebt+=Number(debts[i].amount)||0;
  var paidTotal=0;for(var i=0;i<debts.length;i++)paidTotal+=Number(debts[i].paid)||0;
  var el=document.getElementById('sec-debts');
  el.innerHTML='<div class="sh"><div><h2>Madeni</h2><p>Jumla ya madeni: '+fmtM(totalDebt)+' | Imelipwa: '+fmtM(paidTotal)+'</p></div><div class="sh-acts"><button class="btn btn-p" onclick="openDebtModal()"><i class="fas fa-plus"></i> Ongeza Deni</button></div></div>'+
  '<div class="sb-bar"><i class="fas fa-search"></i><input placeholder="Tafuta deni..." oninput="filterDebts(this.value)"/></div>'+
  '<div id="debtsContent"></div>';
  renderDebtsContent(debts);
}

function renderDebtsContent(debts){
  var el=document.getElementById('debtsContent');
  if(!el)return;
  if(debts.length===0){el.innerHTML='<div class="empty-s"><i class="fas fa-hand-holding-dollar"></i><p>Hakuna madeni bado.</p></div>';return}
  var html='<div class="tw"><div class="ts"><table><thead><tr><th>Mteja</th><th>Simu</th><th>Kiasi</th><th>Imelipwa</th><th>Baki</th><th>Hali</th><th>Tarehe ya Kulipa</th><th>Matendo</th></tr></thead><tbody>';
  for(var i=0;i<debts.length;i++){
    var d=debts[i];
    var baki=(Number(d.amount)||0)-(Number(d.paid)||0);
    var statusCls=d.status==='paid'?'paid':'unpaid';
    html+='<tr><td><strong>'+d.customerName+'</strong></td><td>'+(d.customerPhone||'-')+'</td><td>'+fmtM(d.amount)+'</td><td style="color:var(--success)">'+fmtM(d.paid||0)+'</td><td style="color:'+(baki>0?'var(--danger)':'var(--success)')+';font-weight:600">'+fmtM(baki)+'</td><td><span class="status-badge '+statusCls+'">'+(d.status==='paid'?'Imelipwa':'Hajalipa')+'</span></td><td>'+(d.dueDate?fmtD(d.dueDate):'-')+'</td><td>'+(d.status!=='paid'?'<button class="btn btn-s btn-xs" onclick="openPayDebtModal(\''+d.id+'\')"><i class="fas fa-money-bill"></i> Lipa</button> ':'')+'<button class="btn btn-d btn-xs" onclick="deleteDebt(\''+d.id+'\')"><i class="fas fa-trash"></i></button></td></tr>';
  }
  html+='</tbody></table></div></div>';
  el.innerHTML=html;
}

function filterDebts(q){
  var debts=getBizDebts();q=q.toLowerCase();
  if(q)debts=debts.filter(function(d){return d.customerName.toLowerCase().indexOf(q)!==-1});
  renderDebtsContent(debts);
}

function openDebtModal(){
  var html='<div class="modal-head"><h3><i class="fas fa-hand-holding-dollar" style="color:var(--primary2);margin-right:8px"></i>Ongeza Deni</h3><button onclick="closeModal()"><i class="fas fa-times"></i></button></div>'+
  '<form onsubmit="saveDebt(event)">'+
  '<div class="fg"><label>Jina la Mteja <span class="req">*</span></label><input class="fi" type="text" id="debtName" required placeholder="Jina la mteja"/></div>'+
  '<div class="fg"><label>Simu ya Mteja</label><input class="fi" type="tel" id="debtPhone" placeholder="+255..."/></div>'+
  '<div class="fg"><label>Kiasi cha Deni (TSh) <span class="req">*</span></label><input class="fi" type="number" id="debtAmount" required placeholder="0" min="0"/></div>'+
  '<div class="fg"><label>Tarehe ya Kulipa</label><input class="fi" type="date" id="debtDue"/></div>'+
  '<div class="fg"><label>Notes</label><textarea class="fi" id="debtNotes" rows="2" placeholder="Maelezo..."></textarea></div>'+
  '<div class="modal-actions"><button type="button" class="btn btn-o" onclick="closeModal()">Ghairi</button><button type="submit" class="btn btn-p"><i class="fas fa-save"></i> Hifadhi</button></div>'+
  '</form>';
  openModal(html);
}

function saveDebt(e){
  e.preventDefault();
  var all=DB.g('debts');
  all.push({id:gid(),bizId:CB.id,customerName:document.getElementById('debtName').value.trim(),customerPhone:document.getElementById('debtPhone').value.trim(),amount:Number(document.getElementById('debtAmount').value)||0,paid:0,status:'unpaid',dueDate:document.getElementById('debtDue').value,notes:document.getElementById('debtNotes').value.trim(),createdAt:new Date().toISOString()});
  DB.s('debts',all);
  toast('Deni limeongezwa.','s');
  logActivity('Ongeza Deni','Deni la '+fmtM(all[all.length-1].amount)+' kwa '+all[all.length-1].customerName,'warning',CU.id,CU.name,CB.id,CB.name);
  closeModal();
  renderDebts();
  buildSidebar();
}

function openPayDebtModal(id){
  var all=DB.g('debts');
  var d=null;
  for(var i=0;i<all.length;i++){if(all[i].id===id){d=all[i];break}}
  if(!d)return;
  var baki=(Number(d.amount)||0)-(Number(d.paid)||0);
  var html='<div class="modal-head"><h3><i class="fas fa-money-bill" style="color:var(--success);margin-right:8px"></i>Lipa Deni</h3><button onclick="closeModal()"><i class="fas fa-times"></i></button></div>'+
  '<div class="super-detail-row"><span class="label">Mteja</span><span class="value">'+d.customerName+'</span></div>'+
  '<div class="super-detail-row"><span class="label">Kiasi Chanzo</span><span class="value">'+fmtM(d.amount)+'</span></div>'+
  '<div class="super-detail-row"><span class="label">Imelipwa</span><span class="value" style="color:var(--success)">'+fmtM(d.paid||0)+'</span></div>'+
  '<div class="super-detail-row"><span class="label">Baki</span><span class="value" style="color:var(--danger);font-weight:700">'+fmtM(baki)+'</span></div>'+
  '<form onsubmit="payDebt(event,\''+id+'\')" style="margin-top:16px">'+
  '<div class="fg"><label>Kiasi cha Kulipa (TSh) <span class="req">*</span></label><input class="fi" type="number" id="payAmount" required max="'+baki+'" min="1" placeholder="'+baki+'"/></div>'+
  '<div class="modal-actions"><button type="button" class="btn btn-o" onclick="closeModal()">Ghairi</button><button type="submit" class="btn btn-s"><i class="fas fa-check"></i> Lipa</button></div>'+
  '</form>';
  openModal(html);
}

function payDebt(e,id){
  e.preventDefault();
  var payAmt=Number(document.getElementById('payAmount').value)||0;
  if(payAmt<=0){toast('Ingiza kiasi sahihi.','w');return}
  var all=DB.g('debts');
  for(var i=0;i<all.length;i++){
    if(all[i].id===id){
      all[i].paid=(Number(all[i].paid)||0)+payAmt;
      var baki=(Number(all[i].amount)||0)-all[i].paid;
      if(baki<=0){all[i].paid=all[i].amount;all[i].status='paid'}
      break;
    }
  }
  DB.s('debts',all);
  toast('Malipo yamefanyika.','s');
  logActivity('Lipa Deni','Malipo ya '+fmtM(payAmt)+' yamefanyika','success',CU.id,CU.name,CB.id,CB.name);
  closeModal();
  renderDebts();
  buildSidebar();
}

function deleteDebt(id){
  showConfirm({title:'Futa Deni?',message:'Huwezi kurudisha deni hili.',iconClass:'danger',icon:'fa-trash',confirmText:'Futa',confirmClass:'btn-d',onConfirm:function(){
    var all=DB.g('debts');
    for(var i=0;i<all.length;i++){if(all[i].id===id){all.splice(i,1);break}}
    DB.s('debts',all);
    toast('Deni limefutwa.','e');
    renderDebts();
    buildSidebar();
  }});
}

/* ============================================================
   REPORTS
   ============================================================ */
function renderReports(){
  var sales=DB.g('sales');
  var bs=[];
  for(var i=0;i<sales.length;i++){if(sales[i].bizId===CB.id)bs.push(sales[i])}
  var totalRev=0;for(var i=0;i<bs.length;i++)totalRev+=Number(bs[i].total)||0;
  var avgSale=bs.length>0?Math.round(totalRev/bs.length):0;
  var todayStr=new Date().toISOString().slice(0,10);
  var todayRev=0;var todayCount=0;
  for(var i=0;i<bs.length;i++){if(bs[i].createdAt&&bs[i].createdAt.slice(0,10)===todayStr){todayRev+=Number(bs[i].total)||0;todayCount++}}
  var el=document.getElementById('sec-reports');
  el.innerHTML='<div class="sh"><div><h2>Ripoti</h2><p>Ripoti za kina za biashara yako</p></div><div class="sh-acts"><button class="btn btn-o btn-sm" onclick="renderReports()"><i class="fas fa-refresh"></i> Sasisha</button></div></div>'+
  '<div class="metrics">'+
  '<div class="mc g"><div class="mc-icon"><i class="fas fa-money-bill-trend-up"></i></div><h3>'+fmtM(totalRev)+'</h3><p>Mapato Yote</p></div>'+
  '<div class="mc a"><div class="mc-icon"><i class="fas fa-receipt"></i></div><h3>'+bs.length+'</h3><p>Mauzo Yote</p></div>'+
  '<div class="mc b"><div class="mc-icon"><i class="fas fa-calculator"></i></div><h3>'+fmtM(avgSale)+'</h3><p>Kiwango cha Mnada</p></div>'+
  '<div class="mc pu"><div class="mc-icon"><i class="fas fa-calendar-day"></i></div><h3>'+fmtM(todayRev)+'</h3><p>Mapato ya Leo ('+todayCount+')</p></div>'+
  '</div>'+
  '<div class="ch-g"><div class="ch-c"><h4><i class="fas fa-chart-line"></i>Mapato ya Miezi 7</h4><div class="ch-box"><canvas id="repRevChart"></canvas></div></div><div class="ch-c"><h4><i class="fas fa-chart-bar"></i>Mauzo kwa Siku (Mwisho 14)</h4><div class="ch-box"><canvas id="repDayChart"></canvas></div></div></div>'+
  '<div class="tw"><div class="sh" style="margin-bottom:12px"><h2 style="font-size:16px"><i class="fas fa-trophy" style="color:var(--warning);margin-right:8px"></i>Bidhaa Zinazouza Zaidi</h2></div><div class="ts">'+
  renderTopProducts(bs)+
  '</div></div>';
  renderReportCharts(bs);
}

function renderTopProducts(sales){
  var prodMap={};
  for(var i=0;i<sales.length;i++){
    var items=sales[i].items||[];
    for(var j=0;j<items.length;j++){
      var it=items[j];
      if(!prodMap[it.name])prodMap[it.name]={name:it.name,qty:0,revenue:0};
      prodMap[it.name].qty+=it.qty;
      prodMap[it.name].revenue+=it.subtotal;
    }
  }
  var sorted=Object.values(prodMap).sort(function(a,b){return b.revenue-a.revenue});
  if(sorted.length===0)return '<div class="empty-s"><i class="fas fa-trophy"></i><p>Hakuna data bado.</p></div>';
  var html
