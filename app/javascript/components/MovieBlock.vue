<template>
  <div class="d-flex flex-column">
    <div class="text-left">
      <div>
        <router-link :to="{ name: 'MovieInfo', params: { id: movie.id } }">
          <v-img
            lazy-src="https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/wonder-woman-1984-poster-1606931235.jpg?resize=768:*"
            height="315"
            width="210"
            src="https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/wonder-woman-1984-poster-1606931235.jpg?resize=768:*"
          />
        </router-link>
      </div>
      <p class="movie-title">
        {{ movie.name }}
      </p>
      <p class="release-date">
        {{ movie.releaseDate }}
      </p>
    </div>
  </div>
</template>

<script>
export default {
  name: "MovieBlock",
  props: ["movie"],
};
</script>

<style scoped>
.movie-title {
  color: rgb(99, 93, 93);
  margin-top: 8px;
  margin-bottom: 0px;
}
.release-date {
  color: rgb(99, 93, 93);
  margin-top: 0px;
}
</style>
