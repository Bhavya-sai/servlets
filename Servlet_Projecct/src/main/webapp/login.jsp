<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .login-container {
            background-color: #fff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 500px;
            text-align: center;
        }
        h1 {
            font-size: 30px;
            color: #333;
            font-weight: bold;
            margin-bottom: 25px;
        }
        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }
        
        .form-group label {
            font-size: 16px;
            margin-bottom: 4px;
            display: block; 
        }
        
        .form-group input {
            width: 100%; /* Full width for the input */
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #28a745;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            font-size: 18px;
            cursor: pointer;
            width: 100%;
            margin-top: 15px;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h1>Admin Login</h1><br>
        <form action="login" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="txtEmail"><b>Enter Email:</b></label>
                <input type="email" id="email" name="email" required>
            </div>
            <br>
            <div class="form-group">
                <label for="txtPwd"><b>Enter Password:</b></label>
                <input type="password" id="password" name="password" required>
            </div>
            <input type="submit" value="Login">
        </form>
    </div>

    <script>
        function validateForm() {
            const emailTxt = document.getElementById("email").value.trim();
            const passwordTxt = document.getElementById("password").value.trim();
            if (emailTxt === "" || passwordTxt === "") {
                alert("Please fill in all fields.");
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
