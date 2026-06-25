<script lang="ts">
  import Fa from "svelte-fa";
  import { faBuilding, faEnvelope } from "@fortawesome/free-solid-svg-icons";
  import { faTwitter, faGithub } from "@fortawesome/free-brands-svg-icons";
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
      <p class="hero-title">Associate Teaching Professor</p>
      <p class="hero-dept">
        Department of Computer Science &nbsp;·&nbsp; Drexel University
      </p>
      <p class="hero-bio">
        My research and teaching interests sit at the intersection of Software
        Security, Modern AI, Cloud Computing, and IoT. I blend 20+ years of
        industry experience — most recently as a Distinguished Engineer at a
        Fortune 15 company — with active academic research and mentoring.
      </p>
      <div class="hero-contact">
        <span class="contact-item">
          <Fa icon={faBuilding} />
          <span>Office 3675 Market · Room 1134</span>
        </span>
        <a href="mailto:bmitchell@drexel.edu" class="contact-item">
          <Fa icon={faEnvelope} />
          <span>bmitchell@drexel.edu</span>
        </a>
        <a
          href="https://twitter.com/DrBrianMitchell"
          class="contact-item"
          target="_blank"
          rel="noopener noreferrer"
        >
          <Fa icon={faTwitter} />
          <span>@DrBrianMitchell</span>
        </a>
        <a
          href="https://github.com/ArchitectingSoftware"
          class="contact-item"
          target="_blank"
          rel="noopener noreferrer"
        >
          <Fa icon={faGithub} />
          <span>@ArchitectingSoftware</span>
        </a>
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
    margin-bottom: 0.3rem;
    letter-spacing: -0.02em;
    line-height: 1.15;
  }

  .hero-title {
    font-size: 1.1rem;
    font-weight: 600;
    color: var(--c-gold);
    margin-bottom: 0.2rem;
    letter-spacing: 0.01em;
  }

  .hero-dept {
    font-size: 0.95rem;
    color: rgba(255, 255, 255, 0.7);
    margin-bottom: 1.25rem;
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
    flex-wrap: wrap;
    gap: 0.6rem 1.75rem;
    align-items: center;
  }

  .contact-item {
    display: inline-flex;
    align-items: center;
    gap: 0.4rem;
    color: rgba(255, 255, 255, 0.82);
    text-decoration: none;
    font-size: 0.9rem;
    transition: color 0.15s;
  }

  .contact-item:hover {
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

    .hero-contact {
      justify-content: center;
    }
  }
</style>
