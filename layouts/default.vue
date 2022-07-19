<template>
    <div>
        <nav-bar></nav-bar>
        <slot />
        <page-footer></page-footer>
    </div>

</template>

<script setup lang="ts">
function print() {
    console.log('this is good world')
}
</script>