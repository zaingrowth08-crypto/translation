<?php
require_once 'config/db.php';
require_once 'includes/functions.php';

if (isLoggedIn()) {
    redirect('/firstphp/dashboard/index.php');
}

require_once 'includes/header.php';
?>

<div class="hero-section">
    <div class="hero-content text-center">
        <h1 class="hero-title">Break the Language Barrier</h1>
        <p class="hero-subtitle">Translate text between multiple languages instantly with LinguaTranslate. Fast, reliable, and completely free.</p>
        
        <div class="hero-actions">
            <a href="/firstphp/auth/signup.php" class="btn btn-primary btn-large">Get Started Now</a>
            <a href="/firstphp/auth/login.php" class="btn btn-secondary btn-large">Log In</a>
        </div>
    </div>
</div>

<div class="features-section container">
    <div class="feature-grid">
        <div class="feature-card glass-panel text-center">
            <div class="feature-icon">
                <i class="fa-solid fa-bolt"></i>
            </div>
            <h3>Instant Translation</h3>
            <p>Experience real-time translations powered by advanced APIs, without needing to reload the page.</p>
        </div>
        
        <div class="feature-card glass-panel text-center">
            <div class="feature-icon">
                <i class="fa-solid fa-globe"></i>
            </div>
            <h3>Multi-Language Support</h3>
            <p>Translate across a wide variety of languages including English, Spanish, French, Arabic, and more.</p>
        </div>
        
        <div class="feature-card glass-panel text-center">
            <div class="feature-icon">
                <i class="fa-solid fa-clock-rotate-left"></i>
            </div>
            <h3>Translation History</h3>
            <p>Never lose a translation. We automatically save your history so you can review past translations anytime.</p>
        </div>
    </div>
</div>

<?php require_once 'includes/footer.php'; ?>
