import adapter from "@sveltejs/adapter-static";
import { vitePreprocess } from "@sveltejs/vite-plugin-svelte";

/** @type {import('@sveltejs/kit').Config} */
const config = {
  preprocess: vitePreprocess(),

  kit: {
    adapter: adapter({
      // default options shown; you can customize if needed
      pages: "build",
      assets: "build",
      fallback: "index.html", // set to 'index.html' for SPA fallback
      precompress: false,
    }),
    paths: {
      base: "/~bmitchell", // or '/your-subdirectory' if hosted in a subfolder
    },
  },
};

export default config;
