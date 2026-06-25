var ghpages = require('gh-pages');

ghpages.publish(
    'dist', // path to public directory
    {
        branch: 'gh-pages',
        repo: 'https://github.com/ArchitectingSoftware/ArchitectingSoftware.github.io.git', // Update to point to your repository  
        user: {
            name: 'Brian Mitchell', // update to use your name
            email: 'bsm23@drexel.edu' // Update to use your email
        }
    },
    () => {
        console.log('Deploy Complete!')
    }
)