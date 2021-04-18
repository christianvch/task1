import subprocess
from fastapi import FastAPI

app = FastAPI()
result = subprocess.run("echo Hello World $HOSTNAME", shell=True, stdout=subprocess.PIPE)
result_return = result.stdout.decode('utf-8')

@app.get("/square/{valor1}")
async def read_item(valor1 : int):
    return {"El cuadro de " + str(valor1) + " es " :  valor1**2 }

@app.get("/greetings")
async def read_item():
    return result_return
