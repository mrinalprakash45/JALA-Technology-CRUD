<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Jala_Technologies.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>JALA Academy</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: grey;
        }
        h6
        {
            background-color: yellow;
            margin-left: 500px;
            margin-right: 500px;
        }
        .login-box {
            border: 1px solid #ccc;
            padding: 20px;
            margin-left: 500px;
            margin-right: 500px;
            background-color: white;
        }
        #log
        {
            margin: 20px;

        }
        #log1 {
            margin: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        #forgot button
        {
            background-color: aliceblue;
            text-align: center;
            
        }
        #log1 button {
            background-color: navy;
            color: white;
            border: none;
            padding: 8px 16px;
            cursor: pointer;
            border-radius: 20px;
        }
        #log button {
            background-color: navy;
            color: white;
            border: none;
            padding: 8px 16px;
            cursor: pointer;
            text-align: center; 
        }
        .center {
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="center">
        <h1>JALA Academy</h1>
        <h2>Login Credentials</h2>
        <h5>Email: training@jalaacademy.com</h5>
        <h5>Password: jobprogram</h5>
        <h6>Learn Everything on Real-Time Scenarios</h6>

        <div class="login-box">
            <form id="LoginForm" runat="server">
                <h2>Login</h2>
                <div id="log">
                    <label for="txtUsername">Username:</label>
                    <input type="text" id="txtUsername" runat="server" />
                </div>
                <div id="log">
                    <label for="txtPassword">Password:</label>
                    <input type="password" id="txtPassword" runat="server" />
                </div>
                <div id="log1">
                    <div>
                        <input type="checkbox" id="chkRememberMe" runat="server" />
                        <label for="chkRememberMe">Remember Me</label>
                    </div>
                    <button type="submit" runat="server" onserverclick="Login_Click"><b>Login</b></button>
                </div>
                <div id="log">
                    <button onclick="window.location.href='forgotpassword.aspx'"><b>Forgot Password</b></button>
                </div>
                <div id="log">
                    <a href="adminlogin.aspx">Admin Login</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
