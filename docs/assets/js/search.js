function displayResults(results, store) {
    const searchResults = document.getElementById("results");
    if (results.length) {
        let resultList = "<h3 class='search-count'>" + results.length + " results found</h3>";
        for (const n in results) {
            const item = store[results[n].ref];
            console.log(Object.keys(item))
            console.log(item.id)
            resultList +=
                '<li><a href="./' + item.id + '">' + item.title + "</a>";
        }
        searchResults.innerHTML = resultList;
    } else {
        searchResults.innerHTML = "No results found.";
    }
}

const params = new URLSearchParams(window.location.search);
const query = params.get("query");

if (query) {
    fetch('index.json')
        .then(response => response.json().then(
            obj => {
                document.getElementById("search-input").setAttribute("value", query);
                const idx = lunr(function () {
                    this.ref("id");
                    this.field("title", {
                        boost: 15,
                    });
                    this.field("body", {
                        boost: 10,
                    });
                    for (key in obj) {
                        this.add({
                            id: key,
                            title: obj[key].title,
                            body: obj[key].body,
                        });
                    }
                });
                const results = idx.search(query);
                displayResults(results, obj);
            }
        )
        )
}
