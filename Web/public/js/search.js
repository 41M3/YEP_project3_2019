
const news = document.getElementById('news');
const apiKey = '604614deb88f4ea981963e4139f50084';

async function searchButton() {
    const trump = document.getElementById("trump").value;
    const searchURL = "https://newsapi.org/v2/everything?q=" + trump + "&apiKey=" + apiKey;
    
    let response = await fetch(searchURL);
    let jsonResponse = await response.json();
    let articlesArray = jsonResponse.articles;

    window.alert("appelé avec : " + trump);

    articlesArray.forEach((elemnt) => {
        if (elemnt.author != null && elemnt.title != null && elemnt.description != null && elemnt.url != null && elemnt.urlToImage != null) {    
          let articleRow =
            '<div class="articlerow">' +
            ' <div class="article">' +
            '   <h2 class="title">' + elemnt.title + '</h2>' +
            '   <h3>By ' + elemnt.author +'</h3>' +
            '   <p> ' + elemnt.description + '</p>' +
            '   <a href="' + elemnt.url + '" target="_blank" class="readmore">Read More</a>' +
            ' </div>' +
            ' <div class="share">' +
            '   <img class="storyimage" src="' + elemnt.urlToImage + '" />' +
            ' </div>' +
            '</div>';
      
          news.innerHTML += articleRow;
        }
      });
      
    return articlesArray;
}


searchButton();