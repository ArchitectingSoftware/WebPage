<script lang="ts">
  import { onMount } from "svelte";
  import { slide } from "svelte/transition";

  type Course = {
    id: string;
    title: string;
    level: string;
    syllabus?: string;
  };

  let CourseList: Course[] = [];
  let isOpen1 = false;
  let isOpen2 = false;

  onMount(async () => {
    const res = await fetch("./courses.json");
    CourseList = await res.json();
  });

  $: gradCourses = CourseList.filter((c) => c.level === "Graduate");
  $: undergradCourses = CourseList.filter((c) => c.level === "Undergraduate");

  function hasSyllabus(course: Course): boolean {
    return !!course.syllabus && course.syllabus.trim() !== "";
  }
</script>

<div class="section-teaching" id="teaching">
  <div class="section-container">
    <h2 class="section-heading">
      <i class="bi bi-mortarboard-fill"></i>Teaching, Student Research &amp;
      Mentoring
    </h2>
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

      <div class="mentoring-section">
        <h4 class="mentoring-heading">Student Research &amp; Mentoring</h4>
        <p class="mentoring-intro">
          After spending many years in industry, I enjoy career mentoring and
          getting students involved in research. Please make arrangements to
          meet with me if this is of interest. A few things worth knowing about
          working with me — click either topic below.
        </p>

        <div class="faq-list">
          <div class="faq-item" class:is-open={isOpen1}>
            <button
              class="faq-header"
              on:click={() => (isOpen1 = !isOpen1)}
              aria-expanded={isOpen1}
            >
              <span class="faq-icon">
                <i class="bi bi-file-earmark-text"></i>
              </span>
              <span class="faq-title">Recommendation Letters</span>
              <span class="faq-chevron" class:rotated={isOpen1}>
                <i class="bi bi-chevron-down"></i>
              </span>
            </button>
            {#if isOpen1}
              <div class="faq-body" transition:slide={{ duration: 200 }}>
                I get many requests every year for recommendation letters from
                students who have only taken a single course with me. I am happy
                to write you a letter, but I will only be able to comment to the
                extent of our relationship based on your performance in my
                class. This might be fine for a second or third letter, but
                often times employers and schools are looking for letters from
                people who have worked with the student directly over a longer
                period of time — for example, you worked in one of my labs, we
                worked on research together, or you were a TA for some of my
                classes.
              </div>
            {/if}
          </div>

          <div class="faq-item" class:is-open={isOpen2}>
            <button
              class="faq-header"
              on:click={() => (isOpen2 = !isOpen2)}
              aria-expanded={isOpen2}
            >
              <span class="faq-icon">
                <i class="bi bi-envelope"></i>
              </span>
              <span class="faq-title">Unsolicited Research Support Emails</span>
              <span class="faq-chevron" class:rotated={isOpen2}>
                <i class="bi bi-chevron-down"></i>
              </span>
            </button>
            {#if isOpen2}
              <div class="faq-body" transition:slide={{ duration: 200 }}>
                I receive dozens of emails every term from students seeking my
                support to come to Drexel to do research work with me. These
                emails are very nice, but I am unable to help with this, so
                please do not expect a response. Please visit the
                <a
                  href="https://drexel.edu/cci/"
                  target="_blank"
                  rel="noopener noreferrer">Drexel CCI webpage</a
                > for information on our undergraduate, graduate, and PhD programs,
                including how to apply.
              </div>
            {/if}
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

  /* Mentoring / FAQ section */
  .mentoring-section {
    margin-top: 3.5rem;
    max-width: 760px;
    margin-left: auto;
    margin-right: auto;
  }
  .mentoring-heading {
    font-size: 1.1rem;
    font-weight: 700;
    color: var(--c-navy);
    margin-bottom: 0.6rem;
  }
  .mentoring-intro {
    font-size: 0.95rem;
    color: var(--c-text-muted);
    line-height: 1.7;
    margin-bottom: 1.25rem;
  }
  .faq-list {
    display: flex;
    flex-direction: column;
    gap: 0.6rem;
  }
  .faq-item {
    background: #ffffff;
    border: 1.5px solid var(--c-border);
    border-radius: var(--radius-card);
    box-shadow: var(--shadow-card);
    overflow: hidden;
    transition: border-color 0.15s;
  }
  .faq-item.is-open {
    border-color: var(--c-navy);
  }
  .faq-header {
    width: 100%;
    display: flex;
    align-items: center;
    gap: 0.9rem;
    padding: 0.9rem 1.1rem;
    background: none;
    border: none;
    cursor: pointer;
    text-align: left;
    transition: background 0.12s;
  }
  .faq-header:hover {
    background: rgba(7, 41, 77, 0.03);
  }
  .faq-header:focus-visible {
    outline: 2px solid var(--c-navy);
    outline-offset: -2px;
  }
  .faq-icon {
    flex-shrink: 0;
    width: 2.1rem;
    height: 2.1rem;
    background: var(--c-navy);
    color: #fff;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1rem;
  }
  .faq-title {
    flex: 1;
    font-size: 0.95rem;
    font-weight: 600;
    color: var(--c-navy);
  }
  .faq-chevron {
    flex-shrink: 0;
    color: var(--c-text-muted);
    font-size: 1rem;
    display: flex;
    align-items: center;
    transition: transform 0.2s ease;
  }
  .faq-chevron.rotated {
    transform: rotate(180deg);
  }
  .faq-body {
    padding: 0.85rem 1.1rem 1rem calc(1.1rem + 2.1rem + 0.9rem);
    border-top: 1px solid var(--c-border);
    border-left: 3px solid var(--c-gold);
    font-size: 0.91rem;
    color: var(--c-text);
    line-height: 1.75;
    background: #fafafa;
  }
  .faq-body a {
    color: var(--c-navy);
    font-weight: 600;
  }
  .faq-body a:hover {
    text-decoration: underline;
  }
  @media (max-width: 600px) {
    .faq-body {
      padding-left: 1rem;
    }
  }
</style>
