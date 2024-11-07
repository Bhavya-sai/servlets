<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Contact Us</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            background-color: #f0f2f5;
            font-family: Arial, sans-serif;
        }
        .contact-form {
            width: 100%;
            max-width: 500px;
            padding: 2rem;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        h2 {
            color: #333;
            margin-bottom: 1rem;
            font-size : 36px;
        }
        label {
            display: block;
            margin: 0.5rem 0 0.25rem;
            color: #333;
            text-align: left;
        }
        input[type="text"],
        input[type="email"],
        textarea {
            width: 100%;
            padding: 0.5rem;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-bottom: 1rem;
            font-size: 1rem;
            color: #333;
        }
        input[type="text"]:focus,
        input[type="email"]:focus,
        textarea:focus {
            outline: 2px solid #007bff;
        }
        .submit-btn {
            width: 100%;
            padding: 0.75rem;
            background-color: #28a745; 
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 1rem;
            cursor: pointer;
            margin-bottom: 0.5rem;
        }
        .submit-btn:hover {
            opacity: 0.9;
        }
        .login-btn {
            width: 100%;
            padding: 0.75rem;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 1rem;
            cursor: pointer;
        }
        .login-btn:hover {
            opacity: 0.9;
        }
        .error {
            color: #d9534f;
            font-size: 0.875rem;
            display: none;
        }
    </style>
</head>
<body>
    <div class="contact-form">
        <h2><b>Contact Us</b></h2>
        <form action="contactus" method="post">
            <label for="name"><b>Name:</b></label>
            <input type="text" id="name" name="name" required>
            <div class="error" id="nameError">Please enter your name.</div>

            <label for="email"><b>Email:</b></label>
            <input type="email" id="email" name="email" required>
            <div class="error" id="emailError">Please enter a valid email address.</div>

            <label for="message"><b>Message:</b></label>
            <textarea id="message" name="message" rows="4" required></textarea>
            <div class="error" id="messageError">Please enter your message.</div>
            <button type="submit" class="submit-btn">Submit Message</button>
            <button type="button" class="login-btn" onclick="window.location.href='login.jsp'">Login</button>
        </form>
    </div>
</body>
</html>
