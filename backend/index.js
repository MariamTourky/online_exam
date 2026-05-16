import { genkit } from "genkit";
import { googleAI } from "@genkit-ai/google-genai";

const ai = genkit({
  plugins: [googleAI()],
  model: "googleai/gemini-1.5-flash",
});

export const helloFlow = ai.defineFlow("helloFlow", async (name) => {
  const { text } = await ai.generate(`Hello ${name}!`);
  return text;
});

// Keep process alive for Genkit CLI to connect
setInterval(() => {}, 1000);
console.log("Genkit runtime started and waiting for flows...");
