<script lang="ts">
    import Fa from 'svelte-fa'
    import {faBuilding, faEnvelope } from '@fortawesome/free-solid-svg-icons'
    import {faTwitter, faGithub } from '@fortawesome/free-brands-svg-icons'

    import CCILogo from './assets/DrexelCCISmall.png'
    import BSM from './assets/bmitchellHeader.png'
    import BRIAN from './assets/BrianMitchell.jpg'
    import MITCHELL_FAMILY from './assets/MitchellFamily.jpg'
    import Counter from './lib/Counter.svelte';
  </script>

  <style>
    a.drexel-link {
        color: white;
        text-decoration: none;
    }
    a.drexel-link:hover {
        color: #FFC600;
        text-decoration: none;
        font-weight: bold;
    }
  </style>
  
  <div class="container-fluid drexel-blue py-5" id="links">
    <section class="jumbotron drexel-font-yellow">
        <h2 class="jumbotron-heading display-6 text-center">Helpful Links</h2>
        <div class="container">
            <div class="row lead text-align-left">
                <div class="col">                    
                    <p>
                        Below are some helpful links to online resources
                    </p>
                </div>
            </div>
            <div class="row">
                <a class="drexel-link" 
                    href="https://github.com/ArchitectingSoftware"> 
                    My Github Page - @ArchitectingSoftware 
                </a>
                <a class="drexel-link" href="https://learn.dcollege.net/"> 
                    Drexel Learn (Blackboard)</a>
            </div>
           
        </div>
        
    </section>
  </div>