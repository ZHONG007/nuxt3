<template>
  <div >
    <header class="py-2">
      <div class="row flex-nowrap justify-content-between align-items-center">
        <div class="col-4 pt-1">
          <a class="link-secondary" href="#">Subscribe</a>
        </div>
        <div class="col-4 text-center">
          <a class="blog-header-logo text-dark" href="#">Blog World</a>
        </div>
        <div class="col-4 d-flex justify-content-end align-items-center">
          <a class="link-secondary" href="#" aria-label="Search">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="20"
              height="20"
              fill="none"
              stroke="currentColor"
              stroke-linecap="round"
              stroke-linejoin="round"
              stroke-width="2"
              class="mx-3"
              role="img"
              viewBox="0 0 24 24"
            >
              <title>Search</title>
              <circle cx="10.5" cy="10.5" r="7.5" />
              <path d="M21 21l-5.2-5.2" />
            </svg>
          </a>
          <a class="btn btn-sm btn-outline-secondary" href="#">Sign up</a>
        </div>
      </div>
    </header>
    <div class="nav-scroller py-1 mb-2">
      <nav class="nav d-flex justify-content-between">
        <template class="nav-item" v-for="(item, index) in menus" :key="index">
          <a
            :class="[
              isMenuItemActive(item)
                ? ['p-1', 'btn-outline-secondary','btn', 'active']
                : ['p-1', 'btn'],
            ]"
            role="button"
            @click="changePage(item.path)"
            >{{ item.name }}</a
          >
        </template>
      </nav>
    </div>
  </div>
</template>

<script setup lang="ts">
const route = useRoute();
const menus = [
  {
    name: "World",
    path: "/",
  },
  {
    name: 'Editor',
    path: "/editor"
  },
  {
    name: "US",
    path: "/exame/1",
    match: [
      {
        name: "exame-page",
      },
    ],
  },
  {
    name: "Opinion",
    path: "/exame/2",
  },
  {
    name: "Politics",
    path: "/exame/5",
  },
  {
    name: "Design",
    path: "/exame/6",
  },
  {
    name: "Culture",
    path: "/exame/7",
  },
];

// this function is used to judge the page is sub-page
const isMenuItemActive = (item) => {
  if (item.match) {
    let i = item.match.findIndex((o) => {
      return o.name == route.name;
    });
    return i != -1;
  }
  return route.path == item.path;
};

async function addCompany(data) {
  console.log("fetch");
  await $fetch(
    "https://molten-smithy-209720-default-rtdb.firebaseio.com/blogs.json",
    {
      method: "POST",
      body: data,
    }
  );
}

// addCompany({
//   title: "first blog",
//   content: "this is first blog",
// });

function changePage(path: string) {
  console.log("this is good world");
  navigateTo(path);
}
let dataDisplay = shallowRef(null);
async function getInfo() {
  const { data: count } = await useFetch(
    "https://molten-smithy-209720-default-rtdb.firebaseio.com/blogs.json",
    { key: "indexdata", server: true }
  );

  console.log(count.value);

  // console.log(count.value["-NAQu0extzHR-LqtpB-L"].content);
  // const array = Object.keys(count.value).map(function (key) {
  //   return count.value[key];
  // });

  console.log(count);
  const obj2 = toRaw(count.value);
  console.log(obj2);
  dataDisplay.value = count.value;
  // console.log(unref(count))
  console.log(count);
}
</script>

<style>
.blog-header {
  line-height: 1;
  border-bottom: 1px solid #e5e5e5;
}

.blog-header-logo {
  font-family: "Playfair Display", Georgia, "Times New Roman",
    serif /*rtl:Amiri, Georgia, "Times New Roman", serif*/;
  font-size: 2.25rem;
}

.blog-header-logo:hover {
  text-decoration: none;
}
</style>
