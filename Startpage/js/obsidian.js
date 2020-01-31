var links = document.getElementsByClassName('tile tile-link');
const icon = document.getElementById('searchIcon');
const div = document.getElementById('searchDiv');
const submit = document.getElementById('submit-btn');
const searchContainer = document.getElementById('searchContainer');
const searchBar = document.getElementById('searchBar');
const isOk = response => response.ok ? response.json() : Promise.reject(new Error('Failed to load data from server'))
const reddit_key = 'RI';
const rust_key = 'RS';
const github_key = 'GH';
const gitlab_key = 'GL';

const gh_sort = "stars"; // starts, forks, help-wanted-issues, updated
const gh_order = "desc";

function tagFilter() {
    var tag = (window.location.hash.length > 0) ? window.location.hash.replace('#',''): "";
    var links = document.getElementsByClassName('tile tile-link'); 
        for (item of links) {
            if (tag.length === 0 || !tag.trim()) {
                item.style.display = '';
                searchContainer.innerHTML = '';
            }
            else if (item.hasAttribute("data-groups")) {
                let hidden = (item.getAttribute('data-groups').includes(tag)) ? true : false
                if (hidden == false) {
                    item.style.display = 'none';
                    searchContainer.innerHTML = '';
                } else {
                    item.style.display = '';
                }
            } else {
                item.style.display = 'none';
            }
        }

    let navItems = document.querySelectorAll("body > div.nav-panel > nav > ul > li");
    for (item of navItems) {
        if (item.lastChild.href.split('/').pop() == window.location.hash) {
            item.lastChild.lastChild.classList.contains('is-active');
            item.lastChild.lastChild.classList.add('is-active');
            item.classList.add('is-active');
        } else {
            item.lastChild.lastChild.classList.contains('is-active');
            item.lastChild.lastChild.classList.remove('is-active');
            item.classList.remove('is-active');
            if (item.lastChild.href.split('/').pop() === '#' && window.location.hash.length === 0) {
                item.lastChild.lastChild.classList.contains('is-active');
                item.lastChild.lastChild.classList.add('is-active');
                item.classList.add('is-active');
            }
        }
    }
}

function beAwesome() {
    // Get value of input
    let filterValue = searchBar.value.toUpperCase();
    var links = document.getElementsByClassName('tile tile-link'); 
    if (filterValue.slice(0,reddit_key.length + 1) == reddit_key + " ") {
        changeSearch('Reddit');
        for (item of links) {
            item.style.display = 'none';
        }
        rustMode(false);
    } else if (filterValue.slice(0,rust_key.length + 1) == rust_key + " ") {
        changeSearch('Rust');
        for (item of links) {
            item.style.display = 'none';
        } 
        rustMode(true);
    } else if (filterValue.slice(0,github_key.length + 1) == github_key + " ") {
        changeSearch('GitHub');
        for (item of links) {
            item.style.display = 'none';
        } 
        rustMode(false);
    } else if (filterValue.slice(0,gitlab_key.length + 1) == gitlab_key + " ") {
        changeSearch('GitLab');
        for (item of links) {
            item.style.display = 'none';
        } 
        rustMode(false);
    } else {
        changeSearch('Search')
        for (item of links) {
            item.style.display = '';
        }
        rustMode(false);
    }
}

