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
      document.getElementById("connect").hidden = true;
      document.getElementById("sign").hidden = true;
      document.getElementById("logout").hidden = false;
      document.getElementById("user").innerHTML = 'Bienvenue ' + user.email;
      document.getElementById("user").hidden = false;
      //window.alert("You're logged in as : " + email);  
    } else {
      // No user is signed in.
      document.getElementById("connect").hidden = false;
      document.getElementById("sign").hidden = false;
      document.getElementById("logout").hidden = true;
      document.getElementById("user").hidden = true;
      //window.alert("You're not logged in !");
    }
  });
  
  function logout(){
    firebase.auth().signOut();
  }

function handleSignUp() {
    var email = document.getElementById('email').value;
    var password = document.getElementById('password').value;

    if (email.length < 4) {
      alert('Please enter a correct email address.');
      return;
    }
    if (password.length < 4) {
      alert('Please enter a better password.');
      return;
    }
    firebase.auth().createUserWithEmailAndPassword(email, password).catch(function(error) {
      // Handle Errors here.
      var errorCode = error.code;
      var errorMessage = error.message;
      if (errorCode == 'auth/weak-password') {
        alert('The password is too weak.');
      } else {
        alert(errorMessage);
      }
      console.log(error);
    });
    //window.history.back(); 
}

function sendEmailVerification() {
    firebase.auth().currentUser.sendEmailVerification().then(function() {
      alert('Email Verification Sent!');
    });
}