import eslint from "@eslint/js";
import tseslint from "typescript-eslint";
import sveltePlugin from "eslint-plugin-svelte";
import prettierConfig from "eslint-config-prettier";
import globals from "globals";

export default tseslint.config(
  eslint.configs.recommended,
  tseslint.configs.recommended,
  sveltePlugin.configs["flat/recommended"],
  prettierConfig,
  sveltePlugin.configs["flat/prettier"],
  {
    files: ["**/*.svelte"],
    languageOptions: {
      parserOptions: { parser: tseslint.parser },
    },
  },
  {
    languageOptions: {
      globals: {
        ...globals.browser,
        ...globals.node,
      },
    },
  },
  {
    rules: {
      "svelte/no-navigation-without-base": "off",
      "svelte/no-navigation-without-resolve": "off",
    },
  },
  {
    ignores: ["build/", ".svelte-kit/", "dist/"],
  },
);
