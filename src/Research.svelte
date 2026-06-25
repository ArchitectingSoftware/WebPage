<script lang="ts">
    import Fa from 'svelte-fa'
    import {faBuilding, faEnvelope } from '@fortawesome/free-solid-svg-icons'
    import {faTwitter, faGithub } from '@fortawesome/free-brands-svg-icons'

    import CCILogo from './assets/DrexelCCISmall.png'
    import BSM from './assets/bmitchellHeader.png'
    import BRIAN from './assets/BrianMitchell.jpg'
    import MITCHELL_FAMILY from './assets/MitchellFamily.jpg'
    import Counter from './lib/Counter.svelte';

    import { PublicationsList } from './lib/publications';
    import { onMount } from 'svelte';

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
        const res = await fetch('./publications.json');
        const data = await res.json();
        publications = data;
    });

    $: sortedPublications = publications.slice().sort((a, b) => b.id - a.id);

    function toggleAbstract(id: number) {
        openAbstract = openAbstract === id ? null : id;
    }

    // SVG for PDF icon
    const pdfIcon = `<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' style='vertical-align:middle;margin-left:3px' viewBox='0 0 24 24' fill='none' stroke='#d32f2f' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'><rect x='2' y='2' width='20' height='20' rx='2.18' ry='2.18'/><path d='M7 7h10M7 11h10M7 15h4'/></svg>`;
</script>

<style>
    .citation-list {
        padding: 0;
        margin: 0;
    }
    .citation-item {
        list-style: none;
        margin-bottom: 1.5em;
        padding-bottom: 1.5em;
        border-bottom: 1px solid #bbb;
        text-indent: -2em;
        padding-left: 2em;
        position: relative;
        display: block;
        font-size: 1.10em;
    }
    .citation-title {
        color: #1a4e8a;
        font-weight: bold;
        text-decoration: underline;
        margin-right: 0.3em;
        word-break: break-word;
        cursor: pointer;
        display: inline;
        font-size: 1.10em;
    }
    .citation-title:hover {
        text-decoration: underline dotted;
    }
    .citation-meta {
        color: #222;
        font-size: 1.10em;
        word-break: break-word;
        margin-left: 0.2em;
        display: inline;
    }
    .abstract-btn {
        margin-left: 0.7em;
        font-size: 0.95em;
        color: #1a4e8a;
        background: none;
        border: none;
        cursor: pointer;
        text-decoration: underline;
        padding: 0;
    }
    .abstract-box {
        background: #f5f5f5;
        color: #222;
        border-radius: 0.5em;
        margin: 0.7em 0 0.5em 0;
        padding: 1em;
        font-size: 0.97em;
        text-indent: 0;
        width: 100%;
    }
    @media (max-width: 600px) {
        .citation-item {
            text-indent: 0;
            padding-left: 0.5em;
            display: block;
        }
        .abstract-box {
            font-size: 0.95em;
            padding: 0.7em;
        }
    }
    .phd-title {
        font-size: 1.10em;
    }
    .phd-desc {
        font-size: 1.10em;
    }
</style>

<div class="container-fluid drexel-gray py-5" id="research">
    <section class="jumbotron">
        <h2 class="jumbotron-heading display-6 text-center">Research</h2>
        <div class="container">
            <div class="row">
                <h4>Ph.D. Thesis</h4>
            </div>
            <div class="row text-align-left">
                <span class="font-italic fw-bold phd-title">
                    <a class="citation-title" href="./pubs/MitchellPhD.pdf" target="_blank" rel="noopener noreferrer" title="View PDF">
                        A Heuristic Search Approach to Solving the Software Clustering Problem
                        {@html pdfIcon}
                    </a>
                </span>
                <p class="phd-desc">
                    The focus of this work was to investigate recovering interesting views of 
                    the structure of software systems using heuristic search techniques. This 
                    work has applicability in multiple software engineering areas including: 
                    program understanding, software maintenance, and architecture recovery. 
                    As one of the founding members of the field of Search-Based Software 
                    Engineering (SBSE), this work has been widely cited by researchers 
                    interested in investigating software clustering algorithms and techniques.
                </p>
            </div>
            <div class="row">
                <h4>Journal and Research Publications</h4>
            </div>
            
            <div class="row">
                <div class="col">
                    <ul class="citation-list">
                        {#each sortedPublications as pub}
                            <li class="citation-item">
                                <a class="citation-title" href={pub.link} target="_blank" rel="noopener noreferrer" title="View PDF">
                                    {pub.title}
                                    {@html pdfIcon}
                                </a>
                                <span class="citation-meta">{pub.cite}</span>
                                <button class="abstract-btn" on:click={() => toggleAbstract(pub.id)}>
                                    {openAbstract === pub.id ? 'Hide abstract' : 'Show abstract'}
                                </button>
                                {#if openAbstract === pub.id}
                                    <div class="abstract-box">{pub.abstract}</div>
                                {/if}
                            </li>
                        {/each}
                    </ul>
                </div>
            </div>
           
        </div>
        
    </section>
</div>