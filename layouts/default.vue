<template>
  <div>
    <div class="container">
      <nav-bar></nav-bar>
      <slot />
    </div>
    <page-footer></page-footer>
  </div>
</template>

<script setup lang="ts">
function print() {
  console.log("this is good world");
}
</script>
