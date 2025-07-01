import { reactRouter } from "@react-router/dev/vite";
import tailwindcss from "@tailwindcss/vite";
import { defineConfig } from "vite";
import tsconfigPaths from "vite-tsconfig-paths";

export default defineConfig({
  server: {
    // only for development
    hmr: {
      port: 3001, // 開発環境のrailsのプロキシを迂回するようにreact-router dev serverのデフォルトポート(5173)から明示的にずらす
    },
  },
  plugins: [tailwindcss(), reactRouter(), tsconfigPaths()],
});
