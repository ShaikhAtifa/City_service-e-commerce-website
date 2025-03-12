<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Login Form</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap');
            *
            {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
            }
            body 
            {
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                flex-direction: column;
    /*            background: #f7c0b0;*/
                background: linear-gradient(0deg,transparent,#f2f6fc,#d8e0ed);

            }
            .box 
            {
                position: relative;
                width: 380px;
                height: 420px;
                background: #1c1c1c;
                border-radius: 8px;
                overflow: hidden;
            }
            .box::before 
            {
                content: '';
                z-index: 1;
                position: absolute;
                top: -50%;
                left: -50%;
                width: 380px;
                height: 420px;
                transform-origin: bottom right;
                background: linear-gradient(0deg,transparent,#45f3ff,#45f3ff);
                animation: animate 6s linear infinite;
            }
            .box::after 
            {
                content: '';
                z-index: 1;
                position: absolute;
                top: -50%;
                left: -50%;
                width: 380px;
                height: 420px;
                transform-origin: bottom right;
                background: linear-gradient(0deg,transparent,#45f3ff,#45f3ff);
                animation: animate 6s linear infinite;
                animation-delay: -3s;
            }
            @keyframes animate 
            {
                0%
                {
                    transform: rotate(0deg);
                }
                100%
                {
                    transform: rotate(360deg);
                }
            }
            form 
            {
                position: absolute;
                inset: 2px;
                background: #28292d;
                padding: 50px 40px;
                border-radius: 8px;
                z-index: 2;
                display: flex;
                flex-direction: column;
            }
            h2 
            {
                color: #45f3ff;
                font-weight: 500;
                text-align: center;
                letter-spacing: 0.1em;
            }
            .inputBox 
            {
                position: relative;
                width: 300px;
                margin-top: 35px;
            }
            .inputBox input 
            {
                position: relative;
                width: 100%;
                padding: 20px 10px 10px;
                background: transparent;
                outline: none;
                box-shadow: none;
                border: none;
                color: #23242a;
                font-size: 1em;
                letter-spacing: 0.05em;
                transition: 0.5s;
                z-index: 10;
            }
            .inputBox span 
            {
                position: absolute;
                left: 0;
                padding: 20px 0px 10px;
                pointer-events: none;
                font-size: 1em;
                color: #8f8f8f;
                letter-spacing: 0.05em;
                transition: 0.5s;
            }
            .inputBox input:valid ~ span,
            .inputBox input:focus ~ span 
            {
                color: #45f3ff;
                transform: translateX(0px) translateY(-34px);
                font-size: 0.75em;
            }
            .inputBox i 
            {
                position: absolute;
                left: 0;
                bottom: 0;
                width: 100%;
                height: 2px;
                background: #45f3ff;
                border-radius: 4px;
                overflow: hidden;
                transition: 0.5s;
                pointer-events: none;
                z-index: 9;
            }
            .inputBox input:valid ~ i,
            .inputBox input:focus ~ i 
            {
                height: 44px;
            }
            .links 
            {
                display: flex;
                justify-content: space-between;
            }
            .links a 
            {
                margin: 10px 0;
                font-size: 0.75em;
                color: #8f8f8f;
                text-decoration: beige;
            }
            .links a:hover, 
            .links a:nth-child(2)
            {
                color: #45f3ff;
            }
            button[type="submit"]
            {
                border: none;
                outline: none;
                padding: 11px 25px;
                background: #45f3ff;
                cursor: pointer;
                border-radius: 4px;
                font-weight: 600;
                width: 100px;
                margin-top: 10px;
            }
            button[type="submit"]:active 
            {
                opacity: 0.8;
            }
        </style>
    </head>
    <body>
        <div class="box">
            <form  action="registerDB.jsp" autocomplete="off" method="post">
                <h2>Login in</h2>
                           <input type="hidden" name="type" id="type" value="selectRecord" class="form-control">
                <div class="inputBox">
                    <input type="text" name="mobile" required="required" id="username">
                    <span>Userame</span>
                    <i></i>
                </div>
                <div class="inputBox">
                    <input type="password" name="password" required="required" id="password">
                    <span>Password</span>
                    <i></i>
                </div>
                <div class="links">
                    <a href="forgot.html">Forgot Password ?</a>

                    <a href="signup.html">Signup</a>
                </div>
                <!-- <button type="button" onclick="validateLogin()">Login</button> -->
                
                <!-- <input type="submit" value="Login" onclick="validateLogin()" > -->
               <button type="submit" onclick="validateLogin()" >Login</button>
              
                
            </form>
        </div>
        <!-- validate -->
        <script>
    function validateLogin() {
        // Perform your login validation logic here
        var username = document.getElementById('username').value;
        var password = document.getElementById('password').value;

        // Example: Check if username and password are correct (you should replace this with your actual validation logic)
        if (username === '' || password === '') {
            // Display an alert if login is successful
            alert('Please Enter valid credentials..!');
            event.preventDefault();

            // Redirect to the home page

            // You can also perform other actions here, such as updating the UI or making additional requests
        } else {
            // Display an alert if login fails
           return true;
        }
    }
    </script>
    <!-- validate end -->
    </body>
    </html>
    