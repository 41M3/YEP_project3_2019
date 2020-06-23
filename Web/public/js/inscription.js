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
    window.history.back(); 
}

function sendEmailVerification() {
    firebase.auth().currentUser.sendEmailVerification().then(function() {
      alert('Email Verification Sent!');
    });
}

/*
FIREBASE YOUTUBE TUTORIAL

(function() {
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
  
  const email = document.getElementById('email');
  const password = document.getElementById('password');
  const submitButton = document.getElementById('submit');

  //BUTTON

  submitButton.addEventListener('click', e => {
    const b_email = email.value;
    const b_password = password.value; 
    const auth = firebase.auth();

    window.alert("Infos reçues : " + b_email + "  " + b_password);
    const promise = auth.createUserWithEmailAndPassword(b_email, b_password);
    promise
      .catch(e => console.log(e.message));

    });

    firebase.auth().onAuthStateChanged(firebaseUser => {
      if (firebaseUser) {
        console.log(firebaseUser);
      } else {
        console.log("not logged in");
      }
    })

}());
*/