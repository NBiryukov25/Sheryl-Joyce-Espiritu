// Lightbox functionality
const lightbox = document.getElementById('lightbox');
const lightboxImg = document.getElementById('lightbox-img');
const closeButton = document.querySelector('.close-button');
const loadingSpinner = document.querySelector('.loading-spinner');

function openLightbox(img) {
  lightbox.style.display = 'flex';
  loadingSpinner.style.display = 'block';
  
  // Set the image source after showing the loading spinner
  lightboxImg.onload = () => {
    loadingSpinner.style.display = 'none';
  };
  
  lightboxImg.src = img.src;
  lightboxImg.alt = img.alt;
}

function closeLightbox() {
  lightbox.style.display = 'none';
  loadingSpinner.style.display = 'none';
}

// Close lightbox when clicking outside the image
lightbox.addEventListener('click', (e) => {
  if (e.target === lightbox) {
    closeLightbox();
  }
});

// Close lightbox with escape key
document.addEventListener('keydown', (e) => {
  if (e.key === 'Escape' && lightbox.style.display === 'flex') {
    closeLightbox();
  }
});
