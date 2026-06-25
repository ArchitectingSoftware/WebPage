<script lang="ts">
    import Fa from 'svelte-fa'
    import {faBuilding, faEnvelope } from '@fortawesome/free-solid-svg-icons'
    import {faTwitter, faGithub } from '@fortawesome/free-brands-svg-icons'

    import CCILogo from './assets/DrexelCCISmall.png'
    import BRIAN from './assets/BrianMitchell.jpg'
  </script>

  <style>
    .bkimage {
        background-image: url("./assets/drexel-dragon.png");
        background-size: cover;
    }
  </style>

  <div class="container-fluid p-0">
    <section class="text-center bkimage">
        <div class="row pt-5"></div>

        <div class="row justify-content-center">
        <div class="card mb-5" style="max-width:750px;">
            <div class="row">
                <h1 class="jumbotron-heading display-6 strong">Brian S. Mitchell, Ph.D.</h1>
            </div>
            <div class="row">
                <div class="col-12 col-sm-4 g-2 align-self-center">
                    <img src={BRIAN} class="img-fluid rounded-start" alt="Dr. Brian Mitchell" />
                    
                </div>
                <div class="col-12 col-sm-8">
                    <div class="card-body">
                        <div class="card-text g-0 align-self-center">
                            <img src={CCILogo} class="img-fluid d-none d-lg-block d-md-block" alt="CCI Logo" />
                            <h4 class="d-md-none"><code>$ whoami</code></h4>
                        </div>
                        <div class="card-text text-align-left lead lh-sm">
                            <small>
                            Welcome to my homepage.  I am a member of the Drexel University
                            Computer Science 
                            Department and teach a number of Software Engineering and
                            Systems classes.  My research activity and interests are at the 
                            intersection of Software Security, Modern AI,   
                            Cloud Computing, and IoT Devices.
                            </small>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row pt-3">
                <p>
                    <span><Fa icon={faBuilding}/></span> Office: 1134 |   
                          <br class="d-block d-sm-none" />
                    <span><Fa icon={faEnvelope}/></span> bmitchell@drexel.edu |   
                          <br class="d-block d-sm-none" />
                    <span><Fa icon={faTwitter}/></span> 
                            <a href="https://twitter.com/DrBrianMitchell">@DrBrianMitchell</a> |
                            <br class="d-block d-sm-none" />
                    <span><Fa icon={faGithub}/></span> 
                              <a href="https://github.com/ArchitectingSoftware">@ArchitectingSoftware </a>
                </p>
            </div>
        </div>
        </div>
    </section>
  </div>