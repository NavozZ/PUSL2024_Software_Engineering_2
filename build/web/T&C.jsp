<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>Terms and Conditions - Future Cinema</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #1E1E1E;
            color: #ffffff;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            background: #1E1E1E;
            padding: 20px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h1 {
            text-align: center;
            color: #E50914;
        }

        h2 {
            color: #ffffff;
            border-bottom: 2px solid #ddd;
            padding-bottom: 5px;
            margin-bottom: 10px;
        }

        p {
            line-height: 1.6;
            margin-bottom: 20px;
        }

        ol {
            padding-left: 20px;
            margin-bottom: 20px;
        }

        li {
            margin-bottom: 10px;
        }

        footer {
            text-align: center;
            margin-top: 40px;
            font-size: 0.9em;
            color: #777;
        }

        a {
            color: #007bff;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>

    </head>
    <body>
        <%@ include file="NavBar.jsp" %>
  
        <div class="container">
        <h1>Terms and Conditions</h1>
        <p><strong>Effective Date:</strong> [Insert Date]</p>

        <p>Welcome to Future Cinema! By accessing or using our website, you agree to comply with the following terms and conditions. Please read them carefully.</p>

        <ol>
            <li>
                <strong>Acceptance of Terms</strong>
                <p>By using Future Cinema?s website and services, you confirm that you have read, understood, and agreed to these Terms and Conditions. If you do not agree, please refrain from using our services.</p>
            </li>
            <li>
                <strong>Use of Services</strong>
                <p>You must be at least [Insert Minimum Age, e.g., 13 or 18] years old to use this website. You agree to use this website for lawful purposes only and comply with all applicable laws and regulations. You shall not use Future Cinema to:</p>
                <ul>
                    <li>Engage in fraudulent or misleading activities.</li>
                    <li>Post harmful, obscene, or otherwise inappropriate content.</li>
                </ul>
            </li>
            <li>
                <strong>Account Creation and Security</strong>
                <p>To access certain features, you may be required to create an account. You are responsible for maintaining the confidentiality of your account credentials. Future Cinema is not liable for any unauthorized use of your account.</p>
            </li>
            <li>
                <strong>Ticket Purchases and Refunds</strong>
                <p>All ticket purchases are subject to availability and confirmation. Refunds or exchanges may be offered under specific circumstances, as outlined in our refund policy. You agree to provide accurate payment information when making purchases.</p>
            </li>
            <li>
                <strong>Intellectual Property Rights</strong>
                <p>All content on this website, including text, graphics, logos, and multimedia, is the property of Future Cinema or its licensors. You may not reproduce, distribute, or exploit any content without prior written permission.</p>
            </li>
            <li>
                <strong>Third-Party Links</strong>
                <p>Future Cinema may contain links to third-party websites. We are not responsible for the content, accuracy, or practices of these external sites.</p>
            </li>
            <li>
                <strong>Limitation of Liability</strong>
                <p>Future Cinema shall not be held liable for:</p>
                <ul>
                    <li>Any technical issues that disrupt access to the site.</li>
                    <li>Losses or damages resulting from the use of our services.</li>
                </ul>
                <p>Use of this website is at your own risk.</p>
            </li>
            <li>
                <strong>Privacy Policy</strong>
                <p>Your use of the website is also governed by our Privacy Policy, which explains how we collect, use, and protect your data.</p>
            </li>
            <li>
                <strong>Changes to Terms and Conditions</strong>
                <p>Future Cinema reserves the right to update these Terms and Conditions at any time. Continued use of the site signifies your acceptance of the revised terms.</p>
            </li>
            <li>
                <strong>Governing Law</strong>
                <p>These Terms and Conditions are governed by the laws of [Insert Jurisdiction], and any disputes will be resolved in its courts.</p>
            </li>
        </ol>

        <footer>
            &copy; 2024 Future Cinema. All rights reserved.
        </footer>
    </div>
        <%@ include file="Footer.jsp" %>
    </body>
</html>
