<script lang="ts">
  import { onMount } from "svelte";

  type Course = {
    id: string;
    title: string;
    level: string;
    syllabus?: string;
  };

  let CourseList: Course[] = [];

  let togglerEl: HTMLElement | null = null;
  let toggler1El: HTMLElement | null = null;
  let isOpen1 = false;
  let isOpen2 = false;

  onMount(async () => {
    const res = await fetch("./courses.json");
    CourseList = await res.json();

    if (togglerEl) {
      togglerEl.addEventListener("show.bs.collapse", () => {
        isOpen1 = true;
      });
      togglerEl.addEventListener("hide.bs.collapse", () => {
        isOpen1 = false;
      });
    }

    if (toggler1El) {
      toggler1El.addEventListener("show.bs.collapse", () => {
        isOpen2 = true;
      });
      toggler1El.addEventListener("hide.bs.collapse", () => {
        isOpen2 = false;
      });
    }
  });

  $: gradCourses = CourseList.filter((c) => c.level === "Graduate");
  $: undergradCourses = CourseList.filter((c) => c.level === "Undergraduate");

  function hasSyllabus(course: Course): boolean {
    return !!course.syllabus && course.syllabus.trim() !== "";
  }
</script>

<div class="section-teaching" id="teaching">
  <div class="section-container">
    <h2 class="section-heading">Teaching, Student Research & Mentoring</h2>
    <div class="container">
      <div class="row lead text-align-left">
        <div class="col">
          <p>
            I teach (or have taught) a number of different courses at Drexel.
            They are listed below. In general I mix lectures with hands on demo
            and try to make my classes as interactive as possible. I use a
            number of different technologies to manage my classes. I try to use
            Drexel Learn (Blackboard) for its strengths in course organization,
            but complement with a number of other tools such as GitHub and
            Discord.
          </p>
        </div>
      </div>

      <div class="courses-grid">
        {#if gradCourses.length > 0}
          <div class="course-group">
            <h5 class="course-group-label">Graduate</h5>
            <div class="course-list">
              {#each gradCourses as course (course.id)}
                <div class="course-card">
                  <span class="course-id">{course.id}</span>
                  <span class="course-title">{course.title}</span>
                  {#if hasSyllabus(course)}
                    <a
                      class="syllabus-btn"
                      href={course.syllabus}
                      target="_blank"
                      rel="noopener noreferrer"
                      title="View syllabus"
                    >
                      <i class="bi bi-file-earmark-text"></i>
                      <span>Syllabus</span>
                    </a>
                  {:else}
                    <span class="no-syllabus">—</span>
                  {/if}
                </div>
              {/each}
            </div>
          </div>
        {/if}

        {#if undergradCourses.length > 0}
          <div class="course-group">
            <h5 class="course-group-label">Undergraduate</h5>
            <div class="course-list">
              {#each undergradCourses as course (course.id)}
                <div class="course-card">
                  <span class="course-id">{course.id}</span>
                  <span class="course-title">{course.title}</span>
                  {#if hasSyllabus(course)}
                    <a
                      class="syllabus-btn"
                      href={course.syllabus}
                      target="_blank"
                      rel="noopener noreferrer"
                      title="View syllabus"
                    >
                      <i class="bi bi-file-earmark-text"></i>
                      <span>Syllabus</span>
                    </a>
                  {:else}
                    <span class="no-syllabus">—</span>
                  {/if}
                </div>
              {/each}
            </div>
          </div>
        {/if}
      </div>

      <div class="row lead text-align-left justify-content-center mt-5">
        <div class="col-12 col-md-10 col-lg-8">
          <div class="card shadow-lg p-4 mb-4 mentoring-card">
            <h4 class="mb-3">Student Research and Mentoring</h4>
            <p class="mb-4">
              After spending many years in industry, I enjoy career mentoring
              and getting students involved in research. Please make
              arrangements to meet with me if this is something of interest to
              you. Here are a few other things that you should know about
              working with me (click to get more information). <strong
                >Click on a button below for more information.</strong
              >
            </p>
            <div
              class="d-flex flex-column flex-md-row justify-content-center align-items-stretch gap-3 mb-2"
            >
              <button
                class="btn btn-lg rounded-pill d-flex align-items-center justify-content-center gap-2 w-100 w-md-auto flex-fill {isOpen1
                  ? 'btn-custom-active'
                  : ''}"
                data-bs-toggle="collapse"
                data-bs-target="#toggler"
              >
                <i class="bi bi-file-earmark-text"></i> Recommendation Letters
              </button>

              <button
                class="btn btn-lg rounded-pill d-flex align-items-center justify-content-center gap-2 w-100 w-md-auto flex-fill {isOpen2
                  ? 'btn-custom-active'
                  : ''}"
                data-bs-toggle="collapse"
                data-bs-target="#toggler1"
              >
                <i class="bi bi-envelope"></i> Unsolicited Research Support Emails
              </button>
            </div>
            <div class="collapse mt-3" id="toggler" bind:this={togglerEl}>
              <div
                class="card card-body shadow-sm border-0"
                style="border-radius: 1rem;"
              >
                I get many requests every year for recommendation letters from
                students who have only taken a single course with me. I am happy
                to write you a letter, but I will only be able to comment to the
                extent of our relationship based on your performance in my
                class. This might be fine for a second or third letter, but
                often times employers and schools are looking for letters from
                people who have worked with the student directly over a longer
                period of time. For example, you worked in one of my labs, we
                worked on research together, you were a TA for some of my
                classes.
              </div>
            </div>
            <div class="collapse mt-3" id="toggler1" bind:this={toggler1El}>
              <div
                class="card card-body shadow-sm border-0"
                style="border-radius: 1rem;"
              >
                <p>
                  I receive dozens of emails every term from students seeking my
                  support to come to Drexel to do research work with me. These
                  emails are very nice, but I am unable to help with this, so
                  please do not expect a response. Please visit the
                  <a href="https://drexel.edu/cci/">Drexel CCI webpage</a> for information
                  on our undergraduate, graduate and PhD programs, including how to
                  apply.
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<style>
  .section-teaching {
    background-color: #ffffff;
    padding: var(--section-py) 0;
  }
  .section-container {
    max-width: 1000px;
    margin: 0 auto;
    padding: 0 1.5rem;
  }

  /* Course grid */
  .courses-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 2rem;
    margin-bottom: 1rem;
  }
  @media (max-width: 700px) {
    .courses-grid {
      grid-template-columns: 1fr;
    }
  }

  .course-group-label {
    font-size: 0.72rem;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 0.09em;
    color: var(--c-text-muted);
    margin-bottom: 0.6rem;
    padding-bottom: 0.4rem;
    border-bottom: 2px solid var(--c-gold);
  }

  .course-list {
    display: flex;
    flex-direction: column;
    gap: 0.45rem;
  }

  .course-card {
    display: flex;
    align-items: center;
    gap: 0.75rem;
    background: #ffffff;
    border: 1.5px solid var(--c-border);
    border-radius: var(--radius-card);
    padding: 0.6rem 0.85rem;
    box-shadow: var(--shadow-card);
    transition: border-color 0.12s;
  }
  .course-card:hover {
    border-color: rgba(7, 41, 77, 0.3);
  }

  .course-id {
    flex-shrink: 0;
    font-family: "Courier New", monospace;
    font-size: 0.78rem;
    font-weight: 700;
    color: #fff;
    background: var(--c-navy);
    border-radius: 0.3rem;
    padding: 0.2rem 0.45rem;
    letter-spacing: 0.03em;
    white-space: nowrap;
  }

  .course-title {
    flex: 1;
    font-size: 0.88rem;
    color: var(--c-text);
    line-height: 1.35;
    min-width: 0;
  }

  .syllabus-btn {
    flex-shrink: 0;
    display: inline-flex;
    align-items: center;
    gap: 0.25rem;
    font-size: 0.75rem;
    font-weight: 600;
    color: var(--c-navy);
    text-decoration: none;
    border: 1.5px solid var(--c-navy);
    border-radius: 2rem;
    padding: 0.18rem 0.55rem;
    white-space: nowrap;
    transition:
      background 0.12s,
      color 0.12s;
  }
  .syllabus-btn:hover {
    background: var(--c-navy);
    color: #fff;
  }

  .no-syllabus {
    flex-shrink: 0;
    width: 1.5rem;
    text-align: center;
    color: var(--c-border);
    font-size: 0.9rem;
  }

  /* Mentoring card */
  .mentoring-card {
    background: #ffffff !important;
    border: 1.5px solid var(--c-border);
    box-shadow: var(--shadow-card);
    color: var(--c-text);
    border-radius: var(--radius-card);
  }
  .mentoring-card h4,
  .mentoring-card p,
  .mentoring-card a,
  .mentoring-card button {
    color: var(--c-text);
  }
  .mentoring-card .btn {
    background: var(--c-navy);
    color: #fff;
    border: none;
    border-radius: 2rem;
    font-size: 1rem;
    padding: 0.65rem 1.75rem;
    box-shadow: none;
    transition: background 0.2s;
  }
  .mentoring-card .btn:hover {
    background: #0a3d6b;
  }
  .mentoring-card .btn.btn-custom-active {
    background: #0a3d6b;
    border-bottom: 2px solid var(--c-gold);
  }
  .mentoring-card .btn.btn-custom-active:hover,
  .mentoring-card .btn.btn-custom-active:focus {
    background: #082d4e;
  }
  .mentoring-card .btn:focus:hover {
    background: #0a3d6b;
  }
  .mentoring-card .btn:focus:not(:hover):not(.btn-custom-active) {
    background: var(--c-navy);
  }
</style>
