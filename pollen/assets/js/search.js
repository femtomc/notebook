function displayResults(results, store) {
    const searchResults = document.getElementById("results");
    if (results.length) {
        let resultList = "<h3 class='search-count'>" + results.length + " results found</h3>";
        for (const n in results) {
            const item = store[results[n].ref];
            resultList +=
                '<li><a href="' + item.url + '">' + item.title + "</a>";
            resultList += "<span class='search-extract'>" + item.content.substring(0, 100) + "...</span></li>";
        }
        searchResults.innerHTML = resultList;
    } else {
        searchResults.innerHTML = "No results found.";
    }
}

const params = new URLSearchParams(window.location.search);
const query = params.get("query");

if (query) {
    document.getElementById("search-input").setAttribute("value", query);
    console.log(window.store);
    const idx = lunr(function () {
        this.ref("id");
        this.field("title", {
            boost: 15,
        });
        this.field("tags");
        this.field("content", {
            boost: 10,
        });

        for (const key in window.store) {
            this.add({
                id: key,
                title: window.store[key].title,
                tags: window.store[key].category,
                content: window.store[key].content,
            });
        }
    });
    const results = idx.search(query);
    displayResults(results, window.store);
}
