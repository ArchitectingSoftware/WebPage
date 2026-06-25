<script lang="ts">
  import { onMount, afterUpdate } from "svelte";

  let input = "";
  let output: string[] = [];
  let history: string[] = [];
  let historyIndex = -1;
  let inputEl: HTMLInputElement;
  let terminalEl: HTMLDivElement;
  type ContactLink = Record<string, string>;
  type ContactData = {
    name?: string;
    dept?: string;
    college?: string;
    office?: string;
    links?: ContactLink[];
  };
  type CourseItem = {
    id: string;
    title: string;
    level: string;
    syllabus?: string;
  };
  type PubItem = {
    id: number;
    title: string;
    cite: string;
    link: string;
    abstract: string;
  };

  let coursesData: CourseItem[] = [];
  let contactData: ContactData = {};
  let publicationsData: PubItem[] = [];

  const commands: Record<string, string | ((args: string[]) => string)> = {
    help: (args: string[]) => {
      if (args.includes("-h") || args.includes("--help")) {
        return '<div class="text-info">Prints a list of available commands</div>';
      }
      const allCommands = Object.keys(commands);
      const otherCommands = allCommands.filter((cmd) => cmd !== "help").sort();
      const orderedCommands = ["help", ...otherCommands];
      return `Available commands: <span class="text-info">${orderedCommands.join(", ")}</span>`;
    },
    about: (args: string[]) => {
      if (args.includes("-h") || args.includes("--help")) {
        return '<div class="text-info">Prints information about me</div>';
      }
      return `<div class="text-white">
<p>For more than 20 years I balanced an active career in both industry and academia. In the summer of 2022 I decided to leave industry and put all of my energy into my academic teaching and research interests. My last industry role was at a Fortune 15 company where I worked on driving digital innovation and creating products that are used daily by millions of people. I held the role of Distinguished Engineer, which gave me the opportunity to lead and work with thousands of talented engineers across the company. Collectively we helped to create a culture where we could use disruptive technologies to differentiate our services from competitors. For example, we aggressively adopted the public cloud, built competencies in developing solutions using complex cloud native architectures, and starting contributing to open source and patenting our own technology inventions.</p>

<p>In addition to jobs that involve talking and pushing buttons I am a proficient Carpenter, IoT Maker, and sometimes even an appliance repair man. I have built many decks, lots of finish carpentry, built furniture, and significant home remodels. My wife is an accomplished musician and my son has many academic, musical, and sports talents.</p>
</div>`;
    },
    clear: (args: string[]) => {
      if (args.includes("-h") || args.includes("--help")) {
        return '<div class="text-info">Clears the console window</div>';
      }
      output = [];
      return "";
    },
    contact: (args: string[]) => {
      if (args.includes("-h") || args.includes("--help")) {
        return '<div class="text-info">Prints my current contact information and hyperlinks to important websites</div>';
      }
      if (!contactData.name) {
        return '<span class="text-warning">⚠️ Contact data not loaded</span>';
      }

      let contactHtml = `<pre class="text-info">{
    "name": "${contactData.name}",
    "dept": "${contactData.dept}",
    "college": "${contactData.college}",
    "office": "${contactData.office}",
    "links": [`;

      if (contactData.links && contactData.links.length > 0) {
        const links = contactData.links;
        links.forEach((linkObj: ContactLink, index: number) => {
          const isLast = index === links.length - 1;
          const comma = isLast ? "" : ",";

          const key = Object.keys(linkObj)[0];
          const url = linkObj[key];

          contactHtml += `
        {"${key}": "<a href="${url}" class="link-info" target="_blank">${url}</a>"}${comma}`;
        });
      }

      contactHtml += `
    ]
}</pre>`;

      return contactHtml;
    },
    courses: (args: string[]) => {
      if (args.includes("-h") || args.includes("--help")) {
        return `<div class="text-info">courses command usage:</div>
<div class="ms-3">
  <div><strong>courses</strong> - Display all courses</div>
  <div><strong>courses [pattern]</strong> - Filter courses by ID pattern (e.g., CS* for all CS courses)</div>
  <div><strong>courses -h, --help</strong> - Show this help message</div>
</div>
<div class="mt-2 text-warning">Examples:</div>
<div class="ms-3">
  <div>courses</div>
  <div>courses CS*</div>
  <div>courses SE*</div>
</div>`;
      }

      if (coursesData.length === 0) {
        return '<span class="text-warning">⚠️ Courses data not loaded</span>';
      }

      let filteredCourses = coursesData;

      if (args.length > 0) {
        const pattern = args[0].toLowerCase();
        if (pattern.endsWith("*")) {
          const prefix = pattern.slice(0, -1);
          filteredCourses = coursesData.filter((course) =>
            course.id.toLowerCase().startsWith(prefix),
          );
        } else {
          filteredCourses = coursesData.filter((course) =>
            course.id.toLowerCase().includes(pattern),
          );
        }
      }

      if (filteredCourses.length === 0) {
        return '<span class="text-warning">No courses found matching your criteria</span>';
      }

      let tableHtml = `
        <table class="table table-bordered table-sm table-dark mt-2">
          <thead>
            <tr>
              <th>Course ID</th>
              <th>Title</th>
              <th>Syllabus</th>
            </tr>
          </thead>
          <tbody>`;

      filteredCourses.forEach((course) => {
        let syllabusCell = "N/A";
        if (course.syllabus && course.syllabus.trim() !== "") {
          syllabusCell = `<a href="${course.syllabus}" class="link-info" target="_blank">syllabus</a>`;
        }

        tableHtml += `
          <tr>
            <td>${course.id}</td>
            <td>${course.title}</td>
            <td>${syllabusCell}</td>
          </tr>`;
      });

      tableHtml += `
          </tbody>
        </table>
        <div class="text-muted mt-1">Found ${filteredCourses.length} course(s)</div>`;

      return tableHtml;
    },
    dragon: (args: string[]) => {
      if (args.includes("-h") || args.includes("--help")) {
        return '<div class="text-info">Show me a dragon</div>';
      }
      return "<pre class=\"text-warning fw-bold\"> ______________\n   ,===:'.,            `-._\n        `:.`---.__         `-._\n          `:.     `--.         `.\n            \\.        `.         `.\n    (,,(,    \\.         `.   ____,-`,\n (,'     `/   \\.   ,--.___`.'\n,  ,' ,--.  `,   \\.;'         `\n `{D, {    \\  :    \\;\n   V,,'    /  /    //\n   j;;    /  ,' ,-///.   ,---.      ,\n   \\;'   /  ,' /  *  \\  /  *  \\   ,'/\n         \\   `'  / \\  `'  / \\  `.' /\n          `.___,'   `.__,'   `.__,'</pre>";
    },
    publications: (args: string[]) => {
      if (args.includes("-h") || args.includes("--help")) {
        return `<div class="text-info">publications command usage:</div>
<div class="ms-3">
  <div><strong>publications</strong> - Display all publications</div>
  <div><strong>publications [start]</strong> - Display publications starting from number [start]</div>
  <div><strong>publications [start] [end]</strong> - Display publications from number [start] to [end]</div>
  <div><strong>publications -h, --help</strong> - Show this help message</div>
</div>
<div class="mt-2 text-warning">Examples:</div>
<div class="ms-3">
  <div>publications</div>
  <div>publications 5</div>
  <div>publications 3 8</div>
</div>
<div class="mt-2 text-muted">Note: Publications are numbered sequentially starting from 1, ordered by most recent first.</div>`;
      }

      if (publicationsData.length === 0) {
        return '<span class="text-warning">⚠️ Publications data not loaded</span>';
      }

      const sortedPublications = [...publicationsData].sort(
        (a, b) => b.id - a.id,
      );

      let startIndex = 0;
      let endIndex = sortedPublications.length - 1;

      if (args.length > 0) {
        const startNum = parseInt(args[0]);
        if (isNaN(startNum) || startNum < 1) {
          return '<span class="text-warning">Error: Start number must be a positive integer</span>';
        }

        if (startNum > sortedPublications.length) {
          return '<span class="text-warning">Error: Start number exceeds available publications</span>';
        }

        startIndex = startNum - 1;

        if (args.length > 1) {
          const endNum = parseInt(args[1]);
          if (isNaN(endNum) || endNum < startNum) {
            return '<span class="text-warning">Error: End number must be greater than or equal to start number</span>';
          }

          endIndex = Math.min(endNum - 1, sortedPublications.length - 1);
        }
      }

      let publicationsHtml = '<div class="text-white">';

      for (let i = startIndex; i <= endIndex; i++) {
        const pub = sortedPublications[i];
        const number = i + 1;
        publicationsHtml += `<div class="mb-2">
${number}. <a href="${pub.link}" class="link-info" target="_blank">${pub.title}</a>, ${pub.cite}
</div>`;
      }

      publicationsHtml += "</div>";
      return publicationsHtml;
    },
    thesis: (args: string[]) => {
      if (args.includes("-h") || args.includes("--help")) {
        return '<div class="text-info">Prints information about my PhD research along with a link to my PhD thesis</div>';
      }
      return `<div class="text-white">
<p>The focus of this work was to investigate recovering interesting views of the structure of software systems using heuristic search techniques. This work has applicability in multiple software engineering areas including: program understanding, software maintenance, and architecture recovery. As one of the founding members of the field of Search-Based Software Engineering (SBSE), this work has been widely cited by researchers interested in investigating software clustering algorithms and techniques.</p>

<p><a href="./pubs/MitchellPhD.pdf" class="link-info" target="_blank">📄 View PhD Thesis (PDF)</a></p>
</div>`;
    },
  };

  function handleKey(e: KeyboardEvent) {
    if (e.key === "Enter") {
      e.preventDefault();
      const command = input.trim();
      output = [...output, `$ ${command}`];
      if (command) {
        history = [...history, command];
        historyIndex = history.length;
        runCommand(command);
      }
      input = "";
    } else if (e.key === "ArrowUp") {
      if (historyIndex > 0) {
        historyIndex--;
        input = history[historyIndex];
        setTimeout(() => {
          inputEl.setSelectionRange(input.length, input.length);
        }, 0);
      }
    } else if (e.key === "ArrowDown") {
      if (historyIndex < history.length - 1) {
        historyIndex++;
        input = history[historyIndex];
        setTimeout(() => {
          inputEl.setSelectionRange(input.length, input.length);
        }, 0);
      } else {
        input = "";
        historyIndex = history.length;
      }
    } else if (e.key === "Tab") {
      e.preventDefault();
      const current = input.trim();
      if (!current.includes(" ")) {
        const matches = Object.keys(commands).filter((c) =>
          c.startsWith(current),
        );
        if (matches.length === 1) {
          input = matches[0] + " ";
        } else if (matches.length > 1) {
          output = [...output, `Suggestions: ${matches.join(", ")}`];
        }
      }
    }
  }

  function runCommand(inputLine: string) {
    const args = inputLine.split(/\s+/);
    const cmd = args[0];
    const cmdArgs = args.slice(1);
    const command = commands[cmd];

    if (typeof command === "function") {
      const result = command(cmdArgs);
      if (result) output = [...output, result];
    } else if (typeof command === "string") {
      output = [...output, command];
    } else {
      output = [...output, `Unknown command: ${cmd}`];
    }
  }

  function resetTerminal() {
    output = [];
    input = "";
    history = [];
    historyIndex = -1;
    inputEl.focus();
  }

  onMount(async () => {
    try {
      const response = await fetch("./courses.json");
      coursesData = await response.json();
    } catch (error) {
      console.error("Failed to load courses data:", error);
    }

    try {
      const contactResponse = await fetch("./contact.json");
      contactData = await contactResponse.json();
    } catch (error) {
      console.error("Failed to load contact data:", error);
    }

    try {
      const publicationsResponse = await fetch("./publications.json");
      publicationsData = await publicationsResponse.json();
    } catch (error) {
      console.error("Failed to load publications data:", error);
    }

    // Don't auto-focus on mount to prevent scrolling
    // inputEl.focus();
  });

  afterUpdate(() => {
    if (terminalEl) {
      terminalEl.scrollTop = terminalEl.scrollHeight;
    }
  });

  function handleFocusKey(e: KeyboardEvent) {
    if (e.key === "Enter") {
      e.preventDefault();
      inputEl.focus();
    }
  }
