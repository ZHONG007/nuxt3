<template>
    <div>
        Home
    </div>
</template>

<script setup lang="ts">
console.log('server?')

//console.log(data)
onMounted(async () => {
    const { data, pending, error, refresh } = await useFetch(
        'https://api.nuxtjs.dev/mountains'
    )
    console.log('mounted')
    console.log(data.value)
})
</script>