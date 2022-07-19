import { defineNuxtConfig } from 'nuxt'
import Components from 'unplugin-vue-components/vite';
import { NaiveUiResolver } from 'unplugin-vue-components/resolvers';
// https://v3.nuxtjs.org/docs/directory-structure/nuxt.config
export default defineNuxtConfig({
    buildModules: [
        'nuxt-windicss',
    ],
    build: {
        transpile: ['vueuc'],   // fix dev error: Cannot find module 'vueuc'
    },
    vite: {
        plugins: [
            Components({
                resolvers: [NaiveUiResolver()], // Automatically register all components in the `components` directory
            }),
        ],
        // @ts-expect-error: Missing ssr key
        ssr: {
            noExternal: ['moment', 'naive-ui', '@juggle/resize-observer', '@css-render/vue3-ssr'],
        },
    },
    app: {
        head: {
          link: [
            { rel: 'stylesheet', href: 'https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css', integrity: 'sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor', crossorigin: 'anonymous' }
          ],
          script: [
            { src: 'https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js', integrity: 'sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2', crossorigin: 'anonymous' }
          ]
        }
      }
})
