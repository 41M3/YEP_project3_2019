const news = document.getElementById('news');

// News API Data

const apiKey = '604614deb88f4ea981963e4139f50084';
const Url = 'http://newsapi.org/v2/top-headlines?country=fr&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=';

// Request News Function

async function getNews(url) {
  let response = await fetch(url + apiKey);
  let jsonResponse = await response.json();
  let articlesArray = jsonResponse.articles;

  articlesArray.forEach((elemnt) => {
    if (elemnt.author != null && elemnt.title != null && elemnt.description != null && elemnt.url != null && elemnt.urlToImage != null) {    
      let articleRow =
        '<div class="articlerow">' +
        ' <a href="' + elemnt.url + '" target="_blank" class="readmore"><img class="storyimage" src="' + elemnt.urlToImage + '" /></a>' +
        ' <div class="article">' +
        '   <h2 class="article_title">' + elemnt.title + '</h2>' +
        '   <p> ' + elemnt.description + '</p>' +
        '   <h3>Rédigé par ' + elemnt.author +'</h3>' +
        ' </div>' +
        '</div>';
  
      news.innerHTML += articleRow;
    }
  });
  return articlesArray;
}

async function searchButton() {
  const trump = document.getElementById("trump").value;
  
  if (trump.length == 0 || trump == "reset") {
    document.location.reload(true);
    //getNews();  le call marche, la condition est bonne mais pas d'affichage
  }
  const searchURL = "https://newsapi.org/v2/everything?q=" + trump + "&apiKey=" + apiKey;
  
  let response = await fetch(searchURL);
  let jsonResponse = await response.json();
  let articlesArray = jsonResponse.articles;

  //reset l'affichage des news
  news.innerHTML = 0;
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

function reset() {
  document.location.reload(true);
}

getNews(Url)