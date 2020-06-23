var firebaseConfig = {
  apiKey: "AIzaSyAuCVJBCHJmtISIZ8FbzkrdFfAvY5aXEuI",
  authDomain: "epiflipboard-3d596.firebaseapp.com",
  databaseURL: "https://epiflipboard-3d596.firebaseio.com",
  projectId: "epiflipboard-3d596",
  storageBucket: "epiflipboard-3d596.appspot.com",
  messagingSenderId: "487209646537",
  appId: "1:487209646537:web:864903f9fd9715efee9018",
  measurementId: "G-ELXDR9YFCH"
};

firebase.initializeApp(firebaseConfig);

function LoginButtonPressed() {
  var userEmail = document.getElementById("email").value;
  var userPass = document.getElementById("password").value;

  firebase.auth().signInWithEmailAndPassword(userEmail, userPass).catch(function(error) {
    // Errors
    var errorCode = error.code;
    var errorMessage = error.message;
    window.alert("Error : " + errorMessage);
  });
}

firebase.auth().onAuthStateChanged(function(user) {
  if (user) {
    // User is signed in.
    var user = firebase.auth().currentUser;
    var name, email, uid;

    if (user != null) {
      name = user.displayName;
      email = user.email;
      uid = user.uid;
    }
    window.alert("You're logged in as : " + email);  
  } else {
    // No user is signed in.
    window.alert("You're not logged in !");
  }
});

function logout(){
  firebase.auth().signOut();
}