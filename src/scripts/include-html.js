document.addEventListener('DOMContentLoaded', function() {
    // Get all elements with include-html attribute
    const includes = document.querySelectorAll('[include-html]');
    
    includes.forEach(element => {
        const file = element.getAttribute('include-html');
        fetch(file)
            .then(response => response.text())
            .then(data => {
                element.innerHTML = data;
            })
            .catch(error => {
                console.error('Error loading template:', error);
                element.innerHTML = '<p>Error loading navigation template</p>';
            });
    });
});
