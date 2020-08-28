import places from 'places.js';

// Address input autocomplete function - Algolia places

const initAutocomplete = () => {
  const addressInput = document.querySelector('.mapboxgl-ctrl-geocoder--input');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
