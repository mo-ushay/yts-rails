<template>
  <div id="yts">
    <Navigation />
    <router-view />
  </div>
</template>

<script>
import Navigation from "components/Navigation";
export default {
  name: "App",
  components: {
    Navigation,
  },
};
</script>

<style>
#yts {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