function changeSearch(provider) {

    // Remove icons
    if (icon.classList.contains('fa', 'fa-search')) {
        icon.classList.remove('fa', 'fa-search');
    }
    if (icon.classList.contains('fa', 'fa-github')) {
        icon.classList.remove('fa', 'fa-github');
    }
    if (icon.classList.contains('fa', 'fa-gitlab')) {
        icon.classList.remove('fa', 'fa-gitlab');
    }
    if (icon.classList.contains('icon-reddit')) {
        icon.classList.remove('icon-reddit');
    }
    if (icon.classList.contains('icon-rust')) {
        icon.classList.remove('icon-rust');
    }

    // Add Icons
    if (provider === "Search") {
        icon.classList.remove('fa', 'fa-github');
        icon.classList.remove('fa', 'fa-gitlab');
        icon.classList.add('fa', 'fa-search');
    } else if(provider === "GitHub" || provider === "GitLab") {
        icon.classList.add('fa', 'fa-' + provider.toLowerCase());
    } else {
        icon.classList.add('icon-' + provider.toLowerCase());
    }  

    // Remove input class
    if (div.classList.contains('inputSearch')) {
        div.classList.remove('inputSearch');
    }
    if (div.classList.contains('inputGitHub')) {
        div.classList.remove('inputGitHub');
    }
    if (div.classList.contains('inputGitLab')) {
        div.classList.remove('inputGitLab');
    }
    if (div.classList.contains('inputReddit')) {
        div.classList.remove('inputReddit');
    }
    if (div.classList.contains('inputRust')) {
        div.classList.remove('inputRust');
    }

    // Add input class
    div.classList.add('input' + provider);

}

function navOff() {
    let navItems = document.querySelectorAll("body > div.nav-panel > nav > ul > li");
    for (item of navItems) {
        item.lastChild.lastChild.classList.contains('is-active');
        item.lastChild.lastChild.classList.remove('is-active');
        item.classList.remove('is-active');
    }
}
function searchReddit(searchTerm, searchLimit, sortBy) {
    navOff();
    // Get Reddit Data Promise
    redditData(searchTerm, searchLimit, sortBy).then(results => {
        let output = '<section class="cards">';
        results.forEach(post => {
            let reddit_image = post.preview ? `<img src="${post.preview.images[0].source.url}" alt="${post.title}">` : `<img src="logos/reddit.svg" alt="${post.title}" style="background-color: #ff4500;">`;
            let score = (post.ups > post.downs) ? `<span class="score"><i class="fa fa-thumbs-up" aria-hidden="true"></i> ${post.score}</span>` : `<span class="score"><i class="fa fa-thumbs-down" aria-hidden="true"></i> ${post.score}</span>`
                output += `
                <article class="card">                
                    <a href="${post.url}">
                        <picture class="thumbnail">
                            ${reddit_image}
                        </picture>
                    </a>
                    <div class="card-header">
                        <a class="subreddit" href="https://reddit.com/r/${post.subreddit}">${post.subreddit}</a>
                        <span class="postedBy">• Posted by</span>
                        <a class="author" href="https://reddit.com/u/${post.author}"> ${post.author}</a>
                        ${score}
                    </div>
                    <div class="card-content">
                        <p class="card-title">${post.title}</p>
                        <h5 class="card-text">${truncateText(post.selftext, 100)}</h5>
                    </div>
                </article>
                `;
        });
        output += '</section>';
        searchContainer.innerHTML = output;
    });

    // Stay in Reddit mode
    searchBar.value = `${reddit_key} `.toLowerCase();
}

async function redditData(searchTerm, searchLimit, sortBy) {
    // Search Reddit and get data
    if (searchTerm.includes(":")) {
        var searchSplit = searchTerm.split(":"); 
        try {
            const res = await fetch(`http://www.reddit.com/r/${searchSplit[0]}/search.json?q=${searchSplit[1]}&sort=${sortBy}&limit=${searchLimit}`);
            const data = await res.json();
            return data.data.children.map(data_1 => data_1.data);
        }
        catch (err) {
            return console.log(err);
        }
    } else {
        try {
            const res_1 = await fetch(`http://www.reddit.com/search.json?q=${searchTerm}&sort=${sortBy}&limit=${searchLimit}`);
            const data_2 = await res_1.json();
            return data_2.data.children.map(data_3 => data_3.data);
        }
        catch (err_1) {
            return console.log(err_1);
        }
    }
}

