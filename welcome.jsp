<% out.println(""); %>
    <html>

    <head>
        <title>Welcome Page</title>
        <style>
            marquee {
                color: brown;
            }

            body {
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-image: url("gec.jpg");
                background-size: 100% 100%;
            }

            .btn {
                height: 50px;
                width: 250px;
                font-size: 25px;
                justify-content: center;
                border-radius: 15px;
                position: absolute;
                top: 50%;
                left: 40%;
                background-color: #684853;
            }
        </style>
    </head>

    <body>
        <marquee behavior="alternate" direction="right" scrollamount="14">
            <h1>Welcome to our application...</h1>
        </marquee>
        <form action="customerCollectorReport.jsp">
            <input class="btn" type="submit" Value="Going to HomePage">
        </form>
    </body>

    </html>