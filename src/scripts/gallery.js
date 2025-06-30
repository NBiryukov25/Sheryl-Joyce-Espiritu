// Gallery component for handling image loading and lightbox
const Gallery = {
    // Initialize gallery with configuration
    init(config) {
        this.config = config;
        this.galleryElement = document.getElementById(config.galleryId);
        this.lightboxElement = document.getElementById('lightbox');
        this.lightboxContent = document.getElementById('lightbox-content');
        this.closeButton = document.getElementById('close-lightbox');
        
        this.initializeGallery();
        this.initializeLightbox();
    },

    // Initialize gallery with images
    initializeGallery() {
        if (!this.galleryElement) return;

        // Clear existing gallery
        this.galleryElement.innerHTML = '';

        // Create gallery items
        this.config.images.forEach((image, index) => {
            const imgElement = document.createElement('img');
            imgElement.src = `${this.config.directory}${image.src}`;
            imgElement.alt = image.caption || '';
            imgElement.className = 'gallery-item';
            imgElement.onclick = () => this.openLightbox(index);
            
            // Add caption if available
            if (image.caption) {
                const caption = document.createElement('div');
                caption.className = 'gallery-caption';
                caption.textContent = image.caption;
                imgElement.appendChild(caption);
            }

            this.galleryElement.appendChild(imgElement);
        });

        // Add loading animation
        this.galleryElement.classList.add('gallery-loading');
        setTimeout(() => {
            this.galleryElement.classList.remove('gallery-loading');
        }, 500);
    },

    // Initialize lightbox functionality
    initializeLightbox() {
        if (!this.lightboxElement || !this.closeButton) return;

        // Close lightbox when clicking the close button or outside
        this.closeButton.onclick = () => this.closeLightbox();
        this.lightboxElement.onclick = (e) => {
            if (e.target === this.lightboxElement) {
                this.closeLightbox();
            }
        };

        // Handle keyboard navigation
        document.addEventListener('keydown', (e) => {
            if (e.key === 'Escape') {
                this.closeLightbox();
            }
        });
    },

    // Open lightbox with specified image
    openLightbox(index) {
        if (!this.config.images[index]) return;

        const image = this.config.images[index];
        const imgElement = document.createElement('img');
        imgElement.src = `${this.config.directory}${image.src}`;
        imgElement.alt = image.caption || '';
        
        // Create caption if available
        const caption = document.createElement('div');
        caption.className = 'lightbox-caption';
        caption.textContent = image.caption || '';

        // Clear existing content
        this.lightboxContent.innerHTML = '';
        
        // Add new content
        this.lightboxContent.appendChild(imgElement);
        if (image.caption) {
            this.lightboxContent.appendChild(caption);
        }

        // Show lightbox
        this.lightboxElement.style.display = 'flex';
        document.body.style.overflow = 'hidden';
    },

    // Close lightbox
    closeLightbox() {
        this.lightboxElement.style.display = 'none';
        document.body.style.overflow = '';
    }
};
