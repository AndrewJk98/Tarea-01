<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Formulario</title>
<link rel="stylesheet" href="Styles.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Muli&display=swap">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500&display=swap">
</head>
<body>
<div class="container">
        <div class="header">
            <h2><center>SIGN UP</center></h2>
        </div>
        <form id="form" class="form">
        	<div class="form-control">
                <label for="fullname">Full Name</label>
                <input type="text" placeholder="George Washinton" id="fullname" />
                <i class="fas fa-check-circle"></i>
                <i class="fas fa-exclamation-circle"></i>
                <small>Error message</small>
            </div>
            <div class="form-control">
                <label for="username">Username</label>
                <input type="text" placeholder="Georgie" id="username" />
                <i class="fas fa-check-circle"></i>
                <i class="fas fa-exclamation-circle"></i>
                <small>Error message</small>
            </div>
            <div class="form-control">
                <label for="email">Email</label>
                <input type="email" placeholder="georgie_washinton@yahoo.es" id="email" />
                <i class="fas fa-check-circle"></i>
                <i class="fas fa-exclamation-circle"></i>
                <small>Error message</small>
            </div>
            <div class="form-control">
                <label for="password">Password</label>
                <input type="password" placeholder="Password" id="password"/>
                <i class="fas fa-check-circle"></i>
                <i class="fas fa-exclamation-circle"></i>
                <small>Error message</small>
            </div>
            <div class="form-control">
                <label for="password2">Confirm Password</label>
                <input type="password" placeholder="Confirm Password" id="password2"/>
                <i class="fas fa-check-circle"></i>
                <i class="fas fa-exclamation-circle"></i>
                <small>Error message</small>
            </div>
            <div>
            <input type="checkbox" name="terms" value="check"> I have read and agree to the Terms
            <small>Error message</small>
            </div>
            
            <button>Submit</button>
        </form>
    </div>
    
    <script>
    /**
     * 
     */
    const form = document.getElementById('form');
    const full = document.getElementById('fullname');
    const usuario = document.getElementById('username');
    const email = document.getElementById('email');
    const password = document.getElementById('password');
    const password2 = document.getElementById('password2');
	const chk = document.getElementById('terms')
    
    form.addEventListener('submit', e => {
    	e.preventDefault();
    	
    	checkInputs();
    });

    function checkInputs() {
    	// trim to remove the whitespaces
    	const fullValue = full.value.trim();
    	const usuarioValue = usuario.value.trim();
    	const emailValue = email.value.trim();
    	const passwordValue = password.value.trim();
    	const password2Value = password2.value.trim();
    	//const chkValue = chk.value.trim();
    	
    	if(fullValue === '') {
    		setErrorFor(full, 'Fullname is required');
    	} else {
    		setSuccessFor(full);
    	}
    	if(usuarioValue === '') {
    		setErrorFor(usuario, 'Username is required');
    	} else {
    		setSuccessFor(usuario);
    	}
    	
    	if(emailValue === '') {
    		setErrorFor(email, 'Email is required');
    	} else if (!isEmail(emailValue)) {
    		setErrorFor(email, 'Email unvalid');
    	} else {
    		setSuccessFor(email);
    	}
    	
    	if(passwordValue === '') {
    		setErrorFor(password, 'Password is required');
    	} else {
    		setSuccessFor(password);
    	}
    	
    	if(password2Value === '') {
    		setErrorFor(password2, 'Confirm Password is required');
    	} else if(passwordValue !== password2Value) {
    		setErrorFor(password2, 'Passwords do not match');
    	} else{
    		setSuccessFor(password2);
    	}
    	if(!this.chk.checked){
    		setErrorFor(chk, 'Accept terms is required');
    	}
    	else{
    		setSuccessFor(chk);
    	}
    		
    }

    function setErrorFor(input, message) {
    	const formControl = input.parentElement;
    	const small = formControl.querySelector('small');
    	formControl.className = 'form-control error';
    	small.innerText = message;
    }

    function setSuccessFor(input) {
    	const formControl = input.parentElement;
    	formControl.className = 'form-control success';
    }

    function isEmail(email) {
    	return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email);
    }
    </script>
</body>
</html>