function searchCrates(searchTerm) {
    cratesData(searchTerm)
    .then(results => {
        console.log(results)
    });

    // Stay in Rust Mode
    searchBar.value = `${rust_key} `.toLowerCase();
}

function cratesData(searchTerm) {
    return fetch(`http://crates.io/api/v1/crates?q=${searchTerm}`, {
        credentials: 'include'
    })
    .then(res => res.json())
    .then(data => data.map(crates))
    .catch(err => console.log(err));
}

function searchGithub(query){
    var language = "language:assembly";
    let url = `https://api.github.com/search/repositories?q=${query}${language}&sort=${gh_sort}&order=${gh_order}`;
    // Search Github and get data
    githubData(url).then(results => {
        let output = '<section class="cards">';
        results.forEach(post => {
            let reddit_image = post.owner.avatar_url ? `<img src="${post.preview.images[0].source.url}" alt="${post.title}">` : `<img src="logos/reddit.svg" alt="${post.title}" style="background-color: #ff4500;">`;
                output += `
                <article class="card">                
                    <a href="${post.html_url}">
                        <picture class="thumbnail">
                            ${reddit_image}
                        </picture>
                    </a>
                    <div class="card-header">
                        <a class="author" href="https://github.com/${post.owner.login}"> ${post.owner.login}</a>
                        <span class="score"><i class="fa fa-star" aria-hidden="true"></i> ${post.stargazers_count}</span>
                    </div>
                    <div class="card-content">
                        <p class="card-title">${post.name}</p>
                        <h5 class="card-text">${truncateText(post.description, 100)}</h5>
                    </div>
                </article>
                `;
        });
        output += '</section>';
        searchContainer.innerHTML = output;
    });

    // Stay in Reddit mode
    searchBar.value = `${reddit_key} `.toLowerCase();
            
}

function githubData(url) {
    return fetch(url)
    .then(res => res.json())
    .then(data => data.map(items))
    .catch(err => console.log(err));
}

function truncateText(text, limit) {
    const shortend = text.indexOf(' ', limit);
    if(shortend == -1) return text;
    return text.substring(0, shortend);
}

function rustMode(bool) {
    var rustyTiles = document.getElementsByClassName('rust');
    for (item of rustyTiles) {
        if (bool === true) {
            item.style.display = '';
        } else {
            item.style.display = 'none';
        }  
    }
}

window.addEventListener("hashchange",tagFilter);
submit.addEventListener('click', e => {
    let filterValue = searchBar.value;
    if (filterValue.slice(0,(reddit_key.length + 1)).toUpperCase() == reddit_key.toUpperCase() + " ") {
        if (filterValue.length > (reddit_key.length + 1)) {
            let searchTerm = filterValue.slice(reddit_key.length + 1);
            let searchLimit = 20;
            let sortBy = 'relevance';
            searchReddit(searchTerm, searchLimit, sortBy);
        }
    } else if (filterValue.slice(0,(rust_key.length + 1)).toUpperCase()  == rust_key.toUpperCase() + " ") {
        if (filterValue.length > (rust_key.length + 1)) {
            //let searchTerm = filterValue.slice(rust_key.length + 1);
            //searchCrates(searchTerm);
            console.log("Entering RustMode")
        }
    } else if (filterValue.slice(0,(github_key.length + 1)).toUpperCase() == github_key.toUpperCase() + " ") {
        if (filterValue.length > (github_key.length + 1)) {
            console.log("Entering GitHub")
        }
    } else if (filterValue.slice(0,(gitlab_key.length + 1)).toUpperCase() == gitlab_key.toUpperCase() + " ") {
        if (filterValue.length > (gitlab_key.length + 1)) {
            console.log("Entering GitLab")
        }
    } else {
        changeSearch('Search')
        for (item of links) {
            item.style.display = '';
            window.location.assign("https://duckduckgo.com/?q=" + filterValue);
        }
    }
    e.preventDefault();
})
