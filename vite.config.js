import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

// https://vitejs.dev/config/
export default defineConfig({
    //base: '/vue-resume-template/',
    server: {
        host: "0.0.0.0",
        port: 3004,
        hmr: {
            host: "template.resume.loc",
            clientPort: 80,
        },
        allowedHosts: ['nginx', 'template.resume.loc']
    },
    plugins: [vue()],
    css: {
        preprocessorOptions: {
            scss: {
                silenceDeprecations: ["mixed-decls", "color-functions", "global-builtin", "import"],
            },
        },
    }
})