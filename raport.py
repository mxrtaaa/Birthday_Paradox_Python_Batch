from datetime import datetime

date_display = datetime.now().strftime("%d.%m.%Y %H:%M:%S")
output_file = open(f"raport.html", "w+", encoding="utf-8")

output_file.write(f"""
<html>
    <head>
        <meta charset="utf-8">
        <style>
            body {{
                text-align: center;
                background-color: #FBF2FF;
                color: #620E5E;
                font-family: Trebuchet MS, sans-serif;
            }}
            h1 {{
                padding-top: 50px
            }}
            h3 {{
                padding-top: 25px
            }}
        </style>
        <title>Paradoks urodzin</title>
    </head>
    <body>
        <h1>Rozwiązanie problemu urodzin</h1>
        <h3>Raport {date_display}</h3>
        <p>""")

with open(f"output/out.txt", "r") as file:
    for line in file:
        output_file.write(line)
        output_file.write("<br>")
output_file.write("""
        </p>
        <img src="birthday-snake.png", height=100px, style="padding: 25px">
    </body>
</html>""")

output_file.close()