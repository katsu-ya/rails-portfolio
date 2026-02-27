#!/usr/bin/env node

const esbuild = require("esbuild");
const path = require("path");

async function build() {
  const ctx = await esbuild.context({
    entryPoints: ["application.js"],
    bundle: true,
    outdir: path.join(process.cwd(), "app/assets/builds"),
    absWorkingDir: path.join(process.cwd(), "app/javascript"),
    loader: {
      ".js": "jsx",
      ".jsx": "jsx"
    },
    sourcemap: true,
    target: "es2017",
    format: "esm",
    logLevel: "info",
  });

  if (process.argv.includes("--watch")) {
    console.log("Watching for changes...");
    await ctx.watch();
  } else {
    await ctx.rebuild();
    await ctx.dispose();
  }
}

build().catch(() => process.exit(1));