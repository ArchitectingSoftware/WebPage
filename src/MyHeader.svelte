<script lang="ts">
  import BRIAN from "./assets/BrianMitchell.jpg";
</script>

<section class="hero" id="hero">
  <div class="hero-overlay"></div>
  <div class="hero-content">
    <div class="hero-photo-col">
      <img src={BRIAN} alt="Dr. Brian Mitchell" class="hero-photo" />
    </div>
    <div class="hero-text-col">
      <h1 class="hero-name">Brian S. Mitchell, Ph.D.</h1>
      <p class="hero-dept">
        Teaching Professor &nbsp;·&nbsp; Department of Computer Science
        &nbsp;·&nbsp; Drexel University
      </p>
      <p class="hero-bio">
        My research and teaching interests sit at the intersection of Software
        Security, Modern AI, Cloud Computing, and IoT. I blend 20+ years of
        industry experience — most recently as a Distinguished Engineer at a
        Fortune 15 company — with active academic research and mentoring.
      </p>
      <div class="hero-contact">
        <div class="contact-row">
          <span class="contact-item">
            <i class="bi bi-building"></i>
            <span>3675 Market St · Room 1134</span>
          </span>
          <a href="mailto:bmitchell@drexel.edu" class="contact-item">
            <i class="bi bi-envelope"></i>
            <span>bmitchell@drexel.edu</span>
          </a>
        </div>
        <div class="social-row">
          <a
            class="social-pill"
            href="https://github.com/ArchitectingSoftware"
            target="_blank"
            rel="noopener noreferrer"
            title="GitHub"
          >
            <i class="bi bi-github"></i>
            <span>GitHub</span>
          </a>
          <a
            class="social-pill"
            href="https://x.com/DrBrianMitchell"
            target="_blank"
            rel="noopener noreferrer"
            title="X / Twitter"
          >
            <i class="bi bi-twitter-x"></i>
            <span>X</span>
          </a>
          <a
            class="social-pill"
            href="https://www.linkedin.com/in/drbrianmitchell/"
            target="_blank"
            rel="noopener noreferrer"
            title="LinkedIn"
          >
            <i class="bi bi-linkedin"></i>
            <span>LinkedIn</span>
          </a>
          <a
            class="social-pill"
            href="https://scholar.google.com/citations?user=EOZWN-YAAAAJ&hl=en"
            target="_blank"
            rel="noopener noreferrer"
            title="Google Scholar"
          >
            <i class="bi bi-mortarboard"></i>
            <span>Scholar</span>
          </a>
        </div>
      </div>
    </div>
  </div>
</section>

<style>
  .hero {
    position: relative;
    min-height: 520px;
    display: flex;
    align-items: center;
    background-image: url("./assets/drexel-dragon.png");
    background-size: cover;
    background-position: center top;
  }

  .hero-overlay {
    position: absolute;
    inset: 0;
    background: linear-gradient(
      135deg,
      rgba(7, 41, 77, 0.94) 0%,
      rgba(7, 41, 77, 0.82) 100%
    );
    z-index: 1;
  }

  .hero-content {
    position: relative;
    z-index: 2;
    max-width: 1000px;
    margin: 0 auto;
    padding: 5rem 2rem;
    display: flex;
    align-items: center;
    gap: 3.5rem;
    width: 100%;
  }

  .hero-photo-col {
    flex-shrink: 0;
  }

  .hero-photo {
    width: 185px;
    height: 185px;
    border-radius: 50%;
    object-fit: cover;
    border: 4px solid var(--c-gold);
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.45);
    display: block;
  }

  .hero-text-col {
    color: white;
    min-width: 0;
  }

  .hero-name {
    font-size: clamp(1.8rem, 3.5vw, 2.6rem);
    font-weight: 700;
    color: #ffffff;
    margin-bottom: 0.35rem;
    letter-spacing: -0.02em;
    line-height: 1.15;
  }

  .hero-dept {
    font-size: 0.92rem;
    color: rgba(255, 255, 255, 0.7);
    margin-bottom: 1.25rem;
    letter-spacing: 0.01em;
  }

  .hero-bio {
    font-size: 0.97rem;
    color: rgba(255, 255, 255, 0.85);
    line-height: 1.75;
    max-width: 58ch;
    margin-bottom: 1.75rem;
  }

  .hero-contact {
    display: flex;
    flex-direction: column;
    gap: 0.65rem;
  }

  .contact-row {
    display: flex;
    flex-wrap: wrap;
    gap: 0.5rem 1.75rem;
    align-items: center;
  }

  .contact-item {
    display: inline-flex;
    align-items: center;
    gap: 0.4rem;
    color: rgba(255, 255, 255, 0.82);
    text-decoration: none;
    font-size: 0.88rem;
    transition: color 0.15s;
  }
  .contact-item:hover {
    color: var(--c-gold);
  }

  .social-row {
    display: flex;
    flex-wrap: wrap;
    gap: 0.45rem;
    align-items: center;
  }

  .social-pill {
    display: inline-flex;
    align-items: center;
    gap: 0.35rem;
    font-size: 0.8rem;
    font-weight: 600;
    color: rgba(255, 255, 255, 0.88);
    text-decoration: none;
    border: 1.5px solid rgba(255, 255, 255, 0.3);
    border-radius: 2rem;
    padding: 0.28rem 0.75rem;
    transition:
      background 0.15s,
      border-color 0.15s,
      color 0.15s;
    backdrop-filter: blur(4px);
  }
  .social-pill:hover {
    background: rgba(255, 255, 255, 0.12);
    border-color: var(--c-gold);
    color: var(--c-gold);
  }

  @media (max-width: 767px) {
    .hero-content {
      flex-direction: column;
      align-items: center;
      text-align: center;
      padding: 3.5rem 1.5rem;
      gap: 2rem;
    }

    .hero-photo {
      width: 140px;
      height: 140px;
    }

    .hero-bio {
      max-width: none;
    }

    .contact-row,
    .social-row {
      justify-content: center;
    }
  }
</style>
