<template>
  <div class="container-fluid">
    <div class="popular-downloads-container">
      <div class="container">
        <div class="row">
          <h2 class="popular-downloads-wrapper">
            Popular Downloads
          </h2>
        </div>
      </div>
      <MovieRow />
    </div>
    <div class="latest-movies-container">
      <div class="container">
        <h2 class="popular-downloads-wrapper mt-40">
          Recent Releases
        </h2>
        <MovieRow />
      </div>
    </div>
  </div>
</template>

<script>
import MovieRow from "components/MovieRow.vue";
export default {
  name: "Home",
  components: {
    MovieRow,
  },
};
</script>

<style scoped>
.container-fluid {
  color: #060706;
  padding: auto;
}
.popular-downloads-container {
  background-color: #000000;
  text-align: center;
}
.popular-downloads-wrapper {
  border-bottom: 1px solid rgba(255, 255, 255, 0.2);
  color: #fff;
  width: 100%;
  margin-bottom: 20px;
  margin-top: 20px;
}
.latest-movies-container {
  background-color: #000000;
}
</style>