</script>

<div class="container-fluid bg-dark py-5" id="terminal">
  <section class="jumbotron">
    <h2 class="jumbotron-heading display-6 text-center text-success">
      Terminal
    </h2>
    <div class="container">
      <div class="row lead text-align-left">
        <div class="col">
          <p class="terminal-font text-white">
            Try interacting with my website using a terminal interface. At any
            time you can type <span class="text-success fw-bold">help</span> to
            get a list of commands. Note all commands have -h and --help options
            to get help on those commands and their options. To start, type the
            <span class="text-success fw-bold">dragon</span> command for fun. Note
            that you have to click in the terminal area to activate it.
          </p>

          <div class="mb-3">
            <button class="btn btn-success" on:click={resetTerminal}>
              Reset Terminal
            </button>
          </div>

          <div
            class="terminal bg-dark text-success rounded border border-light"
            role="button"
            tabindex="0"
            bind:this={terminalEl}
            on:click={() => inputEl.focus()}
            on:keydown={handleFocusKey}
          >
            {#each output as line, i (i)}
              <!-- eslint-disable-next-line svelte/no-at-html-tags -->
              <div class="mb-1">{@html line}</div>
            {/each}
            <div class="input-line d-flex">
              <span class="me-2 text-success">$</span>
              <input
                class="form-control bg-dark text-success border-0"
                bind:this={inputEl}
                bind:value={input}
                on:keydown={handleKey}
              />
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>

<style>
  .terminal {
    font-family: monospace;
    height: 400px;
    max-height: 400px;
    overflow-y: auto;
    padding: 1rem;
  }
  .input-line {
    display: flex;
    margin-top: 0.2rem;
  }
  input.form-control {
    flex: 1;
    background: transparent;
    color: inherit;
    border: none;
    font-family: inherit;
    outline: none;
    padding: 0;
  }
  .text-success {
    color: #20c997 !important;
  }
  .terminal-font {
    font-family: monospace;
  }
</style>
