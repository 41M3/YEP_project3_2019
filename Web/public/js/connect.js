// Firebase App (the core Firebase SDK) is always required and
// must be listed before other Firebase SDKs
var firebase = require("firebase/app");

var bodyParser = require('body-parser')
app.use( bodyParser.json() );       // to support JSON-encoded bodies
app.use(bodyParser.urlencoded({     // to support URL-encoded bodies
  extended: true
})); 

// Add the Firebase products that you want to use
require("firebase/auth");
require("firebase/firestore");

var firebaseConfig = {
    apiKey: "AIzaSyAuCVJBCHJmtISIZ8FbzkrdFfAvY5aXEuI",
    authDomain: "epiflipboard-3d596.firebaseapp.com",
    databaseURL: "https://epiflipboard-3d596.firebaseio.com/",
    projectId: "epiflipboard-3d596",
    storageBucket: "epiflipboard-3d596.appspot.com",
    messagingSenderId: "487209646537",
    appId: "1:487209646537:web:864903f9fd9715efee9018",
    measurementId: "G-ELXDR9YFCH"
  };

  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);

  firebase.auth().signInWithEmailAndPassword(email, password).catch(function(error) {
  // Handle Errors here.
  var errorCode = error.code;
  var errorMessage = error.message;
  // ...
});