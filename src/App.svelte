<script lang="ts">
  import 'bootstrap/dist/css/bootstrap.min.css';
  import MyNav from './MyNav.svelte';
  import MyHeader from './MyHeader.svelte';
  import Teaching from './Teaching.svelte';
  import AboutMe from './AboutMe.svelte';
  import Research from './Research.svelte';
  import HelpfulLinks from './HelpfulLinks.svelte';
  import Talks from './Talks.svelte';
</script>

<main>
  <MyNav></MyNav>
  <MyHeader></MyHeader>
  <Teaching></Teaching>
  <Research></Research>
  <Talks></Talks>
  <AboutMe></AboutMe>
  <HelpfulLinks></HelpfulLinks>
</main>

<style>
</style>