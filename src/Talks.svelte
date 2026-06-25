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

<div class="container-fluid drexel-blue-2 py-5" id="talks">
  <section class="jumbotron">
    <h2 class="jumbotron-heading display-6 text-center drexel-font-yellow">
      Conference and Technical Talks
    </h2>
    <div class="container">
      <div class="row lead text-align-left">
        <div class="col">
          <p class="drexel-font-white">
            The following are some talks that I have given at conferences
          </p>
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
  </section>
</div>

<style>
  .talks-table {
    width: 100%;
    background: transparent;
    color: white;
    border-collapse: collapse;
    margin-top: 1.5em;
  }
  .talks-table th,
  .talks-table td {
    border-bottom: 1px solid #3a3a3a;
    padding: 0.7em 0.5em;
    text-align: left;
    font-size: 1.18em;
  }
  .talks-table th {
    color: #ffc600;
    font-weight: bold;
    background: transparent;
  }
  .talks-table tr:last-child td {
    border-bottom: none;
  }
  @media (max-width: 600px) {
    .talks-table th,
    .talks-table td {
      font-size: 0.97em;
      padding: 0.5em 0.2em;
    }
  }
</style>
