```html
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="theme-color" content="#182334">
  <title>AMB — Thoughtful finds, delivered</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700;800&family=Manrope:wght@400;500;600;700;800&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

  <style>
    :root {
      color-scheme: light;
      --ink: #172536;
      --ink-soft: #344558;
      --muted: #6c7a88;
      --line: #e8edf1;
      --paper: #f6f8fa;
      --white: #fff;
      --accent: #d55d43;
      --accent-dark: #b94730;
      --accent-pale: #fff0eb;
      --green: #137e69;
      --gold: #e0a72f;
      --radius: 18px;
      --shadow: 0 8px 28px rgba(23, 37, 54, .07);
      --shadow-hover: 0 18px 42px rgba(23, 37, 54, .14);
      --content: 1240px;
    }

    *, *::before, *::after { box-sizing: border-box; }
    html { scroll-behavior: smooth; scroll-padding-top: 110px; }
    body {
      margin: 0;
      background: var(--paper);
      color: var(--ink);
      font: 16px/1.6 "DM Sans", system-ui, sans-serif;
      -webkit-font-smoothing: antialiased;
    }
    img { display: block; max-width: 100%; }
    a { color: inherit; text-decoration: none; }
    button, input { font: inherit; }
    button { color: inherit; }
    button:focus-visible, a:focus-visible, input:focus-visible {
      outline: 3px solid rgba(213, 93, 67, .58);
      outline-offset: 3px;
    }
    .container { width: min(100% - 40px, var(--content)); margin-inline: auto; }
    .sr-only {
      position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px;
      overflow: hidden; clip: rect(0, 0, 0, 0); white-space: nowrap; border: 0;
    }

    .announcement {
      padding: 8px 15px;
      background: var(--ink);
      color: #fff;
      text-align: center;
      font-size: 12px;
      letter-spacing: .04em;
    }
    .announcement strong { color: #ffd1c5; }
    header {
      position: sticky;
      top: 0;
      z-index: 20;
      background: rgba(255,255,255,.96);
      border-bottom: 1px solid var(--line);
      backdrop-filter: blur(14px);
    }
    .header-main {
      min-height: 76px;
      display: grid;
      grid-template-columns: auto minmax(220px, 1fr) auto;
      align-items: center;
      gap: 32px;
    }
    .brand {
      display: inline-flex;
      align-items: center;
      gap: 10px;
      font: 800 22px/1 "Manrope", sans-serif;
      letter-spacing: -.8px;
      white-space: nowrap;
    }
    .brand-mark {
      width: 36px; height: 36px;
      display: grid; place-items: center;
      color: #fff; background: var(--accent);
      border-radius: 12px;
      font-size: 16px;
    }
    .brand-accent { color: var(--accent); }

    .search {
      height: 46px;
      display: flex;
      align-items: center;
      gap: 10px;
      padding: 0 14px;
      background: #f1f4f6;
      border: 1px solid transparent;
      border-radius: 13px;
      color: var(--muted);
      transition: background .2s, border-color .2s, box-shadow .2s;
    }
    .search:focus-within {
      background: #fff;
      border-color: var(--accent);
      box-shadow: 0 0 0 4px rgba(213,93,67,.1);
    }
    .search input {
      width: 100%;
      min-width: 0;
      padding: 10px 0;
      color: var(--ink);
      background: transparent;
      border: 0;
      outline: 0;
    }
    .search input::placeholder { color: #8a96a2; }
    .search button {
      padding: 6px;
      border: 0;
      background: transparent;
      color: var(--muted);
      cursor: pointer;
    }
    .header-actions { display: flex; align-items: center; gap: 7px; }
    .icon-action {
      position: relative;
      width: 42px; height: 42px;
      display: grid; place-items: center;
      border: 0;
      border-radius: 50%;
      background: transparent;
      color: var(--ink-soft);
      cursor: pointer;
      transition: background .2s, color .2s;
    }
    .icon-action:hover { background: #f1f4f6; color: var(--accent); }
    .cart-count {
      position: absolute;
      top: 0; right: -1px;
      min-width: 18px; height: 18px;
      display: grid; place-items: center;
      padding: 0 4px;
      border: 2px solid #fff;
      border-radius: 20px;
      background: var(--accent);
      color: #fff;
      font-size: 10px;
      font-weight: 800;
    }

    .desktop-nav { border-top: 1px solid #f0f2f4; }
    .desktop-nav ul {
      min-height: 44px;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 35px;
      margin: 0; padding: 0;
      list-style: none;
    }
    .desktop-nav a {
      display: inline-flex;
      align-items: center;
      min-height: 44px;
      color: var(--muted);
      font-size: 13px;
      font-weight: 600;
      transition: color .2s;
    }
    .desktop-nav a:hover, .desktop-nav a[aria-current="page"] { color: var(--accent); }

    .mobile-menu-button { display: none; }
    .mobile-menu { display: none; }

    .hero {
      position: relative;
      isolation: isolate;
      min-height: 490px;
      display: flex;
      align-items: center;
      margin-top: 22px;
      overflow: hidden;
      border-radius: 24px;
      background: #25384a;
      color: #fff;
    }
    .hero::before {
      position: absolute;
      z-index: -2;
      inset: 0;
      content: "";
      background: url("https://images.unsplash.com/photo-1555529669-e69e7aa0ba9a?auto=format&fit=crop&w=1800&q=85") center 48% / cover;
      opacity: .52;
    }
    .hero::after {
      position: absolute;
      z-index: -1;
      inset: 0;
      content: "";
      background: linear-gradient(90deg, rgba(16,31,47,.92), rgba(16,31,47,.7) 48%, rgba(16,31,47,.08));
    }
    .hero-content { width: min(650px, 75%); padding: 68px 7%; }
    .eyebrow {
      display: inline-flex;
      align-items: center;
      gap: 8px;
      padding: 7px 13px;
      border: 1px solid rgba(255,255,255,.22);
      border-radius: 30px;
      background: rgba(255,255,255,.1);
      color: #ffe0d7;
      font-size: 12px;
      font-weight: 700;
      letter-spacing: .06em;
      text-transform: uppercase;
    }
    .hero h1 {
      max-width: 620px;
      margin: 19px 0 15px;
      font: 800 clamp(42px, 5.5vw, 68px)/1.06 "Manrope", sans-serif;
      letter-spacing: -2.8px;
    }
    .hero p { max-width: 510px; margin: 0; color: rgba(255,255,255,.82); font-size: 17px; }
    .hero-actions { display: flex; flex-wrap: wrap; gap: 12px; margin-top: 28px; }
    .button {
      min-height: 46px;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      gap: 9px;
      padding: 0 20px;
      border: 1px solid transparent;
      border-radius: 12px;
      font-size: 14px;
      font-weight: 700;
      cursor: pointer;
      transition: transform .2s, background .2s, border-color .2s, box-shadow .2s;
    }
    .button:hover { transform: translateY(-2px); }
    .button-primary { color: #fff; background: var(--accent); box-shadow: 0 8px 18px rgba(213,93,67,.24); }
    .button-primary:hover { background: var(--accent-dark); }
    .button-light { color: var(--ink); background: #fff; }
    .button-light:hover { background: #f5f7f8; }
    .button-dark { color: #fff; background: var(--ink); }
    .button-dark:hover { background: #2c3f53; }
    .button-outline { color: var(--ink); background: transparent; border-color: var(--line); }
    .button-outline:hover { background: #f7f8fa; }

    .trust-row {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      margin-top: 20px;
      padding: 17px 22px;
      border: 1px solid var(--line);
      border-radius: 15px;
      background: #fff;
      box-shadow: 0 4px 15px rgba(23,37,54,.025);
    }
    .trust-item { display: flex; align-items: center; justify-content: center; gap: 11px; padding: 4px 12px; }
    .trust-item + .trust-item { border-left: 1px solid var(--line); }
    .trust-icon { color: var(--accent); font-size: 18px; }
    .trust-item strong { display: block; font-size: 13px; }
    .trust-item span { display: block; color: var(--muted); font-size: 11px; }

    section { scroll-margin-top: 130px; }
    .section { padding: 70px 0; }
    .section-head {
      display: flex;
      align-items: end;
      justify-content: space-between;
      gap: 18px;
      margin-bottom: 27px;
    }
    .section-kicker {
      margin: 0 0 5px;
      color: var(--accent);
      font-size: 11px;
      font-weight: 800;
      letter-spacing: .1em;
      text-transform: uppercase;
    }
    .section-title {
      margin: 0;
      font: 800 clamp(26px, 3vw, 35px)/1.2 "Manrope", sans-serif;
      letter-spacing: -1px;
    }
    .section-subtitle { margin: 7px 0 0; color: var(--muted); font-size: 14px; }
    .text-link {
      display: inline-flex;
      align-items: center;
      gap: 8px;
      color: var(--accent);
      font-size: 13px;
      font-weight: 700;
      white-space: nowrap;
    }
    .text-link:hover { color: var(--accent-dark); }

    .categories-grid { display: grid; grid-template-columns: repeat(6, 1fr); gap: 15px; }
    .category-card {
      min-height: 152px;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      padding: 18px 10px;
      border: 1px solid var(--line);
      border-radius: 16px;
      background: #fff;
      text-align: center;
      cursor: pointer;
      transition: transform .2s, border-color .2s, box-shadow .2s;
    }
    .category-card:hover, .category-card:focus-visible {
      transform: translateY(-4px);
      border-color: #f0b7a9;
      box-shadow: var(--shadow);
    }
    .category-icon {
      width: 54px; height: 54px;
      display: grid; place-items: center;
      margin-bottom: 11px;
      border-radius: 17px;
      background: var(--accent-pale);
      color: var(--accent);
      font-size: 20px;
    }
    .category-card strong { font-size: 13px; }
    .category-card small { margin-top: 2px; color: var(--muted); font-size: 11px; }

    .products-section { padding-top: 14px; }
    .product-toolbar { display: flex; align-items: center; justify-content: space-between; gap: 12px; margin: 0 0 18px; }
    .result-count { color: var(--muted); font-size: 13px; }
    .clear-search { padding: 7px 10px; border: 1px solid var(--line); border-radius: 9px; background: #fff; color: var(--ink-soft); font-size: 12px; cursor: pointer; }
    .products-grid { display: grid; grid-template-columns: repeat(4, minmax(0,1fr)); gap: 18px; }
    .product-card {
      min-width: 0;
      display: flex;
      flex-direction: column;
      overflow: hidden;
      border: 1px solid var(--line);
      border-radius: 17px;
      background: #fff;
      transition: transform .22s, box-shadow .22s, border-color .22s;
    }
    .product-card:hover { transform: translateY(-5px); border-color: #f0c6bb; box-shadow: var(--shadow-hover); }
    .product-image {
      position: relative;
      overflow: hidden;
      aspect-ratio: 1 / .9;
      background: #eef1f4;
    }
    .product-image img { width: 100%; height: 100%; object-fit: cover; transition: transform .45s; }
    .product-card:hover .product-image img { transform: scale(1.045); }
    .product-badge {
      position: absolute;
      top: 12px; left: 12px;
      padding: 5px 9px;
      border-radius: 30px;
      background: var(--ink);
      color: #fff;
      font-size: 10px;
      font-weight: 800;
      letter-spacing: .04em;
      text-transform: uppercase;
    }
    .product-badge.sale { background: #f5d991; color: #57400b; }
    .wishlist-button {
      position: absolute;
      top: 10px; right: 10px;
      width: 37px; height: 37px;
      display: grid; place-items: center;
      border: 0;
      border-radius: 50%;
      background: rgba(255,255,255,.95);
      color: #586779;
      box-shadow: 0 3px 12px rgba(23,37,54,.11);
      cursor: pointer;
      transition: color .2s, transform .2s, background .2s;
    }
    .wishlist-button:hover { transform: scale(1.06); color: var(--accent); }
    .wishlist-button[aria-pressed="true"] { color: var(--accent); background: var(--accent-pale); }
    .product-info { flex: 1; display: flex; flex-direction: column; padding: 15px 15px 10px; }
    .product-category { color: #84909c; font-size: 10px; font-weight: 800; letter-spacing: .08em; text-transform: uppercase; }
    .product-title { min-height: 2.7em; margin: 4px 0 7px; font-size: 14px; font-weight: 700; line-height: 1.35; }
    .rating { display: flex; align-items: center; gap: 6px; margin-bottom: 9px; color: var(--gold); font-size: 12px; }
    .rating span { color: var(--muted); font-size: 11px; }
    .price-row { display: flex; align-items: baseline; flex-wrap: wrap; gap: 8px; margin-top: auto; }
    .price { font: 800 17px "Manrope", sans-serif; }
    .old-price { color: #929ca6; font-size: 12px; text-decoration: line-through; }
    .product-footer { padding: 0 15px 15px; }
    .add-button {
      width: 100%;
      min-height: 41px;
      display: flex; align-items: center; justify-content: center; gap: 8px;
      border: 0; border-radius: 11px;
      background: var(--ink); color: #fff;
      font-size: 12px; font-weight: 700;
      cursor: pointer;
      transition: background .2s, transform .2s;
    }
    .add-button:hover { background: var(--accent); transform: translateY(-1px); }
    .add-button.added { background: var(--green); }
    .empty-state { grid-column: 1/-1; padding: 50px 20px; border: 1px dashed #d7dfe5; border-radius: 16px; color: var(--muted); text-align: center; }

    .deal-card {
      display: grid;
      grid-template-columns: 1fr 1fr;
      overflow: hidden;
      border-radius: 22px;
      background: #fff;
      box-shadow: var(--shadow);
    }
    .deal-image { min-height: 360px; background: #e9edf0; }
    .deal-image img { width: 100%; height: 100%; object-fit: cover; }
    .deal-copy { display: flex; flex-direction: column; align-items: flex-start; justify-content: center; padding: clamp(28px, 5vw, 62px); }
    .deal-label { padding: 6px 11px; border-radius: 30px; background: #fff2d1; color: #765410; font-size: 11px; font-weight: 800; text-transform: uppercase; letter-spacing: .05em; }
    .deal-copy h3 { margin: 15px 0 8px; font: 800 clamp(26px,3.6vw,40px)/1.16 "Manrope", sans-serif; letter-spacing: -1px; }
    .deal-copy p { margin: 0; color: var(--muted); font-size: 14px; }
    .deal-price { display: flex; align-items: baseline; gap: 10px; margin: 18px 0; }
    .deal-price strong { font: 800 25px "Manrope", sans-serif; }
    .deal-price del { color: #909ba6; font-size: 14px; }
    .timer { display: flex; gap: 9px; margin: 4px 0 22px; }
    .timer-unit { min-width: 54px; padding: 8px; border-radius: 10px; background: #f1f4f6; text-align: center; }
    .timer-unit strong { display: block; font: 800 18px "Manrope", sans-serif; }
    .timer-unit span { display: block; color: var(--muted); font-size: 9px; font-weight: 700; letter-spacing: .05em; text-transform: uppercase; }

    .reviews-grid { display: grid; grid-template-columns: repeat(4, minmax(0,1fr)); gap: 15px; }
    .review-card { padding: 21px; border: 1px solid var(--line); border-radius: 16px; background: #fff; }
    .review-stars { color: var(--gold); font-size: 13px; letter-spacing: 2px; }
    .review-card blockquote { min-height: 82px; margin: 13px 0 17px; color: var(--ink-soft); font-size: 13px; line-height: 1.65; }
    .review-author { display: flex; align-items: center; gap: 10px; }
    .review-author img { width: 38px; height: 38px; border-radius: 50%; object-fit: cover; }
    .review-author strong { display: block; font-size: 12px; }
    .review-author span { display: block; color: var(--muted); font-size: 10px; }

    .newsletter { padding: 48px 0; background: var(--ink); color: #fff; }
    .newsletter-inner { display: flex; align-items: center; justify-content: space-between; gap: 35px; }
    .newsletter-copy { max-width: 440px; }
    .newsletter-copy h2 { margin: 0 0 6px; font: 800 27px "Manrope", sans-serif; letter-spacing: -.7px; }
    .newsletter-copy p { margin: 0; color: #c4cdd5; font-size: 13px; }
    .newsletter-form { position: relative; width: min(100%, 470px); display: flex; gap: 8px; }
    .newsletter-form input { flex: 1; min-width: 0; height: 48px; padding: 0 14px; border: 1px solid rgba(255,255,255,.18); border-radius: 11px; background: #fff; color: var(--ink); }
    .newsletter-form button { flex-shrink: 0; }
    .newsletter-message { position: absolute; top: calc(100% + 7px); left: 2px; color: #b7f3dd; font-size: 12px; }

    footer { padding: 50px 0 20px; background: #101d2a; color: #fff; }
    .footer-grid { display: grid; grid-template-columns: 2fr 1fr 1fr 1fr; gap: 45px; padding-bottom: 35px; }
    .footer-brand .brand { margin-bottom: 14px; }
    .footer-brand p { max-width: 300px; color: #b4c0cb; font-size: 12px; }
    .socials { display: flex; gap: 9px; margin-top: 18px; }
    .socials a { width: 34px; height: 34px; display: grid; place-items: center; border: 1px solid rgba(255,255,255,.16); border-radius: 50%; color: #d5dde4; font-size: 12px; transition: background .2s, color .2s; }
    .socials a:hover { background: var(--accent); color: #fff; }
    .footer-column h3 { margin: 4px 0 13px; font-size: 12px; }
    .footer-column ul { display: grid; gap: 8px; margin: 0; padding: 0; list-style: none; }
    .footer-column a { color: #b4c0cb; font-size: 11px; }
    .footer-column a:hover { color: #fff; }
    .footer-bottom { display: flex; align-items: center; justify-content: space-between; gap: 12px; padding-top: 18px; border-top: 1px solid rgba(255,255,255,.13); color: #aebbc6; font-size: 10px; }

    .toast-region { position: fixed; right: 18px; bottom: 18px; z-index: 50; display: grid; gap: 8px; pointer-events: none; }
    .toast { padding: 12px 16px; border-radius: 11px; background: var(--ink); color: #fff; box-shadow: var(--shadow-hover); font-size: 13px; animation: toast-in .2s ease-out; }
    @keyframes toast-in { from { opacity: 0; transform: translateY(8px); } to { opacity: 1; transform: none; } }

    @media (max-width: 1000px) {
      .header-main { grid-template-columns: auto 1fr auto; gap: 18px; }
      .categories-grid { grid-template-columns: repeat(3, 1fr); }
      .products-grid { grid-template-columns: repeat(3, minmax(0,1fr)); }
      .reviews-grid { grid-template-columns: repeat(2, 1fr); }
    }
    @media (max-width: 720px) {
      .container { width: min(100% - 30px, var(--content)); }
      .announcement { font-size: 10px; }
      .header-main { min-height: 68px; grid-template-columns: auto 1fr auto; gap: 9px; }
      .brand { font-size: 19px; gap: 7px; }
      .brand-mark { width: 32px; height: 32px; border-radius: 10px; }
      .desktop-nav { display: none; }
      .search { grid-column: 1/-1; grid-row: 2; height: 42px; margin-bottom: 10px; }
      .header-main { padding-top: 7px; }
      .mobile-menu-button { width: 38px; height: 38px; display: grid; place-items: center; border: 0; border-radius: 50%; background: #f1f4f6; cursor: pointer; }
      .header-actions { gap: 0; }
      .icon-action { width: 38px; height: 38px; }
      .mobile-menu { padding: 5px 0 14px; border-top: 1px solid var(--line); }
      .mobile-menu[data-open="true"] { display: block; }
      .mobile-menu ul { display: grid; gap: 3px; margin: 0; padding: 0; list-style: none; }
      .mobile-menu a { display: flex; align-items: center; gap: 12px; padding: 10px 12px; border-radius: 10px; color: var(--ink-soft); font-size: 13px; font-weight: 600; }
      .mobile-menu a:hover { background: #f2f4f6; }
      .mobile-menu a i { width: 19px; color: var(--accent); }
      .hero { min-height: 420px; margin-top: 13px; border-radius: 19px; }
      .hero::after { background: linear-gradient(90deg, rgba(16,31,47,.9), rgba(16,31,47,.59)); }
      .hero-content { width: 100%; padding: 50px 7%; }
      .hero h1 { font-size: clamp(40px, 9vw, 58px); letter-spacing: -1.8px; }
      .hero p { font-size: 15px; }
      .trust-row { grid-template-columns: 1fr; padding: 9px 16px; }
      .trust-item { justify-content: flex-start; padding: 10px 4px; }
      .trust-item + .trust-item { border-top: 1px solid var(--line); border-left: 0; }
      .section { padding: 54px 0; }
      .section-head { align-items: flex-start; }
      .section-title { font-size: 27px; }
      .categories-grid { gap: 10px; }
      .category-card { min-height: 135px; }
      .products-grid { grid-template-columns: repeat(2, minmax(0,1fr)); gap: 12px; }
      .product-title { font-size: 13px; }
      .product-info { padding: 12px 12px 8px; }
      .product-footer { padding: 0 12px 12px; }
      .deal-card { grid-template-columns: 1fr; }
      .deal-image { min-height: 230px; max-height: 300px; }
      .deal-copy { padding: 28px 24px; }
      .newsletter-inner { align-items: flex-start; flex-direction: column; gap: 20px; }
      .newsletter-form { width: 100%; }
      .footer-grid { grid-template-columns: 1.5fr 1fr; gap: 28px 20px; }
    }
    @media (max-width: 420px) {
      .header-main { grid-template-columns: auto 1fr auto; }
      .header-actions .icon-action:first-child { display: none; }
      .hero { min-height: 395px; }
      .hero-content { padding-inline: 22px; }
      .hero h1 { font-size: 39px; }
      .hero-actions .button { min-height: 43px; padding-inline: 14px; font-size: 12px; }
      .section-head { flex-direction: column; }
      .categories-grid { grid-template-columns: repeat(2, 1fr); }
      .product-image { aspect-ratio: 1 / 1; }
      .product-title { min-height: 2.7em; }
      .reviews-grid { grid-template-columns: 1fr; }
      .review-card blockquote { min-height: auto; }
      .newsletter-form { flex-direction: column; }
      .newsletter-form button { width: 100%; }
      .newsletter-message { position: static; }
      .footer-grid { grid-template-columns: 1fr 1fr; }
      .footer-brand { grid-column: 1/-1; }
      .footer-bottom { align-items: flex-start; flex-direction: column; }
    }
    @media (prefers-reduced-motion: reduce) {
      *, *::before, *::after { scroll-behavior: auto !important; animation-duration: .01ms !important; animation-iteration-count: 1 !important; transition-duration: .01ms !important; }
    }
  </style>
</head>

<body>
  <div class="announcement">
    Complimentary delivery on orders over <strong>$75</strong> &nbsp;·&nbsp; Easy 30-day returns
  </div>

  <header>
    <div class="container header-main">
      <a class="brand" href="#" aria-label="NexusShop home">
        <span class="brand-mark"><i class="fa-solid fa-bag-shopping" aria-hidden="true"></i></span>
        <span>Nexus<span class="brand-accent">Shop</span></span>
      </a>

      <form class="search" id="searchForm" role="search">
        <i class="fa-solid fa-magnifying-glass" aria-hidden="true"></i>
        <label class="sr-only" for="searchInput">Search products</label>
        <input id="searchInput" type="search" placeholder="Search products, brands and more" autocomplete="off">
        <button type="submit" aria-label="Search"><i class="fa-solid fa-arrow-right" aria-hidden="true"></i></button>
      </form>

      <div class="header-actions">
        <button class="icon-action" id="wishlistTop" type="button" aria-label="Wishlist">
          <i class="fa-regular fa-heart" aria-hidden="true"></i>
        </button>
        <button class="icon-action" id="cartButton" type="button" aria-label="Shopping cart, 0 items">
          <i class="fa-solid fa-bag-shopping" aria-hidden="true"></i>
          <span class="cart-count" id="cartCount" aria-live="polite">0</span>
        </button>
        <button class="mobile-menu-button" id="menuButton" type="button" aria-label="Open navigation" aria-expanded="false" aria-controls="mobileMenu">
          <i class="fa-solid fa-bars" aria-hidden="true"></i>
        </button>
      </div>
    </div>

    <nav class="desktop-nav" aria-label="Main navigation">
      <div class="container">
        <ul>
          <li><a href="#home" aria-current="page">Home</a></li>
          <li><a href="#categories">Categories</a></li>
          <li><a href="#products">Shop</a></li>
          <li><a href="#deals">Today’s deals</a></li>
          <li><a href="#reviews">Customer stories</a></li>
        </ul>
      </div>
    </nav>
    <nav class="mobile-menu" id="mobileMenu" aria-label="Mobile navigation" data-open="false">
      <div class="container">
        <ul>
          <li><a href="#home"><i class="fa-solid fa-house" aria-hidden="true"></i> Home</a></li>
          <li><a href="#categories"><i class="fa-solid fa-layer-group" aria-hidden="true"></i> Categories</a></li>
          <li><a href="#products"><i class="fa-solid fa-store" aria-hidden="true"></i> Shop products</a></li>
          <li><a href="#deals"><i class="fa-solid fa-tag" aria-hidden="true"></i> Today’s deals</a></li>
          <li><a href="#reviews"><i class="fa-solid fa-star" aria-hidden="true"></i> Customer stories</a></li>
        </ul>
      </div>
    </nav>
  </header>

  <main>
    <div class="container">
      <section class="hero" id="home" aria-labelledby="heroTitle">
        <div class="hero-content">
          <span class="eyebrow"><i class="fa-solid fa-sparkles" aria-hidden="true"></i> The new season edit</span>
          <h1 id="heroTitle">Find the good things in life.</h1>
          <p>Thoughtfully chosen essentials, clever tech and everyday favorites, all in one place.</p>
          <div class="hero-actions">
            <a class="button button-primary" href="#products">Shop best sellers <i class="fa-solid fa-arrow-right" aria-hidden="true"></i></a>
            <a class="button button-light" href="#deals">Explore today’s deal</a>
          </div>
        </div>
      </section>

      <div class="trust-row" aria-label="Shopping benefits">
        <div class="trust-item">
          <i class="trust-icon fa-solid fa-truck-fast" aria-hidden="true"></i>
          <div><strong>Free, fast delivery</strong><span>On orders over $75</span></div>
        </div>
        <div class="trust-item">
          <i class="trust-icon fa-solid fa-arrow-rotate-left" aria-hidden="true"></i>
          <div><strong>Easy returns</strong><span>30 days to decide</span></div>
        </div>
        <div class="trust-item">
          <i class="trust-icon fa-solid fa-shield-halved" aria-hidden="true"></i>
          <div><strong>Secure checkout</strong><span>Your details stay protected</span></div>
        </div>
      </div>
    </div>

    <section class="section" id="categories" aria-labelledby="categoriesTitle">
      <div class="container">
        <div class="section-head">
          <div>
            <p class="section-kicker">Browse your way</p>
            <h2 class="section-title" id="categoriesTitle">Shop by category</h2>
            <p class="section-subtitle">A few good places to start.</p>
          </div>
          <a class="text-link" href="#products">Explore everything <i class="fa-solid fa-arrow-right" aria-hidden="true"></i></a>
        </div>
        <div class="categories-grid" id="categoriesGrid"></div>
      </div>
    </section>

    <section class="section products-section" id="products" aria-labelledby="productsTitle">
      <div class="container">
        <div class="section-head">
          <div>
            <p class="section-kicker">Picked for you</p>
            <h2 class="section-title" id="productsTitle">Popular right now</h2>
            <p class="section-subtitle">Customer favorites worth a closer look.</p>
          </div>
          <a class="text-link" href="#products" id="showAllLink">View all <i class="fa-solid fa-arrow-right" aria-hidden="true"></i></a>
        </div>
        <div class="product-toolbar">
          <span class="result-count" id="resultCount" aria-live="polite"></span>
          <button class="clear-search" id="clearSearch" type="button" hidden>Clear search</button>
        </div>
        <div class="products-grid" id="productsGrid" aria-live="polite"></div>
      </div>
    </section>

    <section class="section" id="deals" aria-labelledby="dealTitle">
      <div class="container">
        <div class="section-head">
          <div>
            <p class="section-kicker">A little something extra</p>
            <h2 class="section-title">The deal of the day</h2>
            <p class="section-subtitle">A standout find, at a price worth catching.</p>
          </div>
        </div>
        <article class="deal-card">
          <div class="deal-image">
            <img src="https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&w=1000&q=85" alt="Slim silver laptop on a light desk" loading="lazy">
          </div>
          <div class="deal-copy">
            <span class="deal-label"><i class="fa-solid fa-bolt" aria-hidden="true"></i> Today only</span>
            <h3 id="dealTitle">A little more power for your day.</h3>
            <p>Make space for big ideas with a beautiful, fast laptop built for wherever the day takes you.</p>
            <div class="deal-price"><strong>$1,499</strong><del>$1,799</del></div>
            <div class="timer" aria-label="Time remaining">
              <div class="timer-unit"><strong id="dealHours">00</strong><span>Hours</span></div>
              <div class="timer-unit"><strong id="dealMinutes">00</strong><span>Minutes</span></div>
              <div class="timer-unit"><strong id="dealSeconds">00</strong><span>Seconds</span></div>
            </div>
            <button class="button button-dark" id="buyDeal" type="button"><i class="fa-solid fa-bag-shopping" aria-hidden="true"></i> Add deal to cart</button>
          </div>
        </article>
      </div>
    </section>

    <section class="section" id="reviews" aria-labelledby="reviewsTitle">
      <div class="container">
        <div class="section-head">
          <div>
            <p class="section-kicker">Kind words from customers</p>
            <h2 class="section-title" id="reviewsTitle">Good finds, happy people</h2>
            <p class="section-subtitle">A few notes from the NexusShop community.</p>
          </div>
        </div>
        <div class="reviews-grid" id="reviewsGrid"></div>
      </div>
    </section>

    <section class="newsletter" aria-labelledby="newsletterTitle">
      <div class="container newsletter-inner">
        <div class="newsletter-copy">
          <h2 id="newsletterTitle">A good email, now and then.</h2>
          <p>Get new arrivals, small perks and the occasional very good deal. No clutter.</p>
        </div>
        <form class="newsletter-form" id="newsletterForm">
          <label class="sr-only" for="newsletterEmail">Your email address</label>
          <input id="newsletterEmail" type="email" placeholder="Your email address" autocomplete="email" required>
          <button class="button button-primary" type="submit"><i class="fa-regular fa-paper-plane" aria-hidden="true"></i> Sign me up</button>
          <div class="newsletter-message" id="newsletterMessage" role="status" aria-live="polite"></div>
        </form>
      </div>
    </section>
  </main>

  <footer>
    <div class="container">
      <div class="footer-grid">
        <div class="footer-brand">
          <a class="brand" href="#home">
            <span class="brand-mark"><i class="fa-solid fa-bag-shopping" aria-hidden="true"></i></span>
            <span>Nexus<span class="brand-accent">Shop</span></span>
          </a>
          <p>Useful things, lovely finds and everyday essentials, chosen with care and delivered with a smile.</p>
          <div class="socials">
            <a href="#" aria-label="Instagram"><i class="fa-brands fa-instagram" aria-hidden="true"></i></a>
            <a href="#" aria-label="Facebook"><i class="fa-brands fa-facebook-f" aria-hidden="true"></i></a>
            <a href="#" aria-label="Pinterest"><i class="fa-brands fa-pinterest-p" aria-hidden="true"></i></a>
          </div>
        </div>
        <div class="footer-column">
          <h3>Explore</h3>
          <ul><li><a href="#categories">Categories</a></li><li><a href="#products">Best sellers</a></li><li><a href="#deals">Today’s deal</a></li></ul>
        </div>
        <div class="footer-column">
          <h3>We can help</h3>
          <ul><li><a href="#newsletterTitle">Contact us</a></li><li><a href="#newsletterTitle">Shipping & returns</a></li><li><a href="#newsletterTitle">Help center</a></li></ul>
        </div>
        <div class="footer-column">
          <h3>The details</h3>
          <ul><li><a href="#home">Privacy</a></li><li><a href="#home">Terms</a></li><li><a href="#home">Accessibility</a></li></ul>
        </div>
      </div>
      <div class="footer-bottom">
        <span>© <span id="year"></span> NexusShop. All rights reserved.</span>
        <span>Made for easier, happier shopping.</span>
      </div>
    </div>
  </footer>

  <div class="toast-region" id="toastRegion" role="status" aria-live="polite"></div>

  <script>
    "use strict";

    const CATEGORIES = [
      { id: "phones", name: "Smartphones", icon: "fa-mobile-screen-button", count: 24 },
      { id: "laptops", name: "Laptops", icon: "fa-laptop", count: 18 },
      { id: "clothing", name: "Clothing", icon: "fa-shirt", count: 42 },
      { id: "gadgets", name: "Gadgets", icon: "fa-headphones", count: 31 },
      { id: "footwear", name: "Footwear", icon: "fa-shoe-prints", count: 27 },
      { id: "accessories", name: "Accessories", icon: "fa-watch", count: 39 }
    ];

    const PRODUCTS = [
      { id: 1, title: "iPhone 14 Pro Max", price: 1099, oldPrice: 1199, rating: 5, reviews: 128, badge: "New", img: "https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?auto=format&fit=crop&w=700&q=80", category: "Smartphones" },
      { id: 2, title: "MacBook Pro 14″", price: 1999, rating: 4, reviews: 86, badge: "", img: "https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&w=700&q=80", category: "Laptops" },
      { id: 3, title: "Apple Watch Series 8", price: 349, oldPrice: 399, rating: 5, reviews: 214, badge: "Sale", img: "https://images.unsplash.com/photo-1529374255404-311a2a4f1fd9?auto=format&fit=crop&w=700&q=80", category: "Accessories" },
      { id: 4, title: "Nike Air Max 270", price: 150, rating: 4, reviews: 53, badge: "", img: "https://images.unsplash.com/photo-1542272604-787c3835535d?auto=format&fit=crop&w=700&q=80", category: "Footwear" },
      { id: 5, title: "Sony A7 IV Camera", price: 2499, rating: 5, reviews: 42, badge: "New", img: "https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?auto=format&fit=crop&w=700&q=80", category: "Gadgets" },
      { id: 6, title: "Chanel No. 5", price: 120, rating: 5, reviews: 189, badge: "", img: "https://images.unsplash.com/photo-1585386959984-a4155224a1ad?auto=format&fit=crop&w=700&q=80", category: "Accessories" },
      { id: 7, title: "Travel Backpack", price: 79, oldPrice: 99, rating: 4, reviews: 67, badge: "Sale", img: "https://images.unsplash.com/photo-1551232864-3f0890e580d9?auto=format&fit=crop&w=700&q=80", category: "Accessories" },
      { id: 8, title: "Sony WH-1000XM5", price: 399, rating: 5, reviews: 156, badge: "", img: "https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?auto=format&fit=crop&w=700&q=80", category: "Gadgets" }
    ];

    const REVIEWS = [
      { name: "Ava Martin", role: "Verified buyer", avatar: "https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=100&q=80", text: "Fast shipping and excellent support. The product exceeded my expectations!", stars: 5 },
      { name: "Michael Lee", role: "Frequent shopper", avatar: "https://images.unsplash.com/photo-1546456073-6712f79251bb?auto=format&fit=crop&w=100&q=80", text: "Great selection and a smooth experience from start to finish. I’ll definitely shop again.", stars: 4 },
      { name: "Sophia Chen", role: "Verified buyer", avatar: "https://images.unsplash.com/photo-1494790108378-be9c29b29330?auto=format&fit=crop&w=100&q=80", text: "Love the quality and the packaging. Everything arrived in perfect condition.", stars: 5 },
      { name: "James Wilson", role: "Tech enthusiast", avatar: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=100&q=80", text: "Found exactly what I needed at a great price. The laptop deal was a lovely surprise.", stars: 5 }
    ];

    const state = { cart: 0, query: "", wishlist: new Set() };
    const $ = (selector) => document.querySelector(selector);
    const productsGrid = $("#productsGrid");
    const searchInput = $("#searchInput");
    const resultCount = $("#resultCount");
    const clearSearch = $("#clearSearch");

    function escapeHtml(value) {
      return String(value).replace(/[&<>"']/g, (character) => ({
        "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;"
      })[character]);
    }

    function toast(message) {
      const item = document.createElement("div");
      item.className = "toast";
      item.textContent = message;
      $("#toastRegion").appendChild(item);
      window.setTimeout(() => item.remove(), 2500);
    }

    function renderCategories() {
      const grid = $("#categoriesGrid");
      grid.innerHTML = "";
      CATEGORIES.forEach((category) => {
        const button = document.createElement("button");
        button.type = "button";
        button.className = "category-card";
        button.setAttribute("aria-label", `Browse ${category.name}, ${category.count} items`);
        button.innerHTML = `
          <span class="category-icon"><i class="fa-solid ${category.icon}" aria-hidden="true"></i></span>
          <strong>${escapeHtml(category.name)}</strong>
          <small>${category.count} items</small>`;
        button.addEventListener("click", () => {
          searchInput.value = category.name;
          applySearch(category.name);
          $("#products").scrollIntoView({ behavior: "smooth" });
        });
        grid.appendChild(button);
      });
    }

    function renderProducts(products) {
      productsGrid.innerHTML = "";
      resultCount.textContent = `${products.length} ${products.length === 1 ? "item" : "items"}${state.query ? ` for “${state.query}”` : ""}`;
      clearSearch.hidden = !state.query;

      if (!products.length) {
        productsGrid.innerHTML = `<div class="empty-state"><i class="fa-solid fa-magnifying-glass" aria-hidden="true"></i><p>No products matched your search. Try a different name or category.</p></div>`;
        return;
      }

      products.forEach((product) => {
        const article = document.createElement("article");
        article.className = "product-card";
        const isWishlisted = state.wishlist.has(product.id);
        const badge = product.badge
          ? `<span class="product-badge ${product.badge === "Sale" ? "sale" : ""}">${escapeHtml(product.badge)}</span>`
          : "";
        const oldPrice = product.oldPrice
          ? `<span class="old-price">$${product.oldPrice.toLocaleString()}</span>`
          : "";
        const stars = "★".repeat(product.rating) + "☆".repeat(5 - product.rating);

        article.innerHTML = `
          <div class="product-image">
            <img src="${product.img}" alt="${escapeHtml(product.title)}" loading="lazy">
            ${badge}
            <button class="wishlist-button" type="button" data-wishlist="${product.id}"
              aria-label="${isWishlisted ? "Remove from wishlist" : "Add to wishlist"}" aria-pressed="${isWishlisted}">
              <i class="${isWishlisted ? "fa-solid" : "fa-regular"} fa-heart" aria-hidden="true"></i>
            </button>
          </div>
          <div class="product-info">
            <span class="product-category">${escapeHtml(product.category)}</span>
            <h3 class="product-title">${escapeHtml(product.title)}</h3>
            <div class="rating" aria-label="${product.rating} out of 5 stars">${stars}<span>(${product.reviews})</span></div>
            <div class="price-row"><span class="price">$${product.price.toLocaleString()}</span>${oldPrice}</div>
          </div>
          <div class="product-footer">
            <button class="add-button" type="button" data-add="${product.id}">
              <i class="fa-solid fa-bag-shopping" aria-hidden="true"></i> Add to cart
            </button>
          </div>`;
        productsGrid.appendChild(article);
      });
    }

    function applySearch(value) {
      state.query = String(value || "").trim();
      const query = state.query.toLowerCase();
      const matches = PRODUCTS.filter((product) =>
        `${product.title} ${product.category}`.toLowerCase().includes(query)
      );
      renderProducts(matches);
    }

    function updateCart() {
      $("#cartCount").textContent = state.cart;
      $("#cartButton").setAttribute("aria-label", `Shopping cart, ${state.cart} ${state.cart === 1 ? "item" : "items"}`);
    }

    function addToCart(productId, button) {
      const product = PRODUCTS.find((item) => item.id === productId);
      if (!product) return;
      state.cart += 1;
      updateCart();
      const original = button.innerHTML;
      button.innerHTML = '<i class="fa-solid fa-check" aria-hidden="true"></i> Added';
      button.classList.add("added");
      toast(`${product.title} added to your cart`);
      window.setTimeout(() => {
        button.innerHTML = original;
        button.classList.remove("added");
      }, 1300);
    }

    function renderReviews() {
      const grid = $("#reviewsGrid");
      grid.innerHTML = "";
      REVIEWS.forEach((review) => {
        const card = document.createElement("article");
        card.className = "review-card";
        const stars = "★".repeat(review.stars) + "☆".repeat(5 - review.stars);
        card.innerHTML = `
          <div class="review-stars" aria-label="${review.stars} out of 5 stars">${stars}</div>
          <blockquote>“${escapeHtml(review.text)}”</blockquote>
          <div class="review-author">
            <img src="${review.avatar}" alt="" loading="lazy">
            <div><strong>${escapeHtml(review.name)}</strong><span>${escapeHtml(review.role)}</span></div>
          </div>`;
        grid.appendChild(card);
      });
    }

    $("#searchForm").addEventListener("submit", (event) => {
      event.preventDefault();
      applySearch(searchInput.value);
      $("#products").scrollIntoView({ behavior: "smooth" });
    });

    searchInput.addEventListener("input", () => applySearch(searchInput.value));

    clearSearch.addEventListener("click", () => {
      searchInput.value = "";
      applySearch("");
      searchInput.focus();
    });

    $("#showAllLink").addEventListener("click", (event) => {
      event.preventDefault();
      searchInput.value = "";
      applySearch("");
    });

    productsGrid.addEventListener("click", (event) => {
      const wishlistButton = event.target.closest("[data-wishlist]");
      if (wishlistButton) {
        const id = Number(wishlistButton.dataset.wishlist);
        if (state.wishlist.has(id)) {
          state.wishlist.delete(id);
          toast("Removed from your wishlist");
        } else {
          state.wishlist.add(id);
          toast("Added to your wishlist");
        }
        const currentProducts = state.query
          ? PRODUCTS.filter((item) => `${item.title} ${item.category}`.toLowerCase().includes(state.query.toLowerCase()))
          : PRODUCTS;
        renderProducts(currentProducts);
        return;
      }
      const addButton = event.target.closest("[data-add]");
      if (addButton) addToCart(Number(addButton.dataset.add), addButton);
    });

    $("#cartButton").addEventListener("click", () => {
      toast(`Your cart has ${state.cart} ${state.cart === 1 ? "item" : "items"}`);
    });

    $("#wishlistTop").addEventListener("click", () => {
      if (!state.wishlist.size) {
        toast("Your wishlist is ready for your favorites");
        return;
      }
      const saved = PRODUCTS.filter((product) => state.wishlist.has(product.id));
      state.query = "";
      searchInput.value = "";
      renderProducts(saved);
      $("#productsTitle").textContent = "Your wishlist";
      $("#products").scrollIntoView({ behavior: "smooth" });
    });

    $("#buyDeal").addEventListener("click", (event) => {
      state.cart += 1;
      updateCart();
      event.currentTarget.innerHTML = '<i class="fa-solid fa-check" aria-hidden="true"></i> Deal added';
      toast("Today’s laptop deal added to your cart");
      window.setTimeout(() => {
        event.currentTarget.innerHTML = '<i class="fa-solid fa-bag-shopping" aria-hidden="true"></i> Add deal to cart';
      }, 1500);
    });

    $("#newsletterForm").addEventListener("submit", (event) => {
      event.preventDefault();
      const email = $("#newsletterEmail");
      if (!email.reportValidity()) return;
      $("#newsletterMessage").textContent = "Thanks for subscribing. Watch your inbox!";
      email.value = "";
    });

    const menuButton = $("#menuButton");
    const mobileMenu = $("#mobileMenu");
    menuButton.addEventListener("click", () => {
      const isOpen = menuButton.getAttribute("aria-expanded") === "true";
      menuButton.setAttribute("aria-expanded", String(!isOpen));
      menuButton.setAttribute("aria-label", isOpen ? "Open navigation" : "Close navigation");
      mobileMenu.dataset.open = String(!isOpen);
      menuButton.innerHTML = `<i class="fa-solid ${isOpen ? "fa-bars" : "fa-xmark"}" aria-hidden="true"></i>`;
    });

    mobileMenu.addEventListener("click", (event) => {
      if (event.target.closest("a")) {
        mobileMenu.dataset.open = "false";
        menuButton.setAttribute("aria-expanded", "false");
        menuButton.setAttribute("aria-label", "Open navigation");
        menuButton.innerHTML = '<i class="fa-solid fa-bars" aria-hidden="true"></i>';
      }
    });

    function startDealTimer() {
      const end = Date.now() + (24 * 60 + 36) * 60 * 1000;
      function tick() {
        const remaining = Math.max(0, end - Date.now());
        const hours = Math.floor(remaining / 3600000);
        const minutes = Math.floor((remaining % 3600000) / 60000);
        const seconds = Math.floor((remaining % 60000) / 1000);
        $("#dealHours").textContent = String(hours).padStart(2, "0");
        $("#dealMinutes").textContent = String(minutes).padStart(2, "0");
        $("#dealSeconds").textContent = String(seconds).padStart(2, "0");
      }
      tick();
      window.setInterval(tick, 1000);
    }

    $("#year").textContent = new Date().getFullYear();
    renderCategories();
    renderProducts(PRODUCTS);
    renderReviews();
    updateCart();
    startDealTimer();
  </script>
</body>
</html>
```
