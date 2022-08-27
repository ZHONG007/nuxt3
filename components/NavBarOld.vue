<template>
  <nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">Navbar</a>
      <button
        class="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav gap-1">
          <li class="nav-item" v-for="(item, index) in menus" :key="index">
            <a
              :class="[
                isMenuItemActive(item)
                  ? ['btn-primary', 'btn']
                  : ['btn-light', 'btn', 'btn-outline-secondary'],
              ]"
              role="button"
              @click="changePage(item.path)"
              >{{ item.name }}</a
            >
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Link</a>
          </li>
          <li class="nav-item dropdown">
            <a
              class="nav-link dropdown-toggle"
              href="#"
              id="navbarDropdown"
              role="button"
              data-bs-toggle="dropdown"
              aria-expanded="false"
            >
              Dropdown
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
              <li><a class="dropdown-item" href="#">Action</a></li>
              <li><a class="dropdown-item" href="#">Another action</a></li>
              <li>
                <hr class="dropdown-divider" />
              </li>
              <li><a class="dropdown-item" href="#">Something else here</a></li>
            </ul>
          </li>
          <li class="nav-item">
            <a
              class="nav-link disabled"
              href="#"
              tabindex="-1"
              aria-disabled="true"
              >Disabled</a
            >
          </li>
        </ul>
        <form class="d-flex">
          <input
            class="form-control me-2"
            type="search"
            placeholder="Search"
            aria-label="Search"
          />
          <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
      </div>
    </div>
  </nav>

  <nav class="navbar">
    <!-- Navbar content -->
    <div class="navbar-nav me-auto mb-2 mb-lg-0">
      <a class="navbar-brand" href="/"> Bootstrap </a>
      <div>
        <ul class="nav gap-1">
          <li class="nav-item" v-for="(item, index) in menus" :key="index">
            <a
              class="btn btn-outline-primary"
              :class="{ active: isMenuItemActive(item) }"
              role="button"
              @click="changePage(item.path)"
              >{{ item.name }}</a
            >
          </li>
        </ul>
      </div>

      <form class="d-flex">
        <input
          class="form-control me-2"
          type="search"
          placeholder="Search"
          aria-label="Search"
        />
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </nav>
</template>

<script setup lang="ts">
const route = useRoute();
const menus = [
  {
    name: "home",
    path: "/",
  },
  {
    name: "exame",
    path: "/exame/1",
    match: [
      {
        name: "exame-page",
      },
    ],
  },
  {
    name: "japan",
    path: "/exame/2",
  },
  {
    name: "korea",
    path: "/exame/5",
  },
  {
    name: "visa",
    path: "/exame/6",
  },
  {
    name: "uk",
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

function changePage(path: string) {
  console.log("this is good world");
  navigateTo(path);
}
</script>
