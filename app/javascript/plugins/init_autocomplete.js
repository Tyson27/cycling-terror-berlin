import places from 'places.js';

// Address input autocomplete function - Algolia places

const initAutocomplete = () => {
  const addressInput = document.getElementById('flat_address');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
