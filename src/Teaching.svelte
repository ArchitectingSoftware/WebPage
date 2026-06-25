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

  let isOpen1 = false; // Not reactive declaration here
  let isOpen2 = false; // Not reactive declaration here

  onMount(async () => {
    const res = await fetch("./courses.json");
    CourseList = await res.json();

    if (togglerEl) {
      togglerEl.addEventListener("show.bs.collapse", () => {
        isOpen1 = true; // Svelte state updates when Bootstrap shows it
      });
      togglerEl.addEventListener("hide.bs.collapse", () => {
        isOpen1 = false; // Svelte state updates when Bootstrap hides it
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
</script>

<div class="container-fluid drexel-light-blue py-5" id="teaching">
  <section class="jumbotron">
    <h2 class="jumbotron-heading display-6 text-center">
      Teaching, Student Research & Mentoring
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
      <div class="row">
        <div class="table-responsive">
          <table class="table table-hover">
            <thead>
              <tr>
                <th>
                  <div class="syllabus-header-hint">
                    [ <i class="bi bi-journal-text syllabus-header-icon"></i> Syllabus
                    ]
                  </div>
                  <div class="course-number-label">Course Number</div>
                </th>
                <th>Course Title</th>
                <th>Course Level</th>
              </tr>
            </thead>
            <tbody>
              {#each CourseList as course (course.id)}
                <tr
                  class:clickable-row={course.syllabus &&
                    course.syllabus !== ""}
                  on:click={() => {
                    if (course.syllabus && course.syllabus !== "") {
                      window.open(course.syllabus, "_blank", "noopener");
                    }
                  }}
                  style="user-select: none;"
                  title={course.syllabus && course.syllabus !== ""
                    ? "Click row to view syllabus"
                    : undefined}
                >
                  <th scope="row">
                    {#if course.syllabus && course.syllabus !== ""}
                      <span class="syllabus-icon-link">
                        <i class="bi bi-journal-text syllabus-header-icon"></i>
                      </span>
                      <span class="course-id-with-icon">{course.id}</span>
                    {:else}
                      {course.id}
                    {/if}
                  </th>
                  <td>{course.title}</td>
                  <td>{course.level}</td>
                </tr>
              {/each}
            </tbody>
          </table>
        </div>
      </div>
      <div class="row lead text-align-left justify-content-center">
        <div class="col-12 col-md-10 col-lg-8">
          <div
            class="card shadow-lg p-4 mb-4 mentoring-card"
            style="border-radius: 1.25rem;"
          >
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
      <div class="row lead text-align-left">
        <div class="col"></div>
      </div>
    </div>
  </section>
</div>

<style>
  :global(.drexel-light-blue .table) {
    background-color: transparent !important;
  }

  :global(.drexel-light-blue .table th),
  :global(.drexel-light-blue .table td) {
    background-color: transparent !important;
    border-color: rgba(0, 0, 0, 0.1) !important;
    font-size: 1.18em;
  }

  :global(.drexel-light-blue .table-hover tbody tr:hover) {
    background-color: rgba(0, 0, 0, 0.05) !important;
  }
  .mentoring-card {
    background: #eaf4fb !important;
    border: 2px solid #357ab8;
    box-shadow: 0 4px 24px rgba(0, 0, 0, 0.08);
    color: #222;
  }
  .mentoring-card h4,
  .mentoring-card p,
  .mentoring-card a,
  .mentoring-card button {
    color: #222;
  }

  /* Base style for ALL buttons within .mentoring-card.
   This should define common properties like padding, border-radius, box-shadow, transition.
   Avoid setting a background-color here if you want other specific classes to easily override.
  */

  /* Base style for ALL buttons within .mentoring-card */
  .mentoring-card .btn {
    background: #357ab8; /* Your initial light blue */
    color: #fff;
    border: none;
    border-radius: 2rem;
    font-size: 1.1rem;
    padding: 0.75rem 2rem;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
    transition:
      background 0.2s,
      box-shadow 0.2s;
  }

  /* Hover/Focus state for ALL buttons */
  /* Hover state for ALL buttons */
  .mentoring-card .btn:hover {
    background: #245080; /* Your desired dark blue hover color */
    color: #fff;
    box-shadow: 0 4px 16px rgba(0, 0, 0, 0.12);
  }

  /* Focus state - only apply dark color if button is also being hovered */
  .mentoring-card .btn:focus:hover {
    background: #245080;
    color: #fff;
    box-shadow: 0 4px 16px rgba(0, 0, 0, 0.12);
  }

  /* Focus state without hover - keep original color */
  .mentoring-card .btn:focus:not(:hover):not(.btn-custom-active) {
    background: #357ab8; /* Your original light blue */
    color: #fff;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
  }

  /* Active state for custom buttons (when collapse is open) */
  .mentoring-card .btn.btn-custom-active {
    background: #245080; /* Match the dark blue hover color */
  }

  /* Ensure active state also considers hover/focus */
  .mentoring-card .btn.btn-custom-active:hover,
  .mentoring-card .btn.btn-custom-active:focus {
    background: #1a385a; /* Slightly darker shade for active-and-hover/focus */
  }

  .syllabus-icon-link {
    margin-left: 6px;
    color: #357ab8;
    font-size: 1.15em;
    vertical-align: middle;
    text-decoration: none;
    display: inline-block;
  }
  .syllabus-icon-link:hover {
    color: #245080;
    text-decoration: underline;
  }
  .syllabus-icon-link i {
    vertical-align: -2px;
  }
  .syllabus-header-hint {
    font-size: 1.05em;
    color: #245080;
    font-weight: 500;
    margin-bottom: 2px;
    letter-spacing: 0.01em;
    display: flex;
    align-items: center;
    gap: 3px;
  }
  .syllabus-header-icon,
  .syllabus-icon-link i {
    color: #ffc600;
    font-size: 1.25em;
    font-weight: bold;
    vertical-align: -2px;
    background: none;
    box-shadow: none;
    filter: none;
  }
  .course-number-label {
    font-size: 0.98em;
    color: #222;
    font-weight: bold;
    margin-top: 0px;
  }
  .course-id-with-icon {
    margin-left: 6px;
  }
  @media (max-width: 768px) {
    .syllabus-header-hint {
      display: none;
    }
  }
  .clickable-row {
    cursor: pointer;
    transition: background 0.15s;
  }
  .clickable-row:hover {
    background-color: #b3d6f7 !important;
  }
</style>
