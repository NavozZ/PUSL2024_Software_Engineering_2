// JavaScript for handling the Edit Details button click
document.getElementById('editDetails').addEventListener('click', function() {
    // Toggle the visibility of the Edit Profile Section
    document.querySelector('.profile-section').classList.toggle('hidden');
    // Optionally, scroll to the section after displaying
    if (!document.querySelector('.profile-section').classList.contains('hidden')) {
        document.querySelector('.profile-section').scrollIntoView({ behavior: 'smooth' });
    }
});
