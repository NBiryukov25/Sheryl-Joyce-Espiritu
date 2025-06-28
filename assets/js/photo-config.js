// Centralized photo configuration
const photoConfig = {
  // Main carousel photos
  carousel: {
    directory: 'assets/images/',
    pattern: 'p',
    extensions: ['png', 'PNG'],
    range: {
      start: 1,
      end: 47
    },
    captions: {
      'p01.png': 'My gift to you sweetheart. Hope you enjoy. Love, Joyce'
    }
  },

  // Personal page photos
  personal: {
    directory: 'assets/images/personal/',
    images: [
      { src: 'clsr2u-1.png', caption: 'A quiet moment, just for me. This is where I find my strength.' },
      { src: 'clsr2u-2.PNG', caption: 'The world feels softer from this angle.' },
      { src: 'clsr2u-3.PNG', caption: 'Lost in a thought... or maybe just listening to the silence.' },
      { src: 'clsr2u-4.PNG', caption: 'A rare moment of letting my guard down.' },
      { src: 'clsr2u-31.PNG', caption: 'A quiet rebellion against a loud world.' },
      { src: 'clsr2u-32.PNG', caption: 'This is me, unguarded.' }
    ]
  },

  // Shared settings
  settings: {
    modal: {
      animation: 'fade',
      speed: 500,
      overlayOpacity: 0.9
    },
    captions: {
      font: 'Great Vibes',
      color: '#ffcce6',
      size: '1.2rem'
    }
  }
};

// Export the configuration for use in other files
window.photoConfig = photoConfig;
