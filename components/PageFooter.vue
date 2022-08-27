<template>
  <footer class="blog-footer mt-2">
    <p>
      Blog template built for
      <a href="https://getbootstrap.com/">Bootstrap</a> by
      <a href="https://twitter.com/mdo">@mdo</a>.
    </p>
    <p>
      <a href="#">Back to top</a>
    </p>
  </footer>
</template>

<script setup lang="ts">
const menus = [
  {
    name: "home",
    path: "/",
  },
];

function print() {
  console.log("this is good world");
}
</script>

<style>
/*
 * Footer
 */
.blog-footer {
  padding: 2.5rem 0;
  color: #999;
  text-align: center;
  background-color: #f9f9f9;
  border-top: 0.05rem solid #e5e5e5;
}
</style>
