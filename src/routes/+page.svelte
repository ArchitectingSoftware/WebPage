<script lang="ts">
	import 'bootstrap/dist/css/bootstrap.min.css';
	import MyNav from '../MyNav.svelte';
	import MyHeader from '../MyHeader.svelte';
	import Teaching from '../Teaching.svelte';
	import AboutMe from '../AboutMe.svelte';
	import Research from '../Research.svelte';
	import HelpfulLinks from '../HelpfulLinks.svelte';
	import Talks from '../Talks.svelte';
	import TerminalSection from '../TerminalSection.svelte';
	import Terminal from '../Terminal.svelte';
	import { onMount } from 'svelte';

	onMount(() => {
		window.scrollTo(0, 0);
	});
</script>


<main>
	<MyNav />
	<MyHeader />
	<Teaching />
	<Research />
	<Talks />
	<AboutMe />
	<HelpfulLinks />
	<Terminal />
</main>
