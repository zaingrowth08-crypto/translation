# Product Requirements Document (PRD)
## Multi-Language Translator Website (PHP + MySQL)

---

## 1. Project Overview

**Project Name:** LinguaTranslate (working title)

**Goal:** A web-based translation platform where new users sign up, log in, and access a personal dashboard to translate text between multiple languages. The site must be fully responsive across mobile, tablet, and desktop devices.

**Tech Stack:**
- Backend: PHP (Core PHP or a lightweight structure — no framework required)
- Database: MySQL
- Frontend: HTML5, CSS3 (responsive/mobile-first), JavaScript (AJAX for smooth translation without page reload)
- Translation Engine: External API (e.g., Google Translate API / LibreTranslate / MyMemory API) — configurable
- Session Handling: PHP Sessions for login state
- Security: Password hashing (bcrypt via `password_hash()`), prepared statements (PDO/MySQLi) to prevent SQL injection

---

## 2. User Roles

| Role | Description |
|---|---|
| Guest | Can view landing page, Signup, Login |
| Registered User | Can access Dashboard, use Translator, view history, edit profile |
| Admin (optional/future) | Manage users, view usage stats |

---

## 3. Core Features

### 3.1 Authentication Module
- **Signup Page**
  - Fields: Full Name, Email, Username, Password, Confirm Password
  - Validation: unique email/username, strong password check, email format check
  - Passwords stored as hashed values (never plain text)
- **Login Page**
  - Fields: Email/Username, Password
  - "Remember Me" option
  - "Forgot Password" (optional Phase 2 — email reset link)
- **Logout**
  - Destroys session, redirects to login

### 3.2 Dashboard (Post-Login)
- Welcome message with user's name
- Main Translator Tool:
  - Source language dropdown (auto-detect option)
  - Target language dropdown (multiple languages: English, Urdu, Arabic, French, Spanish, Chinese, etc.)
  - Text input box (source)
  - Translated output box (target) — updates via AJAX, no full page reload
  - Swap languages button
  - Copy / Clear / Speak (text-to-speech, optional) buttons
- **Translation History**
  - List of last translations (date, source text, target text, languages used)
  - Option to delete individual history items
- **Profile Section**
  - Update name, email, password
  - Upload profile picture (optional)

### 3.3 Multi-Language Support
- Minimum 10+ languages selectable from dropdown (expandable list)
- Translation via API integration (Google Translate API / LibreTranslate / MyMemory)
- Character limit indicator per request

### 3.4 Responsive Design (100%)
- Mobile-first CSS using Flexbox/Grid
- Breakpoints: Mobile (≤576px), Tablet (577–992px), Desktop (≥993px)
- Hamburger menu for mobile navigation
- Touch-friendly buttons and spacing
- Tested on Chrome, Safari, Firefox (mobile + desktop)

---

## 4. Database Structure (database.sql)

### Tables:

**1. `users`**
| Column | Type | Notes |
|---|---|---|
| id | INT, PK, AUTO_INCREMENT | |
| full_name | VARCHAR(100) | |
| username | VARCHAR(50) | UNIQUE |
| email | VARCHAR(100) | UNIQUE |
| password | VARCHAR(255) | hashed |
| profile_pic | VARCHAR(255) | nullable |
| created_at | TIMESTAMP | default current |

**2. `translations`**
| Column | Type | Notes |
|---|---|---|
| id | INT, PK, AUTO_INCREMENT | |
| user_id | INT, FK → users.id | |
| source_lang | VARCHAR(10) | e.g. 'en' |
| target_lang | VARCHAR(10) | e.g. 'ur' |
| source_text | TEXT | |
| translated_text | TEXT | |
| created_at | TIMESTAMP | default current |

**3. `languages`** (optional lookup table)
| Column | Type | Notes |
|---|---|---|
| id | INT, PK | |
| code | VARCHAR(10) | e.g. 'en', 'ur' |
| name | VARCHAR(50) | e.g. 'English', 'Urdu' |

A ready-to-import `database.sql` file will be provided with this structure, including sample language data.

---

## 5. Page/File Structure

```
/translator-site
│
├── database.sql
├── config/
│   └── db.php                 (DB connection)
├── includes/
│   ├── header.php
│   ├── footer.php
│   └── functions.php
├── auth/
│   ├── signup.php
│   ├── login.php
│   └── logout.php
├── dashboard/
│   ├── index.php              (main dashboard + translator)
│   ├── history.php
│   ├── profile.php
│   └── translate_ajax.php     (handles AJAX translation requests)
├── assets/
│   ├── css/style.css          (responsive styles)
│   ├── js/script.js
│   └── images/
└── index.php                  (landing page)
```

---

## 6. User Flow

1. Guest lands on homepage → clicks **Signup**
2. Fills form → account created → redirected to **Login**
3. Logs in → session starts → redirected to **Dashboard**
4. On Dashboard: selects source/target language → types text → gets instant translation (AJAX)
5. Translation auto-saved to **History**
6. User can update profile or logout anytime

---

## 7. Non-Functional Requirements

- **Security:** SQL injection protection, XSS filtering, CSRF token on forms, hashed passwords
- **Performance:** AJAX-based translation (no reload), optimized queries
- **Responsiveness:** 100% mobile/tablet/desktop compatibility
- **Scalability:** Easy to add more languages later
- **Browser Support:** Chrome, Firefox, Safari, Edge (latest versions)

---

## 8. Future Enhancements (Phase 2)
- Voice-to-text input
- Text-to-speech output
- Dark mode
- Favorite/saved translations
- Admin panel with usage analytics
- Forgot password via email

---

## 9. Deliverables
1. `database.sql` — full database schema with sample data
2. PHP source files (auth, dashboard, translator logic)
3. Responsive CSS/JS
4. Basic documentation (README) for setup

---

**Next Step:** Once this PRD is approved, development will start with the database + authentication module, followed by the dashboard and translator integration, and finally responsive styling and testing.