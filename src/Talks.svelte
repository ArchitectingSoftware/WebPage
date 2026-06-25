<script lang="ts">
  import { onMount } from "svelte";
  type Talk = {
    title: string;
    type: string;
  };
  let talks: Talk[] = [];
  onMount(async () => {
    const res = await fetch("./talks.json");
    talks = await res.json();
  });
</script>

<div class="section-talks" id="talks">
  <div class="section-container">
    <h2 class="section-heading">Conference and Technical Talks</h2>
    <div class="container">
      <div class="row lead text-align-left">
        <div class="col">
          <p>The following are some talks that I have given at conferences</p>
        </div>
      </div>
      <div class="row">
        <div class="col">
          <table class="talks-table">
            <thead>
              <tr>
                <th>Title</th>
                <th>Type</th>
              </tr>
            </thead>
            <tbody>
              {#each talks as talk (talk.title)}
                <tr>
                  <td>{talk.title}</td>
                  <td>{talk.type}</td>
                </tr>
              {/each}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>

<style>
  .section-talks {
    background-color: #ffffff;
    padding: var(--section-py) 0;
  }
  .section-container {
    max-width: 1000px;
    margin: 0 auto;
    padding: 0 1.5rem;
  }
  .talks-table {
    width: 100%;
    background: transparent;
    color: var(--c-text);
    border-collapse: collapse;
    margin-top: 1.25rem;
  }
  .talks-table th,
  .talks-table td {
    border-bottom: 1px solid var(--c-border);
    padding: 0.85rem 0.75rem;
    text-align: left;
    font-size: 0.97rem;
  }
  .talks-table th {
    color: var(--c-navy);
    font-weight: 700;
    font-size: 0.8rem;
    text-transform: uppercase;
    letter-spacing: 0.07em;
    border-bottom: 2px solid var(--c-gold);
    background: transparent;
  }
  .talks-table tbody tr:hover {
    background-color: rgba(7, 41, 77, 0.04);
  }
  .talks-table tr:last-child td {
    border-bottom: none;
  }
</style>
