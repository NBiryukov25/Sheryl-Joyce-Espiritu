// GSAP CDN
window.gsap = window.gsap || {
    registerPlugin: function() {}
};

// ScrollTrigger CDN
window.ScrollTrigger = window.ScrollTrigger || {
    create: function() {}
};

// Register GSAP plugins
if (typeof gsap !== 'undefined') {
    gsap.registerPlugin(ScrollTrigger);
}
