<template>
  <div>
    <div class="row text-center">
      <h1 class="display-6 font-italic font-weight-bolder">Blog Editor:</h1>
    </div>

    <div v-if="showInWeb" class="mt-3">
      <div class="row g-3">
        <div class="col-md-12">
          <label for="blogTitle" class="form-label">Blog Title</label>
          <input
            type="text"
            class="form-control"
            id="blogTitle"
            v-model="blog.title"
            placeholder="Please type Blog Title"
          />
        </div>
        <div class="col-md-12">
          <label for="blogContent" class="form-label">Blog Content</label>
          <textarea
            class="form-control"
            id="blogContent"
            v-model="blog.content"
            rows="5"
          ></textarea>
        </div>
        <div class="col-12">
          <button @click="submitBlog" class="btn btn-primary">Save Blog</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
function print() {
  console.log("this is good world");
}
const blog = shallowReactive({
  title: "",
  content: "",
  timestamp: 0,
});
const showInWeb = shallowRef(false);
console.log(showInWeb.value);

function submitBlog() {
  console.log("blog" + blog.title + blog.content);
  if (blog.title === null) {
    return;
  }
  blog.timestamp = Date.now();
  //console.log(JSON.stringify(blog));
  postData(JSON.stringify(blog));
}

async function postData(data) {
  console.log("fetch");
  await $fetch(
    "https://molten-smithy-209720-default-rtdb.firebaseio.com/blogs.json",
    {
      method: "POST",
      body: data,
    }
  );
}

onMounted(() => {
  showInWeb.value = true;
});
</script>
