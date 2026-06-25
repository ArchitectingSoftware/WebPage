<script lang="ts">
  import { onMount } from "svelte";
  import { slide } from "svelte/transition";

  type Pub = {
    id: number;
    title: string;
    cite: string;
    link: string;
    abstract: string;
  };

  let publications: Pub[] = [];
  let openAbstract: number | null = null;

  onMount(async () => {
    const res = await fetch(`./publications.json?v=${Date.now()}`);
    publications = await res.json();
  });

  $: sortedPublications = publications.slice().sort((a, b) => b.id - a.id);

  function toggleAbstract(id: number) {
    openAbstract = openAbstract === id ? null : id;
  }

  function handleKeydown(e: KeyboardEvent, id: number) {
    if (e.key === "Enter" || e.key === " ") {
      e.preventDefault();
      toggleAbstract(id);
    }
  }
</script>

<div class="section-research" id="research">
  <div class="section-container">
    <h2 class="section-heading">
      <i class="bi bi-journal-bookmark-fill"></i>Research
    </h2>
    <div class="container">
      <div class="phd-card">
        <h4 class="phd-label">Ph.D. Thesis</h4>
        <a
          class="phd-title-link"
          href="./pubs/MitchellPhD.pdf"
          target="_blank"
          rel="noopener noreferrer"
        >
          A Heuristic Search Approach to Solving the Software Clustering Problem
          <i class="bi bi-box-arrow-up-right ms-1"></i>
        </a>
        <p class="phd-desc">
          The focus of this work was to investigate recovering interesting views
          of the structure of software systems using heuristic search
          techniques. This work has applicability in multiple software
          engineering areas including: program understanding, software
          maintenance, and architecture recovery. As one of the founding members
          of the field of Search-Based Software Engineering (SBSE), this work
          has been widely cited by researchers interested in investigating
          software clustering algorithms and techniques.
        </p>
      </div>

      <h4 class="pubs-heading">Journal and Research Publications</h4>

      <div class="pub-list">
        {#each sortedPublications as pub, i (pub.id)}
          <div class="pub-card" class:is-open={openAbstract === pub.id}>
            <div
              class="pub-header"
              role="button"
              tabindex="0"
              on:click={() => toggleAbstract(pub.id)}
              on:keydown={(e) => handleKeydown(e, pub.id)}
            >
              <span class="pub-number">{i + 1}</span>
              <div class="pub-meta">
                <div class="pub-title">{pub.title}</div>
                <div class="pub-cite">{pub.cite}</div>
              </div>
              <div class="pub-actions">
                <a
                  class="pdf-btn"
                  href={pub.link}
                  target="_blank"
                  rel="noopener noreferrer"
                  title="View PDF"
                  on:click|stopPropagation
                >
                  <i class="bi bi-file-earmark-pdf"></i>
                  <span>PDF</span>
                </a>
                <span class="chevron" class:rotated={openAbstract === pub.id}>
                  <i class="bi bi-chevron-down"></i>
                </span>
              </div>
            </div>

            {#if openAbstract === pub.id}
              <div class="pub-abstract" transition:slide={{ duration: 200 }}>
                {pub.abstract}
              </div>
            {/if}
          </div>
        {/each}
      </div>
    </div>
  </div>
</div>

<style>
  .section-research {
    background-color: var(--c-off-white);
    padding: var(--section-py) 0;
  }
  .section-container {
    max-width: 1000px;
    margin: 0 auto;
    padding: 0 1.5rem;
  }

  /* PhD card */
  .phd-card {
    background: #ffffff;
    border: 1.5px solid var(--c-border);
    border-radius: var(--radius-card);
    padding: 1.5rem 2rem;
    margin-bottom: 2.5rem;
    box-shadow: var(--shadow-card);
  }
  .phd-label {
    font-size: 0.75rem;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 0.08em;
    color: var(--c-text-muted);
    margin-bottom: 0.5rem;
  }
  .phd-title-link {
    display: block;
    font-size: 1.1rem;
    font-weight: 700;
    color: var(--c-navy);
    text-decoration: none;
    margin-bottom: 1rem;
    line-height: 1.4;
  }
  .phd-title-link:hover {
    color: var(--c-navy);
    text-decoration: underline;
  }
  .phd-title-link i {
    font-size: 0.85em;
    opacity: 0.7;
  }
  .phd-desc {
    font-size: 0.97rem;
    color: var(--c-text-muted);
    line-height: 1.7;
    margin: 0;
  }

  /* Publications list */
  .pubs-heading {
    font-size: 1.1rem;
    font-weight: 700;
    color: var(--c-navy);
    margin-bottom: 1.25rem;
  }
  .pub-list {
    display: flex;
    flex-direction: column;
    gap: 0.6rem;
  }
  .pub-card {
    background: #ffffff;
    border: 1.5px solid var(--c-border);
    border-radius: var(--radius-card);
    box-shadow: var(--shadow-card);
    overflow: hidden;
    transition: border-color 0.15s;
  }
  .pub-card.is-open {
    border-color: var(--c-navy);
  }
  .pub-header {
    display: flex;
    align-items: flex-start;
    gap: 1rem;
    padding: 1rem 1.1rem;
    cursor: pointer;
    user-select: none;
    transition: background 0.12s;
  }
  .pub-header:hover {
    background: rgba(7, 41, 77, 0.03);
  }
  .pub-header:focus-visible {
    outline: 2px solid var(--c-navy);
    outline-offset: -2px;
  }
  .pub-number {
    flex-shrink: 0;
    width: 2rem;
    height: 2rem;
    background: var(--c-navy);
    color: #fff;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 0.78rem;
    font-weight: 700;
    margin-top: 0.1rem;
  }
  .pub-meta {
    flex: 1;
    min-width: 0;
  }
  .pub-title {
    font-size: 0.97rem;
    font-weight: 700;
    color: var(--c-navy);
    line-height: 1.45;
    margin-bottom: 0.3rem;
  }
  .pub-cite {
    font-size: 0.85rem;
    color: var(--c-text-muted);
    line-height: 1.5;
  }
  .pub-actions {
    flex-shrink: 0;
    display: flex;
    align-items: center;
    gap: 0.5rem;
    margin-top: 0.1rem;
  }
  .pdf-btn {
    display: inline-flex;
    align-items: center;
    gap: 0.25rem;
    font-size: 0.78rem;
    font-weight: 600;
    color: var(--c-navy);
    text-decoration: none;
    border: 1.5px solid var(--c-navy);
    border-radius: 2rem;
    padding: 0.2rem 0.6rem;
    transition:
      background 0.12s,
      color 0.12s;
    white-space: nowrap;
  }
  .pdf-btn:hover {
    background: var(--c-navy);
    color: #fff;
  }
  .chevron {
    color: var(--c-text-muted);
    font-size: 1rem;
    transition: transform 0.2s ease;
    display: flex;
    align-items: center;
  }
  .chevron.rotated {
    transform: rotate(180deg);
  }
  .pub-abstract {
    padding: 0.9rem 1.1rem 1rem calc(1.1rem + 2rem + 1rem);
    border-top: 1px solid var(--c-border);
    border-left: 3px solid var(--c-gold);
    font-size: 0.91rem;
    color: var(--c-text);
    line-height: 1.75;
    background: #fafafa;
  }

  @media (max-width: 600px) {
    .pub-number {
      display: none;
    }
    .pub-abstract {
      padding-left: 1rem;
    }
    .pdf-btn span {
      display: none;
    }
  }
</style>
