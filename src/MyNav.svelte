<script lang="ts">
    let isOpen = false;
  
    function toggleNavbar() {
      isOpen = !isOpen;
    }
  </script>

  <style>
    .navbar-nav .nav-link {
      font-size: 1.10em;
    }
  </style>
  

  <nav class="navbar navbar-expand-md navbar-dark sticky-top drexel-blue">
    <div class="container-fluid">
      <a class="navbar-brand" href="/"><code style="color: #FFC600">/* My Address Space */</code></a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" on:click={toggleNavbar} aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav" class:show={isOpen}>
        <ul class="navbar-nav ms-auto">
          <li class="nav-item">
            <a class="nav-link" href="#teaching" style="color: #FFC600">TEACHING</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#research" style="color: #FFC600">RESEARCH</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#talks" style="color: #FFC600">TALKS</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#me" style="color: #FFC600">ABOUT</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#terminal" style="color: #FFC600">TERMINAL</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
