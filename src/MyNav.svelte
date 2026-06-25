<script lang="ts">
  let isOpen = false;

  function toggleNavbar() {
    isOpen = !isOpen;
  }
</script>

<nav class="site-nav navbar navbar-expand-md sticky-top">
  <div class="container-xl">
    <a class="navbar-brand nav-brand" href="/">
      <code>/* My Address Space */</code>
    </a>
    <button
      class="navbar-toggler"
      type="button"
      data-bs-toggle="collapse"
      data-bs-target="#navbarNav"
      on:click={toggleNavbar}
      aria-label="Toggle navigation"
    >
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav" class:show={isOpen}>
      <ul class="navbar-nav ms-auto">
        <li class="nav-item">
          <a class="nav-link site-link" href="#teaching">Teaching</a>
        </li>
        <li class="nav-item">
          <a class="nav-link site-link" href="#research">Research</a>
        </li>
        <li class="nav-item">
          <a class="nav-link site-link" href="#talks">Talks</a>
        </li>
        <li class="nav-item">
          <a class="nav-link site-link" href="#me">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link site-link" href="#terminal">Terminal</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<style>
  .site-nav {
    background-color: var(--c-navy);
    border-bottom: 2px solid var(--c-gold);
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
    padding-top: 0.55rem;
    padding-bottom: 0.55rem;
  }

  .nav-brand code {
    color: var(--c-gold);
    font-size: 0.92rem;
    font-weight: 600;
    letter-spacing: -0.01em;
  }

  :global(.site-nav .navbar-toggler) {
    border-color: rgba(255, 255, 255, 0.25);
  }

  :global(.site-nav .navbar-toggler-icon) {
    filter: invert(1);
  }

  :global(.site-nav .navbar-collapse) {
    background-color: var(--c-navy);
  }

  .site-link {
    color: rgba(255, 255, 255, 0.82) !important;
    font-size: 0.82rem;
    font-weight: 600;
    letter-spacing: 0.08em;
    text-transform: uppercase;
    padding: 0.45rem 0.9rem !important;
    border-radius: 0.35rem;
    transition:
      color 0.15s,
      background 0.15s;
  }

  .site-link:hover {
    color: var(--c-gold) !important;
    background: rgba(255, 255, 255, 0.07);
  }
</style>
