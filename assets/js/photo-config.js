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
      { src: 'clsr2u-1.png', caption: 'Oh my, I look so silly here... but I guess everyone has their quiet moments.' },
      { src: 'clsr2u-2.PNG', caption: 'I always feel a bit self-conscious when I look at this angle... but maybe that\'s just me being silly.' },
      { src: 'clsr2u-3.PNG', caption: 'I was just daydreaming... probably about something silly and embarrassing.' },
      { src: 'clsr2u-4.PNG', caption: 'I rarely let people see me like this... I feel so vulnerable without my guard up.' },
      { src: 'clsr2u-31.PNG', caption: 'I was just trying to look brave... but I probably just look silly.' },
      { src: 'clsr2u-32.PNG', caption: 'I was trying to be brave and show my true self... but I feel so exposed.' }
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
