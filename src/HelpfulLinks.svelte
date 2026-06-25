<div class="section-links" id="links">
  <div class="section-container">
    <h2 class="section-heading links-heading">
      <i class="bi bi-bookmarks-fill"></i>Helpful Links
    </h2>
    <div class="links-grid">
      <a
        class="link-card"
        href="https://github.com/ArchitectingSoftware"
        target="_blank"
        rel="noopener noreferrer"
      >
        <i class="bi bi-github link-icon"></i>
        <div>
          <div class="link-title">GitHub</div>
          <div class="link-sub">@ArchitectingSoftware</div>
        </div>
      </a>
      <a
        class="link-card"
        href="https://canvas.drexel.edu/"
        target="_blank"
        rel="noopener noreferrer"
      >
        <i class="bi bi-easel2 link-icon"></i>
        <div>
          <div class="link-title">Drexel Canvas</div>
          <div class="link-sub">Canvas LMS</div>
        </div>
      </a>
    </div>
  </div>
</div>

<style>
  .section-links {
    background-color: var(--c-navy);
    padding: var(--section-py) 0;
  }
  .section-container {
    max-width: 1000px;
    margin: 0 auto;
    padding: 0 1.5rem;
  }
  .links-heading {
    color: #ffffff;
  }
  .links-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
    gap: 1.25rem;
    max-width: 600px;
    margin: 0 auto;
  }
  .link-card {
    display: flex;
    align-items: center;
    gap: 1rem;
    padding: 1.25rem 1.5rem;
    background: rgba(255, 255, 255, 0.07);
    border: 1px solid rgba(255, 255, 255, 0.12);
    border-radius: var(--radius-card);
    text-decoration: none;
    color: rgba(255, 255, 255, 0.9);
    transition:
      background 0.2s,
      border-color 0.2s;
  }
  .link-card:hover {
    background: rgba(255, 198, 0, 0.12);
    border-color: rgba(255, 198, 0, 0.35);
    color: #ffffff;
  }
  .link-icon {
    font-size: 1.75rem;
    color: var(--c-gold);
    flex-shrink: 0;
  }
  .link-title {
    font-size: 1rem;
    font-weight: 600;
    color: #ffffff;
  }
  .link-sub {
    font-size: 0.82rem;
    color: rgba(255, 255, 255, 0.6);
    margin-top: 0.1rem;
  }
</style>
