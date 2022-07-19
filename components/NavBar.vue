<template>
    <nav class="navbar">
        <!-- Navbar content -->
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                Bootstrap
            </a>
            <ul class="nav">
                <li class="nav-item" v-for="(item, index) in menus" :key="index">
                    <a class="btn" :class="{ 'btn-primary': (isMenuItemActive(item)) }" role="button"
                        @click="changePage(item.path)">{{ item.name }}</a>
                </li>
            </ul>
            <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>

        </div>
    </nav>
</template>

<script setup lang="ts">
const route = useRoute();
const menus = [
    {
        name: 'home',
        path: '/',
    },
    {
        name: 'exame',
        path: '/exame/1',
        match: [{
            name: 'exame-page',
        }]
    }
]

// this function is used to judge the page is sub-page
const isMenuItemActive = (item) => {
    if (item.match) {
        let i = item.match.findIndex(o => {
            return o.name == route.name
        }
        )
        return i != -1
    }
    return route.path == item.path
}

function changePage(path: string) {
    console.log('this is good world')
    navigateTo(path);
}
</script>