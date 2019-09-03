const dynamicMap = (initMapbox) => {
  const routes = document.querySelectorAll('.results-itineraries-container');
  routes.forEach((route) => {
    route.addEventListener('click', (event) => {
      const markers = event.currentTarget.dataset.markers
      const lines = event.currentTarget.dataset.lines
      const color = event.currentTarget.dataset.color
      initMapbox(markers, lines, color);
    });
  });
}

export { dynamicMap };
