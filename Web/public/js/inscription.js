function handleSignUp() {
    var email = document.getElementById('email').value;
    var password = document.getElementById('password').value;
    
    console.log(email);
    console.log(password);

    if (email.length < 4) {
      alert('Please enter an email address.');
      return;
    }
    if (password.length < 4) {
      alert('Please enter a password.');
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
}

function sendEmailVerification() {
    firebase.auth().currentUser.sendEmailVerification().then(function() {
      alert('Email Verification Sent!');
    });
}