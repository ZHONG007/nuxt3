<template>
  <div>exame {{ $route.params.page }} + {{ route.params }}</div>
</template>

<script setup lang="ts">
const route = useRoute();
</script>
