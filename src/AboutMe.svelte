<script lang="ts">
  import MITCHELL_FAMILY from "./assets/MitchellFamily.jpg";
</script>

<div class="section-about" id="me">
  <div class="section-container">
    <h2 class="section-heading"><i class="bi bi-person-fill"></i>About Me</h2>
    <div class="container">
      <div class="row lead text-align-left">
        <div class="col about-text">
          <img
            alt="Mitchell Family"
            src={MITCHELL_FAMILY}
            class="about-photo"
          />

          <p>
            For more than 20 years I balanced an active career in both industry
            and academia. In the summer of 2022 I decided to leave industry and
            put all of my energy into my academic teaching and research
            interests. My last industry role was at a Fortune 15 company where I
            worked on driving digital innovation and creating products that are
            used daily by millions of people. I held the role of Distinguished
            Engineer, which gave me the opportunity to lead and work with
            thousands of talented engineers across the company. Collectively we
            helped to create a culture where we could use disruptive
            technologies to differentiate our services from competitors. For
            example, we aggressively adopted the public cloud, built
            competencies in developing solutions using complex cloud native
            architectures, and starting contributing to open source and
            patenting our own technology inventions.
          </p>
          <p>
            In addition to jobs that involve talking and pushing buttons I am a
            proficient Carpenter, IoT Maker, and sometimes even an appliance
            repair man. I have built many decks, lots of finish carpentry, built
            furniture, and significant home remodels. My wife is an accomplished
            musician and my son has many academic, musical, and sports talents.
          </p>
        </div>
      </div>
    </div>
  </div>
</div>

<style>
  .section-about {
    background-color: var(--c-off-white);
    padding: var(--section-py) 0;
  }
  .section-container {
    max-width: 1000px;
    margin: 0 auto;
    padding: 0 1.5rem;
  }
  .about-photo {
    max-width: 280px;
    width: 100%;
    border-radius: 0.5rem;
    box-shadow: var(--shadow-card);
    margin: 0 1.75rem 1rem 0;
    float: left;
  }
  .about-text p {
    font-size: 1.02rem;
    line-height: 1.8;
    color: var(--c-text);
    margin-bottom: 1rem;
  }
  @media (max-width: 575px) {
    .about-photo {
      float: none;
      display: block;
      margin: 0 auto 1.5rem;
      max-width: 100%;
    }
  }
</style>